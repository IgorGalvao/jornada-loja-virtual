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

		<form action="confirmarPedido" method="POST">

			<div class="row">

				<fieldset class="col-sm-5">
					<legend>Dados de entrega</legend>
					
					<custom:inputLabel type="text" text="Endereço" id="endereco"/>
				
					<custom:inputLabel type="text" text="CEP" id="cep" />
					
					<custom:inputLabel type="text" text="Cidade" id="cidade" />
					
					<custom:inputLabel type="text" text="UF" id="uf" />
				</fieldset>
			
				<div class="col-sm-4">
					<fieldset>
						<legend>Dados de cobrança</legend>
						
						<custom:inputLabel type="text" text="Numero do Cartão" id="numeroCartao" />
						
						<custom:inputLabel type="text" text="CVV" id="cvvCartao" />
						
						<custom:inputLabel type="number" text="Validade (mês)" id="validadeMes" />

						<custom:inputLabel type="number" text="Validade (ano)" id="validadeAno" />
					</fieldset>
	
					<fieldset>
						<legend>Cupom de desconto</legend>
						
						<custom:inputLabel type="text" text="Código do Cupom" id="cupomId" />
					</fieldset>
				</div>
				
				<div class="col-sm-3">
				
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Produtos</h3>
						</div>
						<div class="panel-body">Produtos adicionados ao carrinho:</div>
						<ul class="list-group">
							<c:forEach items="${carrinho.compras}" var="compra">
								<li class="list-group-item">
									<h5>${compra.key.livro.titulo} - ${compra.key.livro.autor}</h5>
									<p>(${compra.key.preco.tipoLivro}) <fmt:formatNumber type="currency">${compra.key.preco.valor}</fmt:formatNumber> x ${compra.value}</p>
								</li>
							</c:forEach>
						</ul>
						<div class="panel-footer">
							<p>Total: <fmt:formatNumber type="currency">${carrinho.total}</fmt:formatNumber></p>
						</div>
					</div>
				</div>
				
			</div>

			<button type="submit" class="btn btn-primary">Confirmar compra</button>

		</form>
		
	</div> <!-- .container -->

	<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>