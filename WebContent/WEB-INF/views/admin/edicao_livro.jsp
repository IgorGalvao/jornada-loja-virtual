<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Edi��o de Livros</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/estilo.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		<h2>Alterar dados cadastrados</h2>
			<form action="<c:url value="/admin/concluirAlteracaoLivro"/>" method="post">
			<input type="hidden" id="id" name="id" value="${livro.id}">
			<div class="form-group">
				<label for="titulo">T�tulo</label>
				<input type="text" id="titulo" name="titulo" class="form-control" autofocus value="${livro.titulo}">
			</div>
			<div class="form-group">
				<label for="capa">Capa</label>
				<input type="text" id="capa" name="capa" class="form-control" value="${livro.capa}">
			</div>
			<div class="form-group">
				<label for="autor">Autor</label>
				<input type="text" id="autor" name="autor" class="form-control" value="${livro.autor}">
			</div>
			<div class="form-group">
				<label for="descricao">Descri��o</label>
				<textarea rows="3" cols="100" name="descricao" class="form-control" >${livro.descricao}</textarea>
			</div>
			<div class="form-group">
				<label for="precoLivro">Pre�o (livro impresso)</label>
				<input type="text" id="precoLivro" name="precoLivro" class="form-control" value="${livro.precoLivro}">
			</div>
			<div class="form-group">
				<label for="precoEbook">Pre�o (ebook)</label>
				<input type="text" id="precoEbook" name="precoEbook" class="form-control" value="${livro.precoEbook}">
			</div>
			<div class="form-group">
				<label for="precoCombo">Pre�o (combo)</label>
				<input type="text" id="precoCombo" name="precoCombo" class="form-control" value="${livro.precoCombo}">
			</div>
			<input type="submit" value="Concluir Altera��o" class="btn">
		</form>
	</div>
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>