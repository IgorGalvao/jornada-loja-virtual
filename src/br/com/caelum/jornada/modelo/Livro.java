package br.com.caelum.jornada.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Livro {

	@Id @GeneratedValue
	private Integer id;
	private String titulo;
	private String capa;
	private String autor;
	private String descricao;
	private double precoLivro;
	private double precoEbook;
	private double precoCombo;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getCapa() {
		return capa;
	}
	public void setCapa(String capa) {
		this.capa = capa;
	}
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public double getPrecoLivro() {
		return precoLivro;
	}
	public void setPrecoLivro(double precoLivro) {
		this.precoLivro = precoLivro;
	}
	public double getPrecoEbook() {
		return precoEbook;
	}
	public void setPrecoEbook(double precoEbook) {
		this.precoEbook = precoEbook;
	}
	public double getPrecoCombo() {
		return precoCombo;
	}
	public void setPrecoCombo(double precoCombo) {
		this.precoCombo = precoCombo;
	}
}