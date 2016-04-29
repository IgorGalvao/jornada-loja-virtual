package br.com.caelum.jornada.carrinho;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import br.com.caelum.jornada.modelo.Item;
import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.Preco;
import br.com.caelum.jornada.modelo.TipoLivro;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class CarrinhoDeCompras {

	private Map<Item, Integer> compras = new LinkedHashMap<Item, Integer>();

	public Map<Item, Integer> getCompras() {
		return compras;
	}

	public void adiciona(Item item) {
		compras.put(item, (getQuantidade(item) + 1));
	}
	
	public void remove(Livro livro, TipoLivro tipo) {
		Preco preco = livro.getPrecos().stream().filter(p -> p.getTipoLivro().equals(tipo)).findFirst().orElse(null);
		Item item = new Item(livro, preco);
		compras.remove(item);
	}

	private Integer getQuantidade(Item item) {
		if (compras.containsKey(item)) {
			return compras.get(item);
		} else {
			return 0;
		}
	}
		
}
