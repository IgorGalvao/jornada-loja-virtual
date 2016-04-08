package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Livro;

@Repository
public class LivroDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void cadastra(Livro livro) {
		System.out.println("cadastro");
		manager.persist(livro);
	}
	
	public void atualiza(Livro livro) {
		System.out.println(livro.getId());
		System.out.println("atualiza");
		manager.merge(livro);
	}
	
	public void remove(Livro livro) {
		Livro livroRemover = buscaPorId(livro.getId());
		manager.remove(livroRemover);
	}
	
	public Livro buscaPorId(Integer id) {
		return manager.find(Livro.class, id);
	}
	
	public List<Livro> listaTodos() {
		return manager.createQuery("select l from Livro l").getResultList();
	}
}
