<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Login na Aplicação</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>
	
	<div class="container">
		<h2>Login</h2>
			<form action="efetuaLogin" method="post">
			<div class="form-group">
				<label for="login">Login</label>
				<input type="text" id="login" name="login" class="form-control" autofocus>
			</div>
			<div class="form-group">
				<label for="senha">Senha</label>
				<input type="password" id="senha" name="senha" class="form-control">
			</div>
			<input type="submit" value="Entrar" class="btn">
		</form>
	</div>
</body>
</html>