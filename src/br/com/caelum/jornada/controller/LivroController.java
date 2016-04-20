package br.com.caelum.jornada.controller;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.jornada.dao.CategoriaDAO;
import br.com.caelum.jornada.dao.LivroDAO;
import br.com.caelum.jornada.modelo.Categoria;
import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.TipoLivro;

@Transactional
@Controller
public class LivroController {

	private LivroDAO dao;
	private CategoriaDAO categoriaDao;
	
	@Autowired
	public LivroController(LivroDAO dao, CategoriaDAO categoriaDao) {
		this.dao = dao;
		this.categoriaDao = categoriaDao;
	}
	
	@RequestMapping("/admin/cadastroLivros")
	public ModelAndView cadastroLivros(@ModelAttribute("livro") @Valid Livro livro, BindingResult result, Model model) {
		ModelAndView mv = new ModelAndView("admin/cadastro_livros");

		List<TipoLivro> tiposLivros = Arrays.asList(TipoLivro.values());
		mv.addObject("tiposLivros", tiposLivros);

		List<Categoria> categorias = categoriaDao.listaTodos();
		mv.addObject("categorias", categorias);
		
		return mv;
	}
	
	@RequestMapping("/admin/cadastraLivro")
	public String cadastraLivro(Livro livro) {
		dao.cadastra(livro);
		return "redirect:/listaLivros";
	}
	
	@RequestMapping("/listaLivros")
	public ModelAndView listaLivros() {
		ModelAndView mv = new ModelAndView("lista_livros");

		List<Livro> lista = dao.listaTodos();
		mv.addObject("livros", lista);

		List<TipoLivro> tiposLivros = Arrays.asList(TipoLivro.values());
		mv.addObject("tiposLivros", tiposLivros);

		return mv;
	}

	@RequestMapping("/admin/alteraLivro")
	public ModelAndView preparaAlteracao(Integer id) {
		ModelAndView mv = new ModelAndView("admin/edicao_livro");

		Livro livro = dao.buscaPorId(id);
		mv.addObject("livro", livro);
		
		List<TipoLivro> tiposLivros = Arrays.asList(TipoLivro.values());
		mv.addObject("tiposLivros", tiposLivros);
		
		return mv;
	}
	
	@RequestMapping("/admin/concluirAlteracaoLivro")
	public String alterar(Livro livro) {
		dao.atualiza(livro);
		return "redirect:/listaLivros";
	}
	
	@RequestMapping("/admin/removeLivro")
	public String removeLivro(Integer id) {
		Livro livro = dao.buscaPorId(id);
		dao.remove(livro);
		return "redirect:/listaLivros";
	}

}
