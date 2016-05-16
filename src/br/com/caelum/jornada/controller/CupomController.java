package br.com.caelum.jornada.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String cadastroCupons(@ModelAttribute("cupom") Cupom cupom, BindingResult result, Model model) {
		List<Cupom> lista = dao.listaTodos();
		model.addAttribute("cupons", lista);
		return "admin/cadastro_cupons";
	}
	
	@RequestMapping("/admin/cadastraCupom")
	public String cadastraCupom(@ModelAttribute("cupom") @Valid Cupom cupom, BindingResult result, Model model) {
		if(!result.hasErrors()) {
			dao.cadastra(cupom);
			return "redirect:/admin/cadastroCupons";
		}
		return cadastroCupons(cupom, result, model);
	}

	@RequestMapping("/admin/alteraCupom")
	public String preparaAlteracao(@ModelAttribute("cupom") Cupom cupom, BindingResult result, Model model) {
		if(cupom.getValidade() == null)
			cupom = dao.buscaPorId(cupom.getId());
		model.addAttribute("cupom", cupom);
		return "admin/edicao_cupom";
	}
	
	@RequestMapping("/admin/concluirAlteracaoCupom")
	public String alterarCupom(@Valid Cupom cupom, BindingResult result, Model model) {
		if(!result.hasErrors()) {
			dao.atualiza(cupom);
			return "redirect:/admin/cadastroCupons";			
		}
		return preparaAlteracao(cupom, result, model);
	}
	
	@RequestMapping("admin/removeCupom")
	public String removeCupom(Integer id) {
		Cupom cupom = dao.buscaPorId(id);
		dao.remove(cupom);
		return "redirect:/admin/cadastroCupons";
	}

}
