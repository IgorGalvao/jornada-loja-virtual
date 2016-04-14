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

	<header>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Loja Virtual</a>
				</div>
			</div><!-- /.container-fluid -->
		</nav>
	</header>
	
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