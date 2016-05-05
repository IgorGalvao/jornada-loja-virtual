package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Categoria;

@Repository
public class CategoriaDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void cadastra(Categoria categoria) {
		manager.persist(categoria);
	}
	
	public void remove(Categoria categoria) {
		Categoria categoriaRemover = buscaPorId(categoria.getId());
		manager.remove(categoriaRemover);
	}
	
	public Categoria buscaPorId(Integer id) {
		return manager.find(Categoria.class, id);
	}
	
	public List<Categoria> listaTodos() {
		return manager.createQuery("select c from Categoria c").getResultList();
	}
}
