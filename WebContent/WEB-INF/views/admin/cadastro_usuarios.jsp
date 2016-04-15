<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

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
		<h2>Cadastrar novo usuário</h2>
		<form action="<c:url value='/admin/cadastraUsuario'/>" method="post">

			<custom:inputLabel type="text" text="Login" id="login" />
			
			<custom:inputLabel type="password" text="Senha" id="senha" />
			
			<custom:inputLabel type="email" text="Email" id="email" />
			
			<div class="form-group">
				<label for="perfil">Perfil</label>
				<custom:radioLabel name="perfil" value="PADRAO" text="Padrão" id="perfilPadrao" />
				<custom:radioLabel name="perfil" value="ADMINISTRADOR" text="Administrador" id="perfilAdministrador" />
			</div>

			<input type="submit" value="Cadastrar" class="btn">

		</form>
	</div>

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>

</body>
</html>