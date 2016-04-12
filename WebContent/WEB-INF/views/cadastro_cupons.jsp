<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Cupons de Desconto</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>
	
	<div class="container">
		<h2><c:out value="${empty cupom.id ? 'Cadastrar novo cupom' : 'Alterar dados cadastrados'}" /></h2>
			<form action="<c:out value="${empty cupom.id ? 'cadastraCupom' : 'concluirAlteracaoCupom'}" />" method="post">
			<input type="hidden" id="id" name="id" value="${cupom.id}">
			<div class="form-group">
				<label for="titulo">Validade</label>
				<input type="date" id="validade" name="validade" class="form-control" autofocus value="${cupom.validade}">
			</div>
			<div class="form-group">
				<label for="capa">Porcentagem de Desconto</label>
				<input type="text" id="desconto" name="desconto" class="form-control" value="${cupom.desconto}">
			</div>
			<input type="submit" value="<c:out value="${empty cupom.id ? 'Cadastrar' : 'Concluir Altera��o'}" />" class="btn">
		</form>
	</div>
</body>
</html>