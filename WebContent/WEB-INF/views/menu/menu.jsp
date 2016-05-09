<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<a class="navbar-brand" href="<c:url value='/listaLivros'/>">Loja Virtual</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<c:if test="${usuarioLogado.perfil == 'ADMINISTRADOR'}">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Administrador<span class="caret"></span></a>
	  				<ul class="dropdown-menu">
						<li><a href="<c:url value='/admin/cadastroLivros'/>">Cadastrar novo livro</a>
						<li role="separator" class="divider">
						<li><a href="<c:url value='/admin/cadastroUsuarios'/>">Administrar usuários cadastrados</a>
						<li><a href="<c:url value='/admin/cadastroCategorias'/>">Administrar categorias de livros</a>
						<li><a href="<c:url value='/admin/cadastroCupons'/>">Administrar cupons de desconto</a>
					</ul>
			</c:if>
				<li><p class="navbar-text">Logado como ${usuarioLogado.login}</p>
				<li><a href="<c:url value='/exibirCarrinho' />">Carrinho</a>
				<li class="active"><a href="<c:url value='/logout'/>">Logout<span class="sr-only">(current)</span></a>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>