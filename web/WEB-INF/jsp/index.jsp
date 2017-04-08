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
	    <div class="col-md-6">
		<h2>Página inicial</h2>
		<c:choose>
		    <c:when test="${usuarioLogado.username!=null}">
			    <p>Bem vindo, ${usuarioLogado.username}</p> 
		    </c:when>
		    <c:otherwise>
			<p>Clique <a href="login">aqui</a> para acessar sua conta</p>
		    </c:otherwise>
		</c:choose>
                
	
	    </div>
        
	</div>
    </body>
</html>
