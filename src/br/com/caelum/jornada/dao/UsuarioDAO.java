package br.com.caelum.jornada.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.caelum.jornada.modelo.Perfil;
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
	
	public Perfil buscaPerfil(Usuario usuario) {
		Query query = manager.createQuery("select u from Usuario u where u.login = :login");
		query.setParameter("login", usuario.getLogin());
		Usuario retorno = (Usuario) query.getSingleResult();
		return retorno.getPerfil();
	}

	public List<Usuario> listaTodos() {
		return manager.createQuery("select u from Usuario u").getResultList();
	}

	public boolean existeUsuario(Usuario usuario) {
		if(usuario != null) {
			Query query = manager.createQuery("select u from Usuario u where u.login = :login and u.senha = :senha");
			query.setParameter("login", usuario.getLogin());
			query.setParameter("senha", usuario.getSenha());
			Usuario retorno;
			try {
				retorno = (Usuario) query.getSingleResult();
				return true;
			} catch (NoResultException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

}
