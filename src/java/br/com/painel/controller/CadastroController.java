/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.controller;

import br.com.painel.dao.CadastroDAO;
import br.com.painel.modelo.Cadastro;
import com.google.gson.Gson;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Rafael Monteiro
 */

@Controller
public class CadastroController {
    
    @RequestMapping("/cadastro")
    public String cadastrarUsuarios(){
    
        return "cadastro";
    }
    
    @RequestMapping("/consultar")
    public String consultar(){
    
        return "consulta";
    }
    
    @RequestMapping("/alterarDados")
    public String alterarDados(){
    
        return "alterar";
    }
    
    @RequestMapping("/consultarPorNome")
    public String consultarPorNome(){
    
        return "cadastroPorNome";
    }
    
    @RequestMapping("/usuario")
    public String usuario(){
    
        return "usuario";
    }
    
    @RequestMapping(value = "/cadastrar", method = RequestMethod.POST)
    public String cadastrar(@RequestParam("file") MultipartFile file, Cadastro cadastro) throws IOException{
	
	CadastroDAO dao = new CadastroDAO();
	
	  if (!file.isEmpty()) { //Verifica se o campo de imagem não está vazio
        BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
        
	
	String nome = cadastro.getCpf();
        
        File destination = new File("C:\\Users\\rafael\\Documents\\NetBeansProjects\\PainelADM\\web\\resources\\uploads\\"+nome+".jpg"); // something like C:/Users/tom/Documents/nameBasedOnSomeId.png
	
	
        ImageIO.write(src, "jpg", destination);
	
	cadastro.setFoto("resources/uploads/"+nome+".jpg");
	
	dao.cadastrarUsuarios(cadastro);
        
        
    }
	
	
	return "cadastro";
    }
    
    @RequestMapping("/retorno")
    public @ResponseBody String retornarCadastro(){
	Gson gson = new Gson();
	CadastroDAO dao = new CadastroDAO();
	
	String retorno = gson.toJson(dao.consultarCadastros());
	
	return retorno;
    
	
    }
    
    @RequestMapping("/retornarNomes")
    public @ResponseBody String retornarNomes(@RequestParam("nome") String nome){
	Gson gson = new Gson();
	CadastroDAO dao = new CadastroDAO();
	
	String retorno = gson.toJson(dao.consultarPorNome(nome));
	
        return retorno;
	
    }
    
    @RequestMapping("/buscarUsuario")
    public @ResponseBody String buscarUsuario(@RequestParam("id") int id){
	Gson gson = new Gson();
	CadastroDAO dao = new CadastroDAO();
	
	String retorno = gson.toJson(dao.consultarPorId(id));
	
	return retorno;
    
	
    }
    
    @RequestMapping("/alterarUsuario")
    public @ResponseBody String alterarUsuario(@RequestParam("id") int id, Cadastro cadastro){
	
	CadastroDAO dao = new CadastroDAO();
	cadastro.setId(id);
	dao.updateUsuario(cadastro);
	
	
	
	return "<div class='alert alert-success'>Atualizado com sucesso!";
    
	
    }
    
    @RequestMapping("/alterarImagem")
    public String alterarImagem(@RequestParam("foto") MultipartFile file,int id) throws IOException{
	CadastroDAO dao = new CadastroDAO();
	Cadastro cadastro = new Cadastro();
	String nome = null;
	cadastro = dao.consultarPorId(id);
	
	if (!file.isEmpty()) { //Verifica se o campo de imagem não está vazio
        BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
        
	 
	Random gerador = new Random();
	      for (int i = 0; i < 10; i++) {
		   nome = Integer.toString(gerador.nextInt());
	      }
	
        
        File destination = new File("C:\\Users\\rafael\\Documents\\NetBeansProjects\\PainelADM\\web\\resources\\uploads\\"+nome+".jpg"); // something like C:/Users/tom/Documents/nameBasedOnSomeId.png
	
	
        ImageIO.write(src, "jpg", destination);
	
	cadastro.setId(id);
	cadastro.setFoto("resources/uploads/"+nome+".jpg");
	
	dao.updateUsuario(cadastro);
	
	
        
        
    }
	
	
	
	
	
	return "redirect:alterarDados?Id="+id;

    
	
    }
    
    
}
