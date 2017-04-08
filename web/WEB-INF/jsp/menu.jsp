<!-- Sidebar -->
<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
	<li class="sidebar-brand">
	    <a href="index">
		Painel administrativo
	    </a>
	<c:choose>
	    <c:when test="${usuarioLogado.username==null}">
		<li><a>Bem vindo visitante!</a></li>
		<li><a href="registro">Clique aqui para cadastrar</a></li>
		<li><a href="login">Clique aqui para acessar</a></li>
	    </c:when>
	    <c:when test="${usuarioLogado.username=='admin'}">
		<li><a href="">Cadastrar novos usuarios</a></li>
		<li>
		    <a href="senha">Gerar senha</a>
		</li>
		<li>
		    <a href="cadastro">Cadastrar usuarios</a>
		</li>
		<li class="dropdown">
		    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Acessar cadastros <span class="caret"></span></a>
		    <ul class="dropdown-menu">
			<li><a href="consultar">Acessar todos</a></li>
			<li><a href="consultarPorNome">Buscar por nome</a></li>
			<li><a href="#">Buscar por cpf</a></li>

		    </ul>
		</li> 
		<li>
		    <a href="logout">Sair</a>
		</li>
	    </c:when>
	    <c:otherwise>
		<li>
		    <a href="senha">Gerar senha</a>
		</li>
		<li>
		    <a href="cadastro">Cadastrar usuarios</a>
		</li>
		<li class="dropdown">
		    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Acessar cadastros <span class="caret"></span></a>
		    <ul class="dropdown-menu">
			<li><a href="consultar">Acessar todos</a></li>
			<li><a href="consultarPorNome">Buscar por nome</a></li>
			<li><a href="#">Buscar por cpf</a></li>

		    </ul>
		</li> 
		<li>
		    <a href="logout">Sair</a>
		</li>
	    </c:otherwise>
	</c:choose>
	</li>


    </ul>
</div>
<!-- /#sidebar-wrapper -->