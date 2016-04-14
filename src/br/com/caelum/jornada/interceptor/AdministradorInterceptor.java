package br.com.caelum.jornada.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.caelum.jornada.dao.UsuarioDAO;
import br.com.caelum.jornada.modelo.Perfil;
import br.com.caelum.jornada.modelo.Usuario;

public class AdministradorInterceptor extends HandlerInterceptorAdapter {

	private UsuarioDAO dao;
	@Autowired
	public AdministradorInterceptor(UsuarioDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		Perfil perfil = dao.buscaPerfil(usuario);
		
		if(perfil == Perfil.PADRAO) {
			response.sendRedirect("../acessoNegado");
			return false;
		}
		
		return true;
	}
}
