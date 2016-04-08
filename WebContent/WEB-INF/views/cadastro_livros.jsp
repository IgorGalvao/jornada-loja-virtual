<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Livros</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>
	
	<div class="container">
		<h2>Cadastrar novo livro</h2>
		<form action="cadastraLivro" method="post">
			<div class="form-group">
				<label for="titulo">Título</label>
				<input type="text" id="titulo" name="titulo" class="form-control" autofocus>
			</div>
			<div class="form-group">
				<label for="capa">Capa</label>
				<input type="text" id="capa" name="capa" class="form-control">
			</div>
			<div class="form-group">
				<label for="autor">Autor</label>
				<input type="text" id="autor" name="autor" class="form-control">
			</div>
			<div class="form-group">
				<label for="descricao">Descrição</label>
				<textarea rows="3" cols="100" name="descricao" class="form-control"></textarea>
			</div>
			<div class="form-group">
				<label for="precoLivro">Preço (livro impresso)</label>
				<input type="text" id="precoLivro" name="precoLivro" class="form-control">
			</div>
			<div class="form-group">
				<label for="precoEbook">Preço (ebook)</label>
				<input type="text" id="precoEbook" name="precoEbook" class="form-control">
			</div>
			<div class="form-group">
				<label for="precoCombo">Preço (combo)</label>
				<input type="text" id="precoCombo" name="precoCombo" class="form-control">
			</div>
			<input type="submit" value="Cadastrar" class="btn">
		</form>
	</div>
</body>
</html>