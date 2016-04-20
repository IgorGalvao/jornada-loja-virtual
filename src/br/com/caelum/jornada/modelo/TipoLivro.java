package br.com.caelum.jornada.modelo;

public enum TipoLivro {

	LIVRO("(impresso)"),
	EBOOK("(ebook)"),
	COMBO("(combo)");

	private final String label;	
	
	private TipoLivro(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
	
}
