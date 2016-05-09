package br.com.caelum.jornada.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import br.com.caelum.jornada.modelo.Livro;

public class CategoriaSelecionadaValidator implements ConstraintValidator<CategoriaSelecionada, Livro>{

	@Override
	public void initialize(CategoriaSelecionada annotation) {
	}

	@Override
	public boolean isValid(Livro livro, ConstraintValidatorContext context) {
		
		if(livro == null) return true;
		
		boolean erro = livro.getCategoria() == null ||
				livro.getCategoria().getId() == null ||
				livro.getCategoria().getId().toString().trim().equals("");
		
		if(erro) {
			context.buildConstraintViolationWithTemplate("Selecione a categoria").addNode("categoria").addConstraintViolation();
			return false;
		}
		
		return true;
	}

}
