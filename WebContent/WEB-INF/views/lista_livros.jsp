<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
		<h2>Livros cadastrados</h2>
		<table class="table">
			<thead>
				<tr><th>Id
					<th>Título
					<th>Autor
					<th>Capa
					<th>Descrição
					<c:forEach items="${tiposLivros}" var="tipo">
					    <th>Preço ${tipo.label}
					</c:forEach>
					<th>Alterar
					<th>Remover
			</thead>
			<tbody>
				<c:forEach items="${livros}" var="livro">
					<tr><td>${livro.id}
						<td>${livro.titulo}
						<td>${livro.autor}
						<td>${livro.capa}
						<td>${livro.descricao}
						<c:forEach items="${livro.precos}" var="preco">
						    <td>${preco.valor}</td>
						</c:forEach>
						<td><a href="admin/alteraLivro?id=${livro.id}">Altera</a>
						<td><a href="admin/removeLivro?id=${livro.id}">Remove</a>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>