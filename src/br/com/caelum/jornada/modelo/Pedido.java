package br.com.caelum.jornada.modelo;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Pedido {

	@Id @GeneratedValue
	private Integer id;

	@ManyToOne
	private Usuario usuario;

	@NotBlank(message="Obrigatório informar endereço")
	private String endereco;
	@NotBlank(message="Obrigatório informar cep")
	private String cep;
	@NotBlank(message="Obrigatório informar cidade")
	private String cidade;
	@NotBlank(message="Obrigatório informar uf")
	private String uf;
	
	@NotBlank(message="Obrigatório informar cartão de crédito")
	private String numeroCartao;
	@NotBlank(message="Obrigatório informar CVV do cartão")
	private String cvvCartao;
	@Temporal(TemporalType.DATE)
	private Calendar validadeCartao;

	@ElementCollection(fetch=FetchType.EAGER)
	private List<Item> produtos;
	private BigDecimal totalCompra;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getNumeroCartao() {
		return numeroCartao;
	}
	public void setNumeroCartao(String numeroCartao) {
		this.numeroCartao = numeroCartao;
	}
	public String getCvvCartao() {
		return cvvCartao;
	}
	public void setCvvCartao(String cvvCartao) {
		this.cvvCartao = cvvCartao;
	}
	public Calendar getValidadeCartao() {
		return validadeCartao;
	}
	public void setValidadeCartao(Calendar validadeCartao) {
		this.validadeCartao = validadeCartao;
	}
	public List<Item> getProdutos() {
		return produtos;
	}
	public void setProdutos(List<Item> produtos) {
		this.produtos = produtos;
	}
	public BigDecimal getTotalCompra() {
		return totalCompra;
	}
	public void setTotalCompra(BigDecimal totalCompra) {
		this.totalCompra = totalCompra;
	}

	
}	