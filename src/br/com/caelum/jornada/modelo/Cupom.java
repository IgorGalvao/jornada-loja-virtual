package br.com.caelum.jornada.modelo;

import java.math.BigDecimal;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

@Entity
public class Cupom {

	@Id @GeneratedValue
	private Integer id;
	@NotBlank(message="Obrigatório inserir código")
	@Column(unique=true)
	private String codigo;
	@NotNull(message="Obrigatório inserir data")
	@Future(message="Data inválida")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar validade;
	@NotNull(message="Obrigatório inserir desconto")
	@DecimalMin(value="0.01", message="Inserir valor entre 1% e 100%")
	@DecimalMax(value="1.00", message="Inserir valor entre 1% e 100%")
	@NumberFormat(style = NumberFormat.Style.PERCENT)
	private BigDecimal desconto;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public Calendar getValidade() {
		return validade;
	}
	public void setValidade(Calendar validade) {
		this.validade = validade;
	}
	public BigDecimal getDesconto() {
		return desconto;
	}
	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}
	
}
