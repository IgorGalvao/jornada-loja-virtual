<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Loja - Fechamento de Compra</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/fechamento.css'/>">
</head>
<body>
	<header>
		<c:import url="/WEB-INF/views/menu/menu.jsp"/>
	</header>
	<div class="container">
		
		<h2>Preencha os seus dados</h2>

		<div class="row">
			<div class="col-sm-8">
				<form action="confirmarPedido" method="POST">
					<div class="row">
						<fieldset class="col-sm-6">
							<legend>Dados de entrega</legend>
							
							<custom:inputLabel type="text" text="Endereço" id="endereco"/>
						
							<custom:inputLabel type="text" text="CEP" id="cep" />
							
							<div class="row">
								<div class="col-sm-7">						
									<custom:inputLabel type="text" text="Cidade" id="cidade" />
								</div>
								<div class="col-sm-5">						
									<custom:inputLabel type="text" text="UF" id="uf" />
								</div>
							</div>					
						</fieldset>
						<fieldset class="col-sm-6">
							<legend>Dados de cobrança</legend>
							
							<custom:inputLabel type="text" text="Numero do Cartão" id="numeroCartao" />
							
							<custom:inputLabel type="text" text="CVV" id="cvvCartao" />
							
							<custom:inputLabel type="number" text="Validade (mês)" id="validadeMes" />
		
							<custom:inputLabel type="number" text="Validade (ano)" id="validadeAno" />
						</fieldset>
					</div>
					<button type="submit" class="btn btn-primary">Confirmar compra</button>
				</form>
			</div>
			<div class="col-sm-4">
			
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Produtos no carrinho</h3>
					</div>
					<ul class="list-group">
						<c:forEach items="${carrinho.itens}" var="itemCarrinho">
							<li class="list-group-item">
								<h5>${itemCarrinho.livro.titulo} - ${itemCarrinho.livro.autor}</h5>
								<p>${itemCarrinho.preco.tipoLivro} (${itemCarrinho.quantidade}) - <fmt:formatNumber type="currency">${itemCarrinho.valorItem}</fmt:formatNumber></p>
							</li>
						</c:forEach>
					</ul>
					<div class="panel-footer">
						<p>Subtotal: <fmt:formatNumber type="currency">${carrinho.subtotal}</fmt:formatNumber></p>
						<c:if test="${cupomAtivo != null}">
							<p>Cupom ${cupomAtivo.codigo}: <fmt:formatNumber type="percent" maxIntegerDigits="2" value="${cupomAtivo.desconto}" /> de desconto</p>
						</c:if>
						<strong>Total: <fmt:formatNumber type="currency">${totalPedido}</fmt:formatNumber></strong>
					</div>
				</div>

				<c:choose>
					<c:when test="${cupomAtivo == null}">
						<form action="incluirCupom" method="post">
							<fieldset>
								<legend>Cupom promocional</legend>
								<custom:inputLabel type="text" text="Código" id="codigoCupom" />
							</fieldset>
							<button type="submit" class="btn btn-primary">Utilizar cupom</button>
						</form>						
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="removerCupom" role="button">Remover Cupom</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div> <!-- .container -->

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>