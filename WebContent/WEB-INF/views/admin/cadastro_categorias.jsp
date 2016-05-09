<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Categorias de Livros</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/formulario.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		<h2>Gerenciar nova categoria de livros</h2>
			<form action="<c:url value='/admin/cadastraCategoria'/>" method="post">			

			<custom:inputLabel type="text" text="Nome da Categoria" id="nome" errorsPath="categoria.nome" />

			<input type="submit" value="Cadastrar" class="btn">
		</form>
		
		<h2>Categorias cadastradas</h2>
		
		<table class="table">
			<thead>
				<tr><th>Id
					<th>Categoria
					<th>Remover
			</thead>
			<tbody>
				<c:forEach items="${categorias}" var="categoriaLinha">
					<tr><td>${categoriaLinha.id}
						<td>${categoriaLinha.nome}
						<td><a href="removeCategoria?id=${categoriaLinha.id}">Remove</a>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	
</body>
</html>