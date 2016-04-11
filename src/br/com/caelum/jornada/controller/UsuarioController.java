package br.com.caelum.jornada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.jornada.dao.UsuarioDAO;
import br.com.caelum.jornada.modelo.Usuario;

@Transactional
@Controller
public class UsuarioController {

	private UsuarioDAO dao;
	
	@Autowired
	public UsuarioController(UsuarioDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/cadastroUsuarios")
	public String metodo() {
		return "cadastro_usuarios";
	}
	
	@RequestMapping("/cadastraUsuario")
	public String cadastraUsuario(Usuario usuario) {
		dao.cadastra(usuario);
		return "redirect:listaUsuarios";
	}
	
	@RequestMapping("/listaUsuarios")
	public ModelAndView listaUsuarios() {
		List<Usuario> lista = dao.listaTodos();
		ModelAndView mv = new ModelAndView("lista_usuarios");
		mv.addObject("usuarios", lista);
		return mv;
	}

	@RequestMapping("/alteraUsuario")
	public ModelAndView preparaAlteracao(Integer id) {
		Usuario usuario = dao.buscaPorId(id);
		ModelAndView mv = new ModelAndView("cadastro_usuarios");
		mv.addObject("usuario", usuario);
		return mv;
	}
	
	@RequestMapping("/concluirAlteracaoUsuario")
	public String alterar(Usuario usuario) {
		dao.atualiza(usuario);
		return "redirect:listaUsuarios";
	}
	
	@RequestMapping("/removeUsuario")
	public String removeUsuario(Integer id) {
		Usuario usuario = dao.buscaPorId(id);
		dao.remove(usuario);
		return "redirect:listaUsuarios";
	}

}
