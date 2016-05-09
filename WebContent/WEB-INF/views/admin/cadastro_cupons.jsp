<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Cupons de Desconto</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/formulario.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		<h2>Cadastrar novo cupom</h2>
		<form action="<c:url value='/admin/cadastraCupom'/>" method="post">
			<input type="hidden" id="id" name="id">
			<div class="row">
				<div class="col-sm-4">
					<custom:inputLabel type="text" text="Código" id="codigo" errorsPath="cupom.codigo" />
				</div>
				<div class="col-sm-4">
					<custom:inputLabel type="text" text="Validade" id="validade" errorsPath="cupom.validade" />
				</div>
				<div class="col-sm-4">
					<custom:inputLabel type="text" text="Porcentagem de Desconto" id="desconto" errorsPath="cupom.desconto" />
				</div>				
			</div>

			<input type="submit" value="Cadastrar" class="btn">
		</form>
		
		<h2>Cupons cadastrados</h2>
		<table class="table">
			<thead>
				<tr><th>Id
					<th>Código
					<th>Validade
					<th>Porcentagem de Desconto
					<th>Alterar
					<th>Remover
			</thead>
			<tbody>
				<c:forEach items="${cupons}" var="cupomLinha">
					<tr><td>${cupomLinha.id}
						<td>${cupomLinha.codigo}
						<td><fmt:formatDate value="${cupomLinha.validade.time}" pattern="dd/MM/yyyy" />
						<td><fmt:formatNumber type="percent" maxIntegerDigits="2" value="${cupomLinha.desconto}" />
						<td><a href="alteraCupom?id=${cupomLinha.id}">Altera</a>
						<td><a href="removeCupom?id=${cupomLinha.id}">Remove</a>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	
</body>
</html>