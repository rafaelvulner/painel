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
	    <div class="col-md-3"><%@include file="menu.jsp" %></div>
	    <div class="col-md-6 corpo">
		<form action="registrar" method="POST">
		    <div class="form-group">
			Nome <input type="text" id="nome" name="nome" class="form-control" required="">
		    </div>
		    
		    <div class="form-group">
			Email <input type="text" id="email" name="email" class="form-control" required="" placeholder="">			    <div class="alert-danger">${email}</div>
		    </div>
		    
		    <div class="form-group">
			Usuario <input type="text" id="username" name="username" class="form-control" required="">
			<div class="alert-danger">${username}</div>
		    </div>
		    
		    <div class="form-group">
			Senha <input type="password" id="senha" name="senha" class="form-control" required="">
		    </div>
		    <button id="cadastrar" type="submit" class="btn btn-primary">Cadastrar</button>
		    
		</form>
		    
		    <div>${sucesso}</div>
	    </div>
        
	</div>
    </body>
</html>
