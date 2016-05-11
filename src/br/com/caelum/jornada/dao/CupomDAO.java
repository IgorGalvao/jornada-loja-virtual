package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.Cupom;
import br.com.caelum.jornada.modelo.Usuario;

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
	
	public Cupom buscaPorCodigo(String codigoCupom) {
		try {
			Query query = manager.createQuery("select c from Cupom c where c.codigo = :codigo");
			query.setParameter("codigo", codigoCupom);
			return (Cupom) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
		
	}

	public List<Cupom> listaTodos() {
		return manager.createQuery("select c from Cupom c").getResultList();
	}

}
