<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="resources/css/bootstrap.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="resources/css/menu.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="resources/css/style.css"/>" rel="stylesheet" type="text/css"/>
        <script src="<c:url value="resources/js/jquery.js"/>" type="text/javascript"></script>
	<script src="<c:url value="resources/js/bootstrap.js"/>" type="text/javascript"></script>

        <title>Painel Administrativo</title>
    </head>

    <body>
	<div class="container">

	    <div class="col-md-3"><%@include file="menu.jsp"%></div>

	    <div class="col-md-offset-2 col-md-6">


		<div class="col-md-5">
		    <h2>Login</h2>
		    <form action="efetuaLogin" method="post">

			<div class="input-group form-group">
			    <span class="input-group-addon" id="basic-addon1">@</span>
			    <input type="text" name="username" class="form-control" aria-describedby="sizing-addon1" placeholder="Usuario">
			</div>



			<div class="input-group form-group">
			    <span class="input-group-addon" id="basic-addon1">**</span>
			    <input type="password" name="senha" class="form-control" placeholder="Senha">
			</div>

			<input type="submit" value="Enviar" class="btn btn-primary"> 

			<div>Clique <a href="recuperar">aqui</a> para recuperar sua senha</div>

		    </form>

		    <center>
			${retorno}
		    </center>

		</div>    




	    </div>

	</div>
    </body>
</html>
