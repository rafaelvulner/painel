<%-- 
    Document   : cadastroPorNome
    Created on : 24/07/2016, 21:23:19
    Author     : Rafael Monteiro
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="resources/css/bootstrap.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="resources/css/menu.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="resources/css/style.css"/>" rel="stylesheet" type="text/css"/>
        <script src="<c:url value="resources/js/jquery.js"/>" type="text/javascript"></script>
	<script src="<c:url value="resources/js/bootstrap.js"/>" type="text/javascript"></script>
	<script>
	    $(document).ready(function () {

		$('#submit').click(function () {
		    var nome = $('#nome').val();
		    if (nome === "") {
			$('#aviso').html('<h1>Favor digitar um nome!</h1>').fadeIn().delay(1000).fadeOut();
			return;
		    }
		    $.ajax({
			url: "retornarNomes",
			data: 'nome=' + nome,
			method: 'POST',
			dataType: 'json',
			success: function (data) {
			    //Faz um ForEach do retorno do arrayJSON
			    $.each(data, function (idx, obj) {

				//Dentro da tabela > tBody ele cria as propriedades
				$('#tabela > tbody').append('<tr><td><a href="usuario?id=' + obj.Id + '">' + obj.nome + '</a></td></tr>');


			    });
			}
		    });
		});
		//Cria um AJAX para buscar os dados no controller e retornar um JSON



	    });
        </script>
        <title>Painel Administrativo</title>
    </head>
</head>
<body>
    <div class="col-md-3">
	<%@include file="menu.jsp" %>
    </div>
    <div class="container">
	<div class="col-md-9 corpo">

	    <div class="col-md-2">
		<input type="button" class="btn btn-primary" value="Buscar" name="verificar" id="submit">
	    </div>

	    <div class="form-group col-md-8">
		<input type="text" class="form-control" name="nome" id="nome">
	    </div>


	    <div class="quadro">
		<table class="table table-striped" id="tabela">
		    <tbody>
			
		    </tbody>
		</table>
	    </div>
	    <center>
                <div id="aviso"></div>
	    </center>
	</div>
    </div>
</body>
</html>
