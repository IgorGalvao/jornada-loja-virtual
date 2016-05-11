package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Categoria;

@Repository
public class CategoriaDAO {
	
	@PersistenceContext
	private EntityManager manager;
	@Autowired
	private LivroDAO livroDao;
	
	public void cadastra(Categoria categoria) {
		manager.persist(categoria);
	}
	
	public boolean remove(Categoria categoria) {
		Categoria categoriaRemover = buscaPorId(categoria.getId());
		if(livroDao.existemLivrosCom(categoria)) {
			return false;
		}
			manager.remove(categoriaRemover);
			return true;
	}
	
	public Categoria buscaPorId(Integer id) {
		return manager.find(Categoria.class, id);
	}
	
	public List<Categoria> listaTodos() {
		return manager.createQuery("select c from Categoria c").getResultList();
	}
}
