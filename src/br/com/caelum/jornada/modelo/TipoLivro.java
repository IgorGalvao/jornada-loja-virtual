package br.com.caelum.jornada.modelo;

public enum TipoLivro {

	LIVRO("(livro impresso)"),
	EBOOK("(ebook)"),
	COMBO("(combo livro impresso + ebook)");

	private final String label;	
	
	private TipoLivro(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
	
}
