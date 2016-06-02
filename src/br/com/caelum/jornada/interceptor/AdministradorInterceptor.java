package br.com.caelum.jornada.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.caelum.jornada.modelo.Perfil;
import br.com.caelum.jornada.modelo.Usuario;

public class AdministradorInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller) throws Exception {

		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		
		if(usuario.getPerfil() == Perfil.PADRAO) {
			response.sendRedirect("../acessoNegado");
			return false;
		}
		
		return true;
	}
}
