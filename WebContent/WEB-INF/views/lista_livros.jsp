<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Livros</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>
	<div class="container">
		<h2>Livros cadastrados</h2>
		<table class="table">
			<thead>
				<tr><th>Id
					<th>Título
					<th>Autor
					<th>Capa
					<th>Descrição
					<th>Preço (livro)
					<th>Preço (ebook)
					<th>Preço (combo)
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
						<td><fmt:formatNumber type="currency" value="${livro.precoLivro}"/>
						<td><fmt:formatNumber type="currency" value="${livro.precoEbook}"/>
						<td><fmt:formatNumber type="currency" value="${livro.precoCombo}"/>
						<td><a href="alteraLivro?id=${livro.id}">Altera</a>
						<td><a href="removeLivro?id=${livro.id}">Remove</a>
				</c:forEach>
			</tbody>
		</table>
		
		<h4><a href="<c:url value="/cadastroLivros"/>">Cadastra novo livro</a></h4>
	</div>
</body>
</html>