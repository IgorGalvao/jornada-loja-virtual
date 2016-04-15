<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Usuários</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/estilo.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		<h2>Alterar dados cadastrados</h2>
			<form action="<c:url value="/admin/concluirAlteracaoUsuario"/>" method="post">
			<input type="hidden" id="id" name="id" value="${usuario.id}">
			<div class="form-group">
				<label for="login">Login</label>
				<input type="text" id="login" name="login" class="form-control" autofocus value="${usuario.login}">
			</div>
			<div class="form-group">
				<label for="senha">Senha</label>
				<input type="password" id="senha" name="senha" class="form-control" value="${usuario.senha}">
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" id="email" name="email" class="form-control" value="${usuario.email}">
			</div>
			<div class="form-group">
				<label for="perfil">Perfil</label>
				<div class="radio">
					<label><input type="radio" name="perfil" id="perfilPadrao" value="PADRAO"
							<c:if test="${usuario.perfil == 'PADRAO'}">checked</c:if>>Padrão</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="perfil" id="perfilAdministrador" value="ADMINISTRADOR"
							<c:if test="${usuario.perfil == 'ADMINISTRADOR'}">checked</c:if>>Administrador</label>
				</div>
			</div>
			<input type="submit" value="Concluir Alteração" class="btn">
		</form>
	</div>
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>