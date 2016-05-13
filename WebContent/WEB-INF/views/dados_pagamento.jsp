<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>
<jsp:useBean id="date" class="java.util.Date" />


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Loja - Checkout</title>
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/formulario.css'/>">	
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
							
							<custom:inputLabel type="text" text="Endereço" id="endereco" errorsPath="pedido.endereco"/>
						
							<div class="form-group">
								<label for="cep">CEP</label>
								<form:errors path="pedido.cep" cssClass="erro"/>
								<input type="text" id="cep" name="cep" class="form-control" data-mask="99999-999">
							</div>
							
							<div class="row">
								<div class="col-sm-7">						
									<custom:inputLabel type="text" text="Cidade" id="cidade" errorsPath="pedido.cidade" />
								</div>
								<div class="col-sm-5">
									<div class="form-group">
										<label for="uf">UF</label>
										<form:errors path="pedido.uf" cssClass="erro"/>
										<input type="text" id="uf" name="uf" class="form-control" data-mask="aa">
									</div>
								</div>
							</div>					
						</fieldset>
						<fieldset class="col-sm-6">
							<legend>Dados de cobrança</legend>
							
							<div class="form-group">
								<label for="numeroCartao">Número do Cartão</label>
								<form:errors path="pedido.numeroCartao" cssClass="erro"/>
								<input type="text" id="numeroCartao" name="numeroCartao" class="form-control" data-mask="9999 9999 9999 9999">
							</div>
							
							<div class="form-group">
								<label for="cvvCartao">CVV</label>
								<form:errors path="pedido.cvvCartao" cssClass="erro"/>
								<input type="text" id="cvvCartao" name="cvvCartao" class="form-control" data-mask="999">
							</div>
							
							<label>Validade</label>
							<div class="row">
								<div class="col-sm-5">
									<div class="form-group">
										<select class="form-control" name="validadeMes">
											<option value="">Mês</option>
											<c:forEach begin="1" end="12" varStatus="contador">
												<option value="${contador.index}">${contador.index}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="col-sm-7">
									<div class="form-group">
										<select class="form-control" name="validadeAno">
											<option value="">Ano</option>
											<c:forEach begin="0" end="19" varStatus="contador">
												<option value="${date.getYear() + 1900 + contador.index}">
													${date.getYear() + 1900 + contador.index}
												</option>
											</c:forEach>
										</select>
									</div>
								</div>								
							</div>
							<form:errors path="cupom.validadeCartao" cssClass="erro" />
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
								<div class="form-group">
									<label for="${id}">${text}</label>
									<c:if test="${erro != null}"><p class="erro">${erro}</p></c:if>
									<input type="text" id="codigoCupom" name="codigoCupom" class="form-control">
								</div>
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
	<script src="<c:url value='/resources/js/inputmask-plugin.js'/>"></script>
</body>
</html>