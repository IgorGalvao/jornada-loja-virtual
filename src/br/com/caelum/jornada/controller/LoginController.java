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
			session.setAttribute("usuarioLogado", usuario);
			return "cadastro_livros";
		}
		return "redirect:login";
	}
}
