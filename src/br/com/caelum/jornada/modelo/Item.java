package br.com.caelum.jornada.modelo;


public class Item {

	private Livro livro;
	private Preco preco;

	public Item() {
		super();
	}
	
	public Item(Livro livro, Preco preco) {
		this.livro = livro;
		this.preco = preco;
	}
	public Livro getLivro() {
		return livro;
	}
	public void setLivro(Livro livro) {
		this.livro = livro;
	}
	public Preco getPreco() {
		return preco;
	}
	public void setPreco(Preco preco) {
		this.preco = preco;
	}
	
}
