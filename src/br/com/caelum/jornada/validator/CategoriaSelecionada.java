package br.com.caelum.jornada.validator;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = CategoriaSelecionadaValidator.class)
public @interface CategoriaSelecionada {

	String message() default "Selecione a categoria";
	
	Class<?>[] groups() default {};
	
	Class<? extends Payload>[] payload() default {};
}
