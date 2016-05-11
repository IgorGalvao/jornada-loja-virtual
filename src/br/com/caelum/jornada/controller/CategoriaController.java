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

import br.com.caelum.jornada.dao.CategoriaDAO;
import br.com.caelum.jornada.modelo.Categoria;

@Transactional
@Controller
public class CategoriaController {

	private CategoriaDAO dao;
	
	@Autowired
	public CategoriaController(CategoriaDAO dao) {
		this.dao = dao;
	}

	@RequestMapping("/admin/cadastroCategorias")
	public String cadastroCategorias(@ModelAttribute("categoria") Categoria categoria, BindingResult result, Model model) {
		List<Categoria> lista = dao.listaTodos();
		model.addAttribute("categorias", lista);
		return "admin/cadastro_categorias";
	}	
	
	@RequestMapping("/admin/cadastraCategoria")
	public String cadastraCategoria(@Valid Categoria categoria, BindingResult result, Model model) {
		if(!result.hasErrors()) {
			dao.cadastra(categoria);
			return "redirect:/admin/cadastroCategorias";
		}
		return cadastroCategorias(categoria, result, model);
	}
	
	@RequestMapping("/admin/removeCategoria")
	public String removeCategoria(Integer id, Model model) {
		Categoria categoria = dao.buscaPorId(id);
		if(!dao.remove(categoria)) {
			model.addAttribute("erro", "Categoria está em uso e não pode ser removida");
		}
		return "forward:/admin/cadastroCategorias";
	}
	
}
