<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Loja - Carrinho de Compras</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		
		<h2>Carrinho de Compras</h2>

		<c:choose>
		<c:when test="${carrinho.total == 0}">
		
		<div class="jumbotron"><h3>O carrinho de compras está vazio.</h3></div>
		
		</c:when>
		<c:otherwise>
		
		<table class="table">
			<thead>
				<tr><th>Livro
					<th>Formato
					<th>Preço
					<th>Quantidade
					<th>Remover
			</thead>
			<tbody>
				<c:forEach items="${carrinho.compras}" var="compra">
					<tr><td>${compra.key.livro.titulo} (${compra.key.livro.autor})
						<td>${compra.key.preco.tipoLivro}
						<td>${compra.key.preco.valor}
						<td>
							<a href="decrementaItem?livro=${compra.key.livro.id}&formato=${compra.key.preco.tipoLivro}">
								<span class="glyphicon glyphicon-minus"></span>
							</a>
							${compra.value}
							<a href="incrementaItem?livro=${compra.key.livro.id}&formato=${compra.key.preco.tipoLivro}">
								<span class="glyphicon glyphicon-plus"></span>
							</a>
						</td>
						<td><a href="removerDoCarrinho?livro=${compra.key.livro.id}&formato=${compra.key.preco.tipoLivro}">Remove</a>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr><td>Total
					<td>
					<td>${carrinho.total}
					<td>
					<td>
			</tfoot>
		</table>
		
		<a class="btn btn-primary" href="fecharPedido" role="button">Fechar pedido</a>
		
		</c:otherwise>
		</c:choose>
		
		
	</div> <!-- .container -->

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>