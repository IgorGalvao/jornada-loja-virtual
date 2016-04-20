package br.com.caelum.jornada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView cadastroLivros() {
		ModelAndView mv = new ModelAndView("admin/cadastro_categorias");
		List<Categoria> lista = dao.listaTodos();
		mv.addObject("categorias", lista);
		return mv;
	}	
	
	@RequestMapping("/admin/cadastraCategoria")
	public String cadastraCategoria(Categoria categoria) {
		dao.cadastra(categoria);
		return "redirect:/admin/cadastroCategorias";
	}
	
	@RequestMapping("/admin/removeCategoria")
	public String removeCategoria(Integer id) {
		Categoria categoria = dao.buscaPorId(id);
		dao.remove(categoria);
		return "redirect:/admin/cadastroCategorias";
	}
	
}
