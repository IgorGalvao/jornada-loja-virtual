package br.com.caelum.jornada.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import br.com.caelum.jornada.modelo.Livro;

public class PrecoPreenchidoValidator implements ConstraintValidator<PrecoPreenchido, Livro>{

	private boolean erro = false;
	
	@Override
	public void initialize(PrecoPreenchido annotation) {
	}

	@Override
	public boolean isValid(Livro livro, ConstraintValidatorContext context) {
		
		if(livro == null) return true;
		
		for(int i = 0; i < livro.getPrecos().size(); i++) {
			if(livro.getPrecos().get(i).getValor() == null) {
				marcaErro(context, i);
			}
		}
		
		if(erro) return false;
		return true;
	}

	private void marcaErro(ConstraintValidatorContext context, int position) {
		context.buildConstraintViolationWithTemplate("Preencha o preço")
				.addNode("precos["+position+"]").addConstraintViolation();
		erro = true;
	}

}
