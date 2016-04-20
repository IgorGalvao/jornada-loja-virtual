package br.com.caelum.jornada.formatter;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import br.com.caelum.jornada.dao.CategoriaDAO;
import br.com.caelum.jornada.modelo.Categoria;

@Component
public class CategoriaFormatter implements Formatter<Categoria> {

	private CategoriaDAO dao;
	
	@Autowired
	public CategoriaFormatter(CategoriaDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public String print(Categoria categoria, Locale arg1) {
		return categoria.getNome();
	}

	@Override
	public Categoria parse(String id, Locale arg1) throws ParseException {
		return dao.buscaPorId(Integer.parseInt(id));
	}

}
