package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Categoria;
import br.com.caelum.jornada.modelo.Livro;

@Repository
public class LivroDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void cadastra(Livro livro) {
		manager.persist(livro);
	}
	
	public void atualiza(Livro livro) {
		manager.merge(livro);
	}
	
	public void remove(Livro livro) {
		Livro livroRemover = buscaPorId(livro.getId());
		manager.remove(livroRemover);
	}
	
	public Livro buscaPorId(Integer id) {
		return manager.find(Livro.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Livro> listaTodos() {
		return manager.createQuery("select l from Livro l").getResultList();
	}

	@SuppressWarnings("unchecked")
	public boolean existemLivrosCom(Categoria categoria) {
		List<Livro> livros = manager.createQuery("select l from Livro l where l.categoria = :categoria")
				.setParameter("categoria", categoria).getResultList();
		return !livros.isEmpty();
	}
}
