<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Loja Virtual - Carrinho de Compras</title>
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
		<c:when test="${carrinho.subtotal == 0}">
		
		<div class="jumbotron"><h3>O carrinho de compras está vazio.</h3></div>
		
		</c:when>
		<c:otherwise>
		
		<table class="table">
			<thead>
				<tr><th>Livro
					<th>Quantidade
					<th>Valor total
			</thead>
			<tbody>
				<c:forEach items="${carrinho.itens}" var="itemCarrinho">
					<tr><td><div class="row">
								<div class="col-sm-8">
									${itemCarrinho.livro.titulo} (${itemCarrinho.livro.autor})
								</div>
								<div class="col-sm-2">
									${itemCarrinho.preco.tipoLivro}
								</div>
								<div class="col-sm-2">
									<fmt:formatNumber type="currency">${itemCarrinho.preco.valor}</fmt:formatNumber>
								</div>
							</div>
						<td><div class="row">
								<div class="col-sm-6">
								<a href="decrementaItem?livro=${itemCarrinho.livro.id}&formato=${itemCarrinho.preco.tipoLivro}">
									<span class="glyphicon glyphicon-minus"></span>
								</a>
								${itemCarrinho.quantidade}
								<a href="incrementaItem?livro=${itemCarrinho.livro.id}&formato=${itemCarrinho.preco.tipoLivro}">
									<span class="glyphicon glyphicon-plus"></span>
								</a>
								</div>
								<div class="col-sm-6">
									<a href="removerDoCarrinho?livro=${itemCarrinho.livro.id}&formato=${itemCarrinho.preco.tipoLivro}">Remover</a>
								</div>
							</div>
						</td>
						<td><fmt:formatNumber type="currency">${itemCarrinho.valorItem}</fmt:formatNumber>
						<td>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr><td>Subtotal
					<td>
					<td><fmt:formatNumber type="currency">${carrinho.subtotal}</fmt:formatNumber>
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