package br.com.caelum.jornada.modelo;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotBlank;

@Entity @Embeddable
public class Categoria {
	
	@Id @GeneratedValue
	private Integer id;
	@NotBlank(message="Favor informar nome da categoria")
	@Column(nullable=false)
	private String nome;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
}
