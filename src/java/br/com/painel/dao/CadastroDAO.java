/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.dao;

import br.com.painel.modelo.Cadastro;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

/**
 *
 * @author Rafael Monteiro
 */
public class CadastroDAO {
    
    private EntityManager getEM(){
    
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PainelADMPU");
        
        return factory.createEntityManager();
    
    }
    
    public void cadastrarUsuarios(Cadastro cadastro){
    
        EntityManager em = getEM();
        
        em.getTransaction().begin();
        em.persist(cadastro);
        em.getTransaction().commit();
        
    }
    
    public List<Cadastro> consultarCadastros(){
	
	EntityManager em = getEM();
	
        CriteriaQuery criteriaQuery = em.getCriteriaBuilder().createQuery();
        criteriaQuery.select(criteriaQuery.from(Cadastro.class));
 
        List<Cadastro> result = em.createQuery(criteriaQuery).getResultList();
	
	return result;
	
    }
    
    public List<Cadastro> consultarPorNome(String nome){
       
	Query query = getEM().createQuery("select p from Cadastro p where p.nome like :nome");
	query.setParameter("nome", "%"+nome+"%");
	
	return query.getResultList();
    }
    
    public Cadastro consultarPorId(int id){
       
	EntityManager em = getEM();
	
	Cadastro cadastro = em.find(Cadastro.class, id);
	
	return cadastro;
	
    }
    
    public void updateUsuario(Cadastro cadastro){
	
	EntityManager em = getEM();
	
        em.getTransaction().begin();
        em.merge(cadastro);
        em.getTransaction().commit();
	
    }
    
}
