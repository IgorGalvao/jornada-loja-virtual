<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Usuários</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>
	<div class="container">
		<h2>Usuários cadastrados</h2>
		<table class="table">
			<thead>
				<tr><th>Id
					<th>Login
					<th>Senha
					<th>Email
					<th>Perfil
					<th>Alterar
					<th>Remover
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuario">
					<tr><td>${usuario.id}
						<td>${usuario.login}
						<td>${usuario.senha}
						<td>${usuario.email}
						<td>${usuario.perfil}
						<td><a href="alteraUsuario?id=${usuario.id}">Altera</a>
						<td><a href="removeUsuario?id=${usuario.id}">Remove</a>
				</c:forEach>
			</tbody>
		</table>
		
		<h4><a href="<c:url value="/cadastroUsuarios"/>">Cadastra novo usuario</a></h4>
	</div>
</body>
</html>