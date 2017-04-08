/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.controller;

import br.com.painel.dao.PreAtendimentoDAO;
import br.com.painel.modelo.PreAtendimento;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Rafael Monteiro
 */

@Controller
public class PreAtendimentoController {
    
@RequestMapping("/senha")    
public String senha(){


    return "senha";
}

@RequestMapping("/cadastrarSenha")
public @ResponseBody String cadastrarSenha(PreAtendimento pre){
    
    PreAtendimentoDAO dao = new PreAtendimentoDAO();
    
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String data = sdf.format(d);
    sdf = new SimpleDateFormat("HH:mm:ss");
    String hora = sdf.format(d);
    
    try {
	pre.setData(data);
	pre.setHora(hora);
	dao.cadastrarSenha(pre);
    } catch (Exception e) {
	System.out.println("Erro ao cadastrar "+e);
	
    }
    
    String json1 = "{\"retorno\":\"Cadastrado com sucesso!!\"}";
    return json1;
}



}

