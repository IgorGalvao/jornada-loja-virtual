package br.com.caelum.jornada.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Usuario {

	@Id @GeneratedValue
	private Integer id;
	@NotBlank(message="Obrigatório informar login")
	@Column(unique=true, nullable=false, updatable=false)
	private String login;
	@NotNull @Size(min=5, max=16, message="Senha deve ter de {min} a {max} caracteres")
	@Column(nullable=false, updatable=true)
	private String senha;
	@NotBlank(message="Obrigatório informar e-mail")
	@Email(message="E-mail inválido")
	@Column(unique=true, nullable=false)
	private String email;
	@NotNull(message="Obrigatório selecionar perfil")
	@Column(nullable=false) @Enumerated(EnumType.STRING)
	private Perfil perfil;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Perfil getPerfil() {
		return perfil;
	}
	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}
	
}
