package br.com.caelum.jornada.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.jornada.dao.LivroDAO;
import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.TipoLivro;

@Transactional
@Controller
public class LivroController {

	private LivroDAO dao;
	
	@Autowired
	public LivroController(LivroDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/admin/cadastroLivros")
	public ModelAndView cadastroLivros() {
		List<TipoLivro> tiposLivros = Arrays.asList(TipoLivro.values());
		ModelAndView mv = new ModelAndView("admin/cadastro_livros");
		mv.addObject("tiposLivros", tiposLivros);
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
		Livro livro = dao.buscaPorId(id);
		ModelAndView mv = new ModelAndView("admin/edicao_livro");
		mv.addObject("livro", livro);
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
