package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.Cupom;

@Repository
public class CupomDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void cadastra(Cupom cupom) {
		manager.persist(cupom);
	}
	
	public void atualiza(Cupom cupom) {
		manager.merge(cupom);
	}
	
	public void remove(Cupom cupom) {
		Cupom cupomRemover = buscaPorId(cupom.getId());
		manager.remove(cupomRemover);
	}
	
	public Cupom buscaPorId(Integer id) {
		return manager.find(Cupom.class, id);
	}
	
	public List<Cupom> listaTodos() {
		return manager.createQuery("select c from Cupom c").getResultList();
	}
}
