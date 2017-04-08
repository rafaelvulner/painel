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
	<script>
        $(document).ready(function() {
            $('#submit').click(function (){
		//Pega as informações do botão para criar o loading
                    var $btn = $(this).button('loading');
		    
		var email = $('#email').val();
               $.ajax({
                  url: 'recuperarSenha',
                  data: 'email='+email,
                  method: 'POST',
		  dataType: 'json',
                  success: function (data){
                      
                      if (data.retorno==="Sua senha foi enviada para seu email") {
			  $('#retorno').html('<div class="alert alert-success">'+data.retorno+'</div>').fadeIn().delay(5000).fadeOut();
    $btn.button('reset');
}else{
    $('#retorno').html('<div class="alert alert-danger">'+data.retorno+'</div>');
    $btn.button('reset');
}
                  }
               });
            });
            
        });
    </script>    
        <title>Painel Administrativo</title>
    </head>

    <body>
	<div class="container">
	    <div class="col-md-3"><%@include file="menu.jsp" %></div>
	    <div class="col-md-6 corpo">
		
		<div class="form-group">
		Digite seu e-mail de cadastro para recuperar sua senha
		<input type="email" id="email" name="email" class="form-control">
		</div>
		
		<div class="form-group">
                <button id="submit" type="submit" class="btn btn-primary" data-loading-text="Loading...">Enviar</button>
		</div>
		<div id="retorno"></div>
	    </div>
        
	</div>
    </body>
</html>
