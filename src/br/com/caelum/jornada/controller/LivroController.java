package br.com.caelum.jornada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.jornada.dao.LivroDAO;
import br.com.caelum.jornada.modelo.Livro;

@Transactional
@Controller
public class LivroController {

	private LivroDAO dao;
	
	@Autowired
	public LivroController(LivroDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/cadastroLivros")
	public String metodo() {
		return "cadastro_livros";
	}
	
	@RequestMapping("/cadastraLivro")
	public String cadastraLivro(Livro livro) {
		dao.cadastra(livro);
		return "redirect:listaLivros";
	}
	
	@RequestMapping("/listaLivros")
	public ModelAndView listaLivros() {
		List<Livro> lista = dao.listaTodos();
		ModelAndView mv = new ModelAndView("lista_livros");
		mv.addObject("livros", lista);
		return mv;
	}

	@RequestMapping("/removeLivro")
	public String removeLivro(Integer id) {
		Livro livro = dao.buscaPorId(id);
		dao.remove(livro);
		return "redirect:listaLivros";
	}

}
