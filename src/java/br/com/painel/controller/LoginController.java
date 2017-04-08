/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.controller;

import br.com.painel.dao.UsuarioDAO;
import br.com.painel.modelo.Login;
import br.com.painel.modelo.Usuario;
import br.com.painel.util.EnviarEmail;
import javax.servlet.http.HttpSession;
import org.apache.commons.mail.EmailException;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Rafael Monteiro
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login() {

	return "login";
    }
    
    @RequestMapping("/recuperar")
    public String recuperar() {

	return "recuperar";
    }
    
     @RequestMapping("/registro")
    public String registro() {

	return "registro";
    }

    @RequestMapping("/recuperarSenha")
    public @ResponseBody String recuperarSenha(Usuario usuario) throws EmailException{
	UsuarioDAO dao = new UsuarioDAO();
	JSONObject json = new JSONObject();
	
	if (dao.verificarEmail(usuario)) {
	    Usuario usu;
	    EnviarEmail email = new EnviarEmail();
	    usu = dao.recuperarSenha(usuario);
	    
	    String mensagem = "Usuario: "+usu.getLogin().getUsername()+"\n Senha: "+usu.getLogin().getSenha()+"\n Não responder esse email, em caso de dúvidas entre em contato com o adminstrador.";
	    
	    email.enviarEmail(usuario.getEmail(), usu.getNome(),"Recuperação de senha" ,mensagem );
	    
	    json.put("retorno", "Sua senha foi enviada para seu email");
	    return json.toString();
	   
	
	}
    
	
        json.put("retorno", "Email nao cadastrado!");
	return json.toString();
    }
    
    @RequestMapping("/registrar")
    public String registroUsuario(Login login, Usuario usuario, Model model){
	UsuarioDAO dao = new UsuarioDAO();
	
	if (dao.verificarEmail(usuario)) {
	   
	    model.addAttribute("email", "Email já existe!");
	    return "registro";
	   
	}if (dao.verificarUsuario(login)) {
	    model.addAttribute("username", "Usuario já existe!");
	    return "registro";
	}
    
	
        usuario.setLogin(login);
	dao.cadastrarUsuario(usuario);
	model.addAttribute("sucesso", "<div class='alert alert-success'>Cadastrado com sucesso! clique <a href='login'>aqui</a> para logar</div>");
	return "registro";
    }
	
	
    @RequestMapping("efetuaLogin")
    public String efetuaLogin(Login login, HttpSession session, Model model) {
	if (new UsuarioDAO().consultarUsuario(login)) {
	    session.setAttribute("usuarioLogado", login);
	    return "index";
	}
	
	model.addAttribute("retorno", "<div class='alert alert-danger'>usuario ou senha invalida</div>");
	return "login";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:index";
    }

}
