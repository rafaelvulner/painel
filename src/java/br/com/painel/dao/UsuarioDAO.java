/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.dao;

import br.com.painel.modelo.Login;
import br.com.painel.modelo.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Rafael Monteiro
 */
public class UsuarioDAO {
    
      private EntityManager getEM(){
    
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PainelADMPU");
        
        return factory.createEntityManager();
    
    }
      
      public void cadastrarUsuario(Usuario usuario){
	  EntityManager em = getEM();
        
          em.getTransaction().begin();
          em.persist(usuario);
          em.getTransaction().commit();
      
      };
      
      public boolean consultarUsuario(Login log){
      
	  boolean retorno = false;
	  
	  EntityManager em = getEM();
	  
	  try {
	  Query query = em.createQuery("select t from Login t where t.username=:usuario and t.senha=:senha");
	  
	  query.setParameter("usuario", log.getUsername());
	  query.setParameter("senha", log.getSenha());
	
	  Login login = (Login) query.getSingleResult();
	  if (login.getUsername().equals(log.getUsername())&&login.getSenha().equals(log.getSenha())) {
	      retorno = true;
	  }
	  } catch (Exception e) {
	      System.out.println("Usuario não existe");
	  }
	  
          return retorno;
      }
      
      public boolean verificarEmail(Usuario usuario){
      
	  boolean retorno = false;
	  
	  EntityManager em = getEM();
	  
	  try {
	  Query query = em.createQuery("select t from Usuario t where t.email=:email");
	  
	  query.setParameter("email", usuario.getEmail());
	  
	
	  Usuario usu = (Usuario) query.getSingleResult();
	  
	 
	  if (usu.getEmail().equals(usuario.getEmail().toLowerCase())) {
	      retorno = true;
	  }
	  } catch (Exception e) {
	      System.out.println("Usuario não existe");
	  }
  
          return retorno;
      }
      
       public boolean verificarUsuario(Login login){
      
	  boolean retorno = false;
	  
	  EntityManager em = getEM();
	  
	  try {
	  Query query = em.createQuery("select t from Login t where t.username=:username");
	  
	  query.setParameter("username", login.getUsername());
	  
	
	  Login log = (Login) query.getSingleResult();
	  
	 
	  if (log.getUsername().equals(login.getUsername())) {
	      retorno = true;
	  }
	  } catch (Exception e) {
	      System.out.println("Usuario não existe");
	  }

          return retorno;
      }
       
       public Usuario recuperarSenha(Usuario usuario){
	   
	   EntityManager em = getEM();
	   Query query = em.createQuery("SELECT U FROM Usuario U JOIN FETCH U.login WHERE U.email=:email");
	   query.setParameter("email", usuario.getEmail());
	   
	   return (Usuario) query.getSingleResult();
	   
	   
       }
      
      
      
      
    
}
