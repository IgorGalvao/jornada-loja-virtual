<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Cupons de Desconto</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>
	<header>
		<%@ include file="menu/menu.jsp" %>
	</header>
	<div class="container">
		<h2>Cupons cadastrados</h2>
		<table class="table">
			<thead>
				<tr><th>Id
					<th>Validade
					<th>Porcentagem de Desconto
					<th>Alterar
					<th>Remover
			</thead>
			<tbody>
				<c:forEach items="${cupons}" var="cupom">
					<tr><td>${cupom.id}
						<td><fmt:formatDate value="${cupom.validade.time}" pattern="dd/MM/yyyy" />
						<td><fmt:formatNumber type="percent" maxIntegerDigits="2" value="${cupom.desconto}" />
						<td><a href="alteraCupom?id=${cupom.id}">Altera</a>
						<td><a href="removeCupom?id=${cupom.id}">Remove</a>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="resources/js/jquery-1.11.3.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
</body>
</html>