package br.com.caelum.jornada.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LivroController {

	@RequestMapping("/teste")
	public String metodo() {
		return "cadastro_livros";
	}

}
