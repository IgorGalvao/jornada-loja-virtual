package br.com.caelum.jornada.modelo;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

@Embeddable
public class Preco {

	@Column(nullable=false) @Enumerated(EnumType.STRING)
	private TipoLivro tipoLivro;
	private BigDecimal valor;

	public TipoLivro getTipoLivro() {
		return tipoLivro;
	}
	public void setTipoLivro(TipoLivro tipoLivro) {
		this.tipoLivro = tipoLivro;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

}
