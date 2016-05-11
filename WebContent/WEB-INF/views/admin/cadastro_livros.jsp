<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Cadastro de Livros</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/formulario.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
	
		<h2>Cadastrar novo livro</h2>

		<form action="<c:url value='/admin/cadastraLivro'/>" method="post">

			<div class="row">
				<div class="col-sm-6">
					<custom:inputLabel type="text" id="titulo" text="Título" errorsPath="livro.titulo" />
				</div>
				<div class="col-sm-6">
					<custom:inputLabel type="text" id="capa" text="Capa" errorsPath="livro.capa" />				
				</div>				
			</div>
			<div class="row">
				<div class="col-sm-6">
					<custom:inputLabel type="text" id="autor" text="Autor" errorsPath="livro.autor" />				
				</div>
				<div class="form-group col-sm-6">
					<label for="categoria">Categoria</label>
					<form:errors path="livro.categoria" cssClass="erro" />
					<select class="form-control" name="categoria">
							<option value="">Selecione uma categoria</option>
						<c:forEach items="${categorias}" var="categoria">
							<option value="${categoria.id}">${categoria.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="descricao">Descrição (até 500 caracteres)</label>
				<form:errors path="livro.descricao" cssClass="erro"/>
				<textarea rows="3" cols="100" name="descricao" class="form-control"></textarea>
			</div>

			<div class="row">
			<c:forEach items="${tiposLivros}" var="tipoLivro" varStatus="contador">
			    <div class="form-group col-sm-4">
			        <label for="preco_${tipoLivro}">Preço ${tipoLivro.label}</label>
			        <form:errors path="livro.precos[${contador.index}]" cssClass="erro" />
			        <input type="text" name="precos[${contador.index}].valor" id="preco${tipoLivro}" class="form-control" />
			        <input type="hidden" name="precos[${contador.index}].tipoLivro" value="${tipoLivro}"/>
			    </div>
			</c:forEach>
			</div>

			<input type="submit" value="Cadastrar" class="btn">

		</form>

	</div>

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>