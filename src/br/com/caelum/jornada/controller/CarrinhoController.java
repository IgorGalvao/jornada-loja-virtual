package br.com.caelum.jornada.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.jornada.carrinho.CarrinhoDeCompras;
import br.com.caelum.jornada.dao.LivroDAO;
import br.com.caelum.jornada.modelo.Item;
import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.Preco;
import br.com.caelum.jornada.modelo.TipoLivro;


@Controller @Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoController {

	@Autowired
	private CarrinhoDeCompras carrinho;
	@Autowired
	private LivroDAO livroDao;
	
	@RequestMapping("/exibirCarrinho")
	public ModelAndView exibirCarrinho() {
		ModelAndView mv = new ModelAndView("carrinho");
		mv.addObject("carrinho", carrinho);
		return mv;
	}
	
	@RequestMapping("/adicionarAoCarrinho")
	public String adicionarAoCarrinho(@RequestParam("livro") String id, @RequestParam("preco") Integer indice) {
		Livro livro = livroDao.buscaPorId(Integer.parseInt(id));
		Preco preco = livro.getPrecos().get(indice);
		Item item = new Item(livro, preco);
		carrinho.adiciona(item);
		return "redirect:exibirCarrinho";
	}
	
	@RequestMapping("/removerDoCarrinho")
	public String removerDoCarrinho(@RequestParam("livro") String id, @RequestParam("formato") TipoLivro tipo) {
		Livro livro = livroDao.buscaPorId(Integer.parseInt(id));
		carrinho.remove(livro, tipo);
		return "redirect:exibirCarrinho";
	}

}
