package br.com.caelum.jornada.carrinho;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import br.com.caelum.jornada.dao.LivroDAO;
import br.com.caelum.jornada.modelo.Item;
import br.com.caelum.jornada.modelo.Livro;
import br.com.caelum.jornada.modelo.TipoLivro;

@Component
@Scope(value=WebApplicationContext.SCOPE_SESSION)
public class CarrinhoDeCompras {

	private Map<Item, Integer> compras = new LinkedHashMap<Item, Integer>();
	@Autowired
	private LivroDAO livroDao;
	
	public Map<Item, Integer> getCompras() {
		return compras;
	}

	public void adiciona(Item item) {
		compras.put(item, (getQuantidade(item) + 1));
	}
	
	public void remove(Integer id, TipoLivro tipo) {
		Livro livro = livroDao.buscaPorId(id);
		// parei por aqui
	}

	private Integer getQuantidade(Item item) {
		if (compras.containsKey(item)) {
			return compras.get(item);
		} else {
			return 0;
		}
	}
		
}
