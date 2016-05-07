package br.com.caelum.jornada.controller;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;
import javax.validation.Validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	private Validator validator;
	
	@Autowired
	public LivroController(LivroDAO dao, CategoriaDAO categoriaDao) {
		this.dao = dao;
		this.categoriaDao = categoriaDao;
	}
	
	@RequestMapping("/admin/cadastroLivros")
	public String cadastroLivros(@ModelAttribute("livro") Livro livro, BindingResult result, Model model) {
		List<TipoLivro> tiposLivros = Arrays.asList(TipoLivro.values());
		model.addAttribute("tiposLivros", tiposLivros);

		List<Categoria> categorias = categoriaDao.listaTodos();
		model.addAttribute("categorias", categorias);

		return "admin/cadastro_livros";
	}
	
	@RequestMapping("/admin/cadastraLivro")
	public String cadastraLivro(@Valid Livro livro, BindingResult result) {
		if(!result.hasErrors()) {
			dao.cadastra(livro);
			return "redirect:/listaLivros";
		} else {
			return "forward:/admin/cadastroLivros";
		}
	}
	
	@RequestMapping("/listaLivros")
	public String listaLivros(Model model) {

		List<Livro> lista = dao.listaTodos();
		model.addAttribute("livros", lista);
		
		List<Categoria> categorias = categoriaDao.listaTodos();
		model.addAttribute("categorias", categorias);

		return "lista_livros";
	}

	@RequestMapping("/admin/alteraLivro")
	public String preparaAlteracao(Integer id, Model model) {

		Livro livro = dao.buscaPorId(id);
		model.addAttribute("livro", livro);
		
		List<TipoLivro> tiposLivros = Arrays.asList(TipoLivro.values());
		model.addAttribute("tiposLivros", tiposLivros);
		
		return "admin/edicao_livro";
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
	
	@RequestMapping("/mostraDetalhes")
	public String mostraDetalhes(Integer id, Model model) {

		Livro livro = dao.buscaPorId(id);
		model.addAttribute("livro", livro);
		
		List<TipoLivro> tiposLivros = Arrays.asList(TipoLivro.values());
		model.addAttribute("tiposLivros", tiposLivros);
		
		return "detalhes_livro";
	}

}
