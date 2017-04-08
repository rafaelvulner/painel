/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.dao;

import br.com.painel.modelo.PreAtendimento;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Rafael Monteiro
 */
public class PreAtendimentoDAO {
    
    private EntityManager getEM(){
    
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PainelADMPU");
        
        return factory.createEntityManager();
    
    }
    
    public void cadastrarSenha(PreAtendimento pre){
	
	EntityManager em = getEM();
        
        em.getTransaction().begin();
        em.persist(pre);
        em.getTransaction().commit();
    
	
    }
    
}
