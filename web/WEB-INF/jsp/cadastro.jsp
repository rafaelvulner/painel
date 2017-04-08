<%-- 
    Document   : cadastro
    Created on : 23/07/2016, 21:23:36
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
	<script src="<c:url value="resources/js/jquery.mask.min.js"/>" type="text/javascript"></script>
	<script>
	    $(document).ready(function () {
		//Criando a data para o formulario
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();

		if (dd < 10) {
		    dd = '0' + dd
		}

		if (mm < 10) {
		    mm = '0' + mm
		}

		today = dd + '/' + mm + '/' + yyyy;

		$('#data').val(today);
		//Fim da data

		//Criando as mascaras para o formulario
		$('#rg').mask('99999999-9');
		$('#cpf').mask('999.999.999-99');
		$('#telefone').mask('(99)99999-9999');

	    });
	</script>

        <title>Painel Administrativo</title>
    </head>
    <body>
        <div class="container">
            <div class="col-md-3">
                <%@include file="menu.jsp" %>
            </div>

            <div class="col-md-6 corpo">

		<form id="form" action="cadastrar" enctype="multipart/form-data" method="POST">

		    <div class="form-group">
			<label for="nome">Nome</label>
			<input class="form-control" type="text" name="nome" id="nome" required="">
		    </div>

		    <div class="form-group">
			<label for="rua">Rua</label>
			<input class="form-control" type="text" name="rua" id="rua" placeholder="Exemplo: Rua José Carlos Almeida 567" required="">
		    </div>


		    <div class="form-group">
			<label for="bairro">Bairro</label>
			<input class="form-control" type="text" name="bairro" id="bairro" required="">
		    </div>

		    <div class="form-group">
			<label for="cidade">Cidade</label>
			<input class="form-control" type="text" name="cidade" id="cidade" required="">
		    </div>

		    <div class="form-group">
			<label for="rg">RG</label>
			<input class="form-control" type="text" name="rg" id="rg" required="">
		    </div>

		    <div class="form-group">
			<label for="cpf">CPF</label>
			<input class="form-control" type="text" name="cpf" id="cpf" required="">
		    </div>

		    <div class="form-group">
			<label for="telefone">Telefone</label>
			<input class="form-control" type="text" name="telefone" id="telefone" required="">
		    </div>

		    <div class="form-group">
			<label for="data">Data</label>
			<input class="form-control" type="text" name="data" id="data" readonly="">
		    </div>

		    <div class="form-group">
			<label for="foto">Foto</label>
			<input class="form-control" type="file" name="file" id="foto">
		    </div>
		    <input type="submit" class="btn btn-primary" id="submit" value="Cadastrar">

		    </div>
		    </div>
		    </body>
		    </html>
