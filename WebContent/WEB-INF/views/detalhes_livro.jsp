<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Loja - ${livro.autor}: ${livro.titulo}</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/exibicaolivro.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		
		<div class="row">
			<div id="coltexto" class="col-md-5 col-sm-push-3">
				<h2>${livro.titulo}</h2>
				<p>por <span class="h4">${livro.autor}</span></h4>
	 			<p>${livro.categoria.nome}</p>
				<div class="well well-sm">
					<blockquote><p>${livro.descricao}</p></blockquote>
				</div>
			</div>
			<div id="colcapa" class="col-md-3 col-sm-pull-5">
				<img id="capa" src='<c:url value="/images/" />${livro.capa}' class="img-thumbnail img-responsive">
			</div>
			<div id="colpreco" class="col-md-4">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">Escolha o formato</div>
					<ul class="list-group">
						<c:forEach items="${tiposLivros}" var="tipoLivro" varStatus="contador">
						    <li class="list-group-item">
						        <p>Preço ${tipoLivro.label}</p>
						        <p><fmt:formatNumber type="currency">${livro.precos[contador.index].valor}</fmt:formatNumber></p>
							</li>
						</c:forEach>
					</ul>
				</div>		
			</div>
		</div>
		
	</div> <!-- .container -->

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>