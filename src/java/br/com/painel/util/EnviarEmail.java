/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Rafael Monteiro
 */
public class EnviarEmail {
    
    
    /**
     * 
     * @param destino coloque o e-mail que da pessoa que deseja enviar
     * @param nomeDestino o nome do destino
     * @param assunto o assunto do email
     * @param mensagem a mensagem do email
     * @throws EmailException 
     */
    public void enviarEmail(String destino, String nomeDestino, String assunto, String mensagem) throws EmailException{
    
	SimpleEmail email = new SimpleEmail();
        email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail
        email.addTo(destino, nomeDestino); //destinatário
        email.setFrom("rafaelvulner@gmail.com", "Recuperação de senha"); // remetente
        email.setSubject(assunto); // assunto do e-mail
        email.setMsg(mensagem); //conteudo do e-mail
	email.setAuthentication("rafaelvulner", "rafad18m01");
	email.setSmtpPort(465);
		email.setSSL(true);
		email.setTLS(true);
        email.send(); //envia o e-mail
    }
    
}
