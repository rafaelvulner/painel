/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.painel.util;

/**
 *
 * @author Rafael Monteiro
 */
public class TipoProduto {
    
    public enum produtos{
    
	WheyProtein("Whey protein"), 
	Glutamina("Glutamina");
	
	private String nome;

	produtos(String nome) {
	    this.nome = nome;
	}

	public String getNome() {
	    return nome;
	}

	public void setNome(String nome) {
	    this.nome = nome;
	}
	
	
    }
    
}
