package br.com.caelum.jornada.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.jornada.dao.UsuarioDAO;
import br.com.caelum.jornada.modelo.Usuario;

@Controller
public class LoginController {

	private UsuarioDAO dao;
	
	@Autowired
	public LoginController(UsuarioDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) {
		if(dao.existeUsuario(usuario)) {
			Usuario usuarioSalvo = dao.buscaPorLogin(usuario.getLogin());
			session.setAttribute("usuarioLogado", usuarioSalvo);
			return "redirect:listaLivros";
		}
		return "redirect:login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	@RequestMapping("/acessoNegado")
	public String acessoNegado() {
		return "erro/acesso_negado";
	}
}
