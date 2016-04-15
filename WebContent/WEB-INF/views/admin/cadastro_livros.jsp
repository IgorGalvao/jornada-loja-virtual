<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Livros</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/estilo.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
	
		<h2>Cadastrar novo livro</h2>

		<form action="<c:url value='/admin/cadastraLivro'/>" method="post">

			<custom:inputLabel type="text" id="titulo" text="T�tulo" />

			<custom:inputLabel type="text" id="capa" text="Capa" />

			<custom:inputLabel type="text" id="autor" text="Autor" />

			<div class="form-group">
				<label for="descricao">Descri��o</label>
				<textarea rows="3" cols="100" name="descricao" class="form-control"></textarea>
			</div>

			<custom:inputLabel type="text" id="precoLivro" text="Pre�o (livro impresso)" />

			<custom:inputLabel type="text" id="precoEbook" text="Pre�o (ebook)" />

			<custom:inputLabel type="text" id="precoCombo" text="Pre�o (combo)" />

			<input type="submit" value="Cadastrar" class="btn">

		</form>

	</div>

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>

</body>
</html>