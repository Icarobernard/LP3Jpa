/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import dao.DAO;
import java.util.List;
import javax.persistence.Entity;



@Entity
public class Produto implements Serializable{
    private static final long serialVersionUID =1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    
    private Long id;   
    private String nome;
    private double preco;
    


    public Produto(Long id, String nome, double preco) {
        this.id = id;
        this.nome = nome;
        this.preco = preco;
        
    }


    
    public Produto(){
        
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
    
    public void save() throws NoSuchMethodException{
      DAO.getInstance().save(this);
    }
    
        public void remove() throws NoSuchMethodException{
       DAO.getInstance().remove(this);
    }
        
   public static Produto find(Long id) throws ClassNotFoundException{
       return (Produto)DAO.getInstance().find(id);
   } 
   
   public static List<Object> findAll() throws ClassNotFoundException{
       return DAO.getInstance().findAll();
   }

    
    
    
}
