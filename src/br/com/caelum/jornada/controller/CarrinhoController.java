package br.com.caelum.jornada.controller;

import java.util.GregorianCalendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.jornada.carrinho.CarrinhoDeCompras;
import br.com.caelum.jornada.dao.CupomDAO;
import br.com.caelum.jornada.dao.LivroDAO;
import br.com.caelum.jornada.dao.PedidoDAO;
import br.com.caelum.jornada.dao.UsuarioDAO;
import br.com.caelum.jornada.modelo.Cupom;
import br.com.caelum.jornada.modelo.Item;
import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.Pedido;
import br.com.caelum.jornada.modelo.Preco;
import br.com.caelum.jornada.modelo.TipoLivro;
import br.com.caelum.jornada.modelo.Usuario;


@Controller @Transactional @Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoController {

	@Autowired private CarrinhoDeCompras carrinho;
	@Autowired private LivroDAO livroDao;
	@Autowired private PedidoDAO pedidoDao;
	@Autowired private UsuarioDAO usuarioDao;
	@Autowired private CupomDAO cupomDao;
	
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

	@RequestMapping("/incrementaItem")
	public String incrementaItem(@RequestParam("livro") String id, @RequestParam("formato") TipoLivro tipo) {
		Livro livro = livroDao.buscaPorId(Integer.parseInt(id));
		carrinho.incrementa(livro, tipo);
		return "redirect:exibirCarrinho";
	}
	
	@RequestMapping("/decrementaItem")
	public String decrementaItem(@RequestParam("livro") String id, @RequestParam("formato") TipoLivro tipo) {
		Livro livro = livroDao.buscaPorId(Integer.parseInt(id));
		carrinho.decrementa(livro, tipo);
		return "redirect:exibirCarrinho";
	}
	
	@RequestMapping("/fecharPedido")
	public ModelAndView fecharPedido() {
		ModelAndView mv = new ModelAndView("dados_pagamento");
		mv.addObject("carrinho", carrinho);
		return mv;
	}
	
	@RequestMapping("/confirmarPedido")	
	public ModelAndView confirmarPedido(Pedido pedido, HttpSession session,
			@RequestParam("cupomId") Integer cupomId,
			@RequestParam("validadeMes") Integer mes, @RequestParam("validadeAno") Integer ano) {
		ModelAndView mv = new ModelAndView("confirmacao");
		mv.addObject("carrinho", carrinho);
		
		pedido.setUsuario((Usuario)session.getAttribute("usuarioLogado"));
		pedido.setCupom(cupomDao.buscaPorId(cupomId));
		pedido.setValidadeCartao(new GregorianCalendar(ano, mes, 01));

		pedidoDao.cadastra(pedido);
		return mv;
	}

}
