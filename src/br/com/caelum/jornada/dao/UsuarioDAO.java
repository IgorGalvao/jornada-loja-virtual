package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.Usuario;

@Repository
public class UsuarioDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void cadastra(Usuario usuario) {
		manager.persist(usuario);
	}
	
	public void atualiza(Usuario usuario) {
		manager.merge(usuario);
	}
	
	public void remove(Usuario usuario) {
		Usuario usuarioRemover = buscaPorId(usuario.getId());
		manager.remove(usuarioRemover);
	}
	
	public Usuario buscaPorId(Integer id) {
		return manager.find(Usuario.class, id);
	}
	
	public List<Usuario> listaTodos() {
		return manager.createQuery("select u from Usuario u").getResultList();
	}
}
