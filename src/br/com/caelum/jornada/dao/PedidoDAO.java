package br.com.caelum.jornada.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Pedido;

@Repository
public class PedidoDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void cadastra(Pedido pedido) {
		manager.persist(pedido);
	}

}
