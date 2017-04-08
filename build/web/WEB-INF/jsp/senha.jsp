<%-- 
    Document   : senha
    Created on : 23/07/2016, 12:29:40
    Author     : Rafael Monteiro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                var nome = $('#nome').val();
                var senha = $('input:radio[name=senha]:checked').val();
		
               $.ajax({
                  url: 'cadastrarSenha',
                  data: 'nome='+nome+'&senha='+senha,
                  method: 'POST',
		  dataType: 'json',
                  success: function (data){
                      $('#nome').val('');
                      $('#resultado').html(data.retorno).fadeIn().delay(1000).fadeOut();
                  }
               });
            });
            
        });
    </script>
        <title>Painel Administrativo</title>
    </head>
    
    <body>
        
        <div class="container">
            
            <div class="col-md-3">
                <%@include file="menu.jsp" %>
            </div>
            
            <div class="col-md-6">
                <div class="senha">
                    <div class="form-group">
                    <input type="text" class="form-control" name="nome" id="nome">
		    
                    </div>
                    <button id="submit" class="btn btn-default">Gerar senha</button>
                    
                    <label>
                        <input type="radio" name="senha" checked="" class="toolbar-group-radio" value="0">Normal
                    </label>

                    <label>
                        <input type="radio" name="senha" class="toolbar-group-radio" value="1">Preferencial
                    </label>
                </div>
		<div id="resultado" class="alert-success"></div>
            </div>
            
        </div>
    </body>
</html>
