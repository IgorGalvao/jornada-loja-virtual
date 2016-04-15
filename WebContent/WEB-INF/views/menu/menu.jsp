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
				<li><a href="<c:url value='/listaCupons'/>">Cupons</a>
				<li><a href="<c:url value='/listaUsuarios'/>">Usu�rios</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">Administrador<span class="caret"></span></a>
	  				<ul class="dropdown-menu">
						<li><a href="<c:url value='/admin/cadastroLivros'/>">Cadastrar livros</a>
						<li><a href="<c:url value='/admin/cadastroUsuarios'/>">Cadastrar usu�rios</a>
						<li><a href="<c:url value='/admin/cadastroCupons'/>">Cadastrar cupons de desconto</a>
					</ul>
				<li><p class="navbar-text">Logado como ${sessionScope.usuarioLogado.login}</p>
				<li class="active"><a href="<c:url value='/logout'/>">Logout<span class="sr-only">(current)</span></a>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>