package br.com.caelum.jornada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.jornada.dao.CupomDAO;
import br.com.caelum.jornada.modelo.Cupom;

@Transactional
@Controller
public class CupomController {

	private CupomDAO dao;
	
	@Autowired
	public CupomController(CupomDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/admin/cadastroCupons")
	public String cadastroCupons() {
		return "cadastro_cupons";
	}
	
	@RequestMapping("/cadastraCupom")
	public String cadastraCupom(Cupom cupom) {
		dao.cadastra(cupom);
		return "redirect:listaCupons";
	}
	
	@RequestMapping("/listaCupons")
	public ModelAndView listaCupons() {
		List<Cupom> lista = dao.listaTodos();
		ModelAndView mv = new ModelAndView("lista_cupons");
		mv.addObject("cupons", lista);
		return mv;
	}

	@RequestMapping("/alteraCupom")
	public ModelAndView preparaAlteracao(Integer id) {
		Cupom cupom = dao.buscaPorId(id);
		ModelAndView mv = new ModelAndView("cadastro_cupons");
		mv.addObject("cupom", cupom);
		return mv;
	}
	
	@RequestMapping("/concluirAlteracaoCupom")
	public String alterar(Cupom cupom) {
		dao.atualiza(cupom);
		return "redirect:listaCupons";
	}
	
	@RequestMapping("/removeCupom")
	public String removeCupom(Integer id) {
		Cupom cupom = dao.buscaPorId(id);
		dao.remove(cupom);
		return "redirect:listaCupons";
	}

}
