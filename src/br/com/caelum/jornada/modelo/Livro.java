package br.com.caelum.jornada.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

import br.com.caelum.jornada.validator.CategoriaSelecionada;
import br.com.caelum.jornada.validator.PrecoPreenchido;

@Entity @CategoriaSelecionada @PrecoPreenchido
public class Livro {

	@Id @GeneratedValue
	private Integer id;
	@Column(nullable=false)
	@NotBlank(message="Obrigatório informar o título")
	private String titulo;
	@NotBlank(message="Obrigatório informar o endereço da imagem")
	private String capa;
	@Column(nullable=false)
	@NotBlank(message="Obrigatório informar o autor")
	private String autor;
	@Column(nullable=false, length=500)
	@NotNull(message="Obrigatório preencher a descrição")
	@Size(min=10, max=500, message="Descrição deve ter entre {min} e {max} caracteres")
	private String descricao;
	@ManyToOne
	private Categoria categoria;
	@ElementCollection(fetch=FetchType.EAGER)
	private List<Preco> precos;
	
	
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
	public List<Preco> getPrecos() {
		return precos;
	}
	public void setPrecos(List<Preco> precos) {
		this.precos = precos;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Livro other = (Livro) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	

}	