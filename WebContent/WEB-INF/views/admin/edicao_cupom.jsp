<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Cupons de Desconto</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/estilo.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		<h2>Alterar dados cadastrados</h2>
			<form action="<c:url value="/admin/concluirAlteracaoCupom"/>" method="post">
			<input type="hidden" id="id" name="id" value="${cupom.id}">
			<div class="form-group">
				<label for="titulo">Validade</label>
				<input type="text" id="validade" name="validade" class="form-control" autofocus
						value="<fmt:formatDate value="${cupom.validade.time}" pattern="dd/MM/yyyy" />">
			</div>
			<div class="form-group">
				<label for="capa">Porcentagem de Desconto</label>
				<input type="text" id="desconto" name="desconto" class="form-control"
						value="<fmt:formatNumber type="percent" maxIntegerDigits="2" value="${cupom.desconto}" />">
			</div>
			<input type="submit" value="<c:out value="${empty cupom.id ? 'Cadastrar' : 'Concluir Altera��o'}" />" class="btn">
		</form>
	</div>
	
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>