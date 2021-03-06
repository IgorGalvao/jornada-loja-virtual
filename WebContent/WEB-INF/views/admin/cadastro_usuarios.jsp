<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>�rea da Administra��o</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/formulario.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		<h2>Cadastrar novo usu�rio</h2>
		<form action="<c:url value='/admin/cadastraUsuario'/>" method="post">
			<div class="row">
				<div class="col-sm-4">
					<custom:inputLabel type="text" text="Login" id="login" errorsPath="usuario.login" />
				</div>
				<div class="col-sm-4">
					<custom:inputLabel type="password" text="Senha" id="senha" errorsPath="usuario.senha" />
				</div>	
				<div class="col-sm-4">
					<custom:inputLabel type="email" text="Email" id="email" errorsPath="usuario.email" />
				</div>				
			</div>			
			
			<div class="form-group">
				<label for="perfil">Perfil</label>
				<form:errors path="usuario.perfil" cssClass="erro"/>
				<custom:radioLabel name="perfil" value="PADRAO" text="Padr�o" id="perfilPadrao" />
				<custom:radioLabel name="perfil" value="ADMINISTRADOR" text="Administrador" id="perfilAdministrador" />
			</div>

			<input type="submit" value="Cadastrar" class="btn">

		</form>
		
				<h2>Usu�rios cadastrados</h2>
		<table class="table">
			<thead>
				<tr><th>Usu�rio
					<th>Email
					<th>Editar
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuarioLinha">
					<tr><td><div class="row">
								<div class="col-sm-5">
									${usuarioLinha.login}
								</div>
								<div class="col-sm-7">
									${usuarioLinha.perfil}
								</div>
							</div>
						<td>${usuarioLinha.email}
						<td><div class="row">
								<div class="col-sm-6">
									<a href="alteraUsuario?id=${usuarioLinha.id}">Alterar</a>
								</div>
								<div class="col-sm-6">
									<a href="removeUsuario?id=${usuarioLinha.id}">Remover</a>
								</div>
							</div>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>

</body>
</html>