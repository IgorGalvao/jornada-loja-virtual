<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Loja</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/confirmacao.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		
		<h2>Obrigado!</h2>
		
		<div class="jumbotron">
			<h3>Compra realizada com sucesso.</h3>
			<c:forEach items="${pedido.produtos}" var="produto" varStatus="contador">
				<c:if test="${pedido.produtos[(contador.index)].preco.tipoLivro == 'EBOOK'
						or pedido.produtos[(contador.index)].preco.tipoLivro == 'COMBO'}">
					<div class="row">
						<div class="col-sm-3">
							<img src='<c:url value="/images/" />${pedido.produtos[(contador.index)].livro.capa}' class="img-thumbnail img-responsive">
						</div>
						<div class="col-sm-9">
							<h4>${pedido.produtos[(contador.index)].livro.titulo}</h4>
							<p>${pedido.produtos[(contador.index)].livro.autor}</p>
							<a class="btn btn-primary" href="#" role="button" onClick="geraPdf()">Baixar</a>
						</div>
					</div>				
				</c:if>
			</c:forEach>
		</div>
		
	</div> <!-- .container -->

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	<script type="text/javascript">
	function geraPdf(){
		alert("Gerando PDF, aguarde...");
	}</script>
</body>
</html>