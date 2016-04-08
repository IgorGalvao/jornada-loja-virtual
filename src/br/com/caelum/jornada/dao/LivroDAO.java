package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import br.com.caelum.jornada.modelo.Livro;

public class LivroDAO {
	
	private final EntityManager manager = Persistence.createEntityManagerFactory("lojavirtual").createEntityManager();
	
	public void cadastra(Livro livro) {
		manager.getTransaction().begin();
		this.manager.persist(livro);
		manager.getTransaction().commit();
	}
	
	public void remove(Livro livro) {
		manager.getTransaction().begin();
		this.manager.remove(livro);
		manager.getTransaction().commit();
	}
	
	public Livro buscaPorId(Integer id) {
		return this.manager.find(Livro.class, id);
	}
	
	public List<Livro> listaTodos() {
		return this.manager.createQuery("select l from Livro l").getResultList();
	}
}
