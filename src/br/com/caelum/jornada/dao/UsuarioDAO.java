package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

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

	@SuppressWarnings("unchecked")
	public List<Usuario> listaTodos() {
		return manager.createQuery("select u from Usuario u").getResultList();
	}

	public boolean existeUsuario(Usuario usuario) {
		if(usuario == null)
			return false;
		
		Query query = manager.createQuery("select u from Usuario u where u.login = :login and u.senha = :senha")
			.setParameter("login", usuario.getLogin())
			.setParameter("senha", usuario.getSenha());
		try {
			query.getSingleResult();
			return true;
		} catch (NoResultException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Usuario buscaPorLogin(String login) {
		Query query = manager.createQuery("select u from Usuario u where u.login = :login");
		query.setParameter("login", login);
		return (Usuario) query.getSingleResult();
	}

}
