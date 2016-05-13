<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Loja Virtual</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/listalivros.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		<h2>Nossos livros</h2>		
		
		<form id="filtro" class="form-horizontal">
			<div class="row">
				<label class="col-sm-2 control-label" for="dropdown">Filtrar categoria</label>
				<div class="col-xs-3">
				<select id="dropdown" class="form-control">
					<option>Todas</option>
					<c:forEach items="${categorias}" var="categoria">
						<option>${categoria.nome}</option>
					</c:forEach>	
				</select>
				</div>
			</div>
		</form>
		
		<div id="thumbnailslivros" class="row">
			<c:forEach items="${livros}" var="livro" varStatus="contador">
				<div class="col-xs-6 col-sm-4 col-md-3 panellivro ${livro.categoria.nome}">
					<div class="thumbnail">
						<a href="mostraDetalhes?id=${livro.id}">
							<img src='<c:url value="/images/" />${livro.capa}' class="img-thumbnail img-responsive capa">
						</a>
						<div class="caption">
						<div class="label label-primary">${livro.categoria.nome}</div>
							<h4>${livro.titulo}</h4>
							<p>${livro.autor}</p>
							<c:choose><c:when test="${sessionScope.usuarioLogado.perfil == 'ADMINISTRADOR'}">
								<div class="btn-group" role="group">
									<a href="admin/alteraLivro?id=${livro.id}">
											<button type="button" class="btn btn-default">Altera</button></a>
									<a href="admin/removeLivro?id=${livro.id}">
											<button type="button" class="btn btn-default">Remove</button></a>
								</div>
							</c:when></c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	<script src="<c:url value='/resources/js/listalivros.js'/>"></script>
</body>
</html>