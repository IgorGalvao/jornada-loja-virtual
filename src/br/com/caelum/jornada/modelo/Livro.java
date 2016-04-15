package br.com.caelum.jornada.modelo;

import java.math.BigDecimal;

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
	private BigDecimal precoLivro;
	private BigDecimal precoEbook;
	private BigDecimal precoCombo;
	
	
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
	public BigDecimal getPrecoLivro() {
		return precoLivro;
	}
	public void setPrecoLivro(BigDecimal precoLivro) {
		this.precoLivro = precoLivro;
	}
	public BigDecimal getPrecoEbook() {
		return precoEbook;
	}
	public void setPrecoEbook(BigDecimal precoEbook) {
		this.precoEbook = precoEbook;
	}
	public BigDecimal getPrecoCombo() {
		return precoCombo;
	}
	public void setPrecoCombo(BigDecimal precoCombo) {
		this.precoCombo = precoCombo;
	}
}