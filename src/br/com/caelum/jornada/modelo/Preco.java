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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((tipoLivro == null) ? 0 : tipoLivro.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Preco other = (Preco) obj;
		if (tipoLivro != other.tipoLivro)
			return false;
		return true;
	}	

}
