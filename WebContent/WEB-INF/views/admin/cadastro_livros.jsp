<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Livros</title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/estilo.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
	
		<h2>Cadastrar novo livro</h2>

		<form action="<c:url value='/admin/cadastraLivro'/>" method="post">

			<custom:inputLabel type="text" id="titulo" text="Título" />

			<custom:inputLabel type="text" id="capa" text="Capa" />

			<custom:inputLabel type="text" id="autor" text="Autor" />

			<div class="form-group">
				<label for="descricao">Descrição</label>
				<textarea rows="3" cols="100" name="descricao" class="form-control"></textarea>
			</div>

			<c:forEach items="${tiposLivros}" var="tipoLivro" varStatus="contador">
			    <div class="form-group">
			        <label for="preco_${tipoLivro}">Preço ${tipoLivro.label}</label>
			        <input type="text" name="precos[${contador.index}].valor" id="preco${tipoLivro}" class="form-control"/>
			        <input type="hidden" name="precos[${contador.index}].tipoLivro" value="${tipoLivro}"/>
			    </div>
			</c:forEach>

			<input type="submit" value="Cadastrar" class="btn">

		</form>

	</div>

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>

</body>
</html>