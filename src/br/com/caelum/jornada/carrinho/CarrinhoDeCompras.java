package br.com.caelum.jornada.carrinho;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import br.com.caelum.jornada.modelo.Cupom;
import br.com.caelum.jornada.modelo.Item;
import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.Preco;
import br.com.caelum.jornada.modelo.TipoLivro;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class CarrinhoDeCompras {

	private List<Item> itens = new ArrayList<Item>();

	public List<Item> getItens() {
		return itens;
	}

	public void adiciona(Item item) {
		if(itens.contains(item)) {
			int index = itens.lastIndexOf(item);
			itens.get(index).incrementa();
		} else {
			itens.add(item);
		}
	}
	
	public void remove(Livro livro, TipoLivro tipo) {
		Item item = geraItem(livro, tipo);
		itens.remove(item);
	}

	public void incrementa(Livro livro, TipoLivro tipo) {
		Item item = geraItem(livro, tipo);
		adiciona(item);
	}

	public void decrementa(Livro livro, TipoLivro tipo) {
		Item item = geraItem(livro, tipo);
		int index = itens.lastIndexOf(item);
		itens.get(index).decrementa();
		if(itens.get(index).getQuantidade() == 0) itens.remove(item);
	}
	
	public BigDecimal getSubtotal() {
		BigDecimal subtotal = BigDecimal.ZERO;
		for(Item item : itens) {
			BigDecimal somaParcial = subtotal.add(item.getValorItem());
			subtotal = somaParcial;
		}
		return subtotal;
	}
	
	private Item geraItem(Livro livro, TipoLivro tipo) {
		Preco preco = livro.getPrecos().stream().filter(p -> p.getTipoLivro().equals(tipo)).findFirst().orElse(null);
		Item item = new Item(livro, preco);
		return item;
	}

	public BigDecimal totalPedido(HttpSession session) {
		Cupom cupomAtivo = (Cupom) session.getAttribute("cupomAtivo");
		if(cupomAtivo != null) {
			return getSubtotal().multiply((BigDecimal.ONE.add(cupomAtivo.getDesconto().negate())));			
		}
		return getSubtotal();
	}
		
}
