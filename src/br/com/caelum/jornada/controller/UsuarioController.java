package br.com.caelum.jornada.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/admin/cadastroUsuarios")
	public String cadastroUsuarios(@ModelAttribute("usuario") Usuario usuario, BindingResult result, Model model) {
		List<Usuario> lista = dao.listaTodos();
		model.addAttribute("usuarios", lista);
		return "admin/cadastro_usuarios";
	}
	
	@RequestMapping("/admin/cadastraUsuario")
	public String cadastraUsuario(@Valid Usuario usuario, BindingResult result, Model model) {
		if(!result.hasErrors()) {
			dao.cadastra(usuario);
			return "redirect:/admin/cadastroUsuarios";
		}
		return cadastroUsuarios(usuario, result, model);
	}
	
	@RequestMapping("/admin/alteraUsuario")
	public String preparaAlteracao(@ModelAttribute("usuario") Usuario usuario, BindingResult result, Model model) {
		if(usuario.getLogin() == null) {
			usuario = dao.buscaPorId(usuario.getId());
		}
		model.addAttribute("usuario", usuario);
		return "admin/edicao_usuario";
	}
	
	@RequestMapping("/admin/concluirAlteracaoUsuario")
	public String alterarUsuario(@Valid Usuario usuario, BindingResult result, Model model) {
		if(!result.hasErrors()) {
			dao.atualiza(usuario);
			return "redirect:/admin/cadastroUsuarios";
		}
		return preparaAlteracao(usuario, result, model);
	}
	
	@RequestMapping("/admin/removeUsuario")
	public String removeUsuario(Integer id) {
		Usuario usuario = dao.buscaPorId(id);
		dao.remove(usuario);
		return "redirect:/admin/cadastroUsuarios";
	}

}
