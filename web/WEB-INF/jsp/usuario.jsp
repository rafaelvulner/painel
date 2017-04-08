<%-- 
    Document   : usuario
    Created on : 24/07/2016, 21:58:21
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
	    $(document).ready(function () {

		var id = $('#id').val();

		$('#delet').click(function (e) {

		    if (confirm('Deseja excluir?')) {
			$.get('Controller/ExcluirCadastroController.php', {id: id}, function (responseText) {
			    alert('Cadastro excluido com sucesso!');
			    $(location).attr('href', 'consulta.php');
			});
		    } else {
			e.default;
		    }

		});

		$.ajax({
		    url: 'buscarUsuario',
		    data: 'id=' +${param.id},
		    method: 'POST',
		    dataType: 'json',
		    success: function (data) {

			$('#tabela > tbody').append('<tr><td>' + data.nome + '</td><td>' + data.rua + '</td><td>' + data.bairro + '</td><td>' + data.cidade + '</td><td>' + data.rg + '</td><td>' + data.cpf + '</td><td>' + data.telefone + '</td><td>' + data.data + '</td></tr>');

			$('#img').attr('src', data.foto);

		    }

		});


	    });




        </script>

        <title>Acesso a usuarios</title>
    </head>
    <body>

	<div id="wrapper">

	    <!-- Sidebar -->
	    <%@include file="menu.jsp" %>
	    <!-- /#sidebar-wrapper -->

	    <!-- Page Content -->
	    <div id="page-content-wrapper">
		<div class="container-fluid">
		    <div class="row">
			<div class="col-lg-12">
			    <table class="table table-bordered table-responsive" id="tabela">
				<thead>
				    <tr>
					<th>Nome</th>
					<th>Rua</th>
					<th>Bairro</th>
					<th>Cidade</th>
					<th>Rg</th>
					<th>CPF</th>
					<th>Telefone</th>
					<th>Data de cadastro</th>
				    </tr>
				</thead>
				<tbody>

				</tbody>

			    </table>
			    <a href="consultarPorNome"><input type="button" value="Voltar" class="btn btn-primary"></a>
			    <a href="alterarDados?Id=${param.id}"><input type="button" value="Alterar dados" class="btn btn-primary"></a>

			    <input type="button" value="Excluir" id="delet" class="btn btn-danger">
			    <div class="row">
				<div>
				    <center>
					<img style="width: 450px;height: 320px" id="img" class="img-responsive" src="">
				    </center>
				</div>

			    </div>
			    <center>
				<a href="#menu-toggle" class="btn btn-success" id="menu-toggle">Remover menu/Acessar menu</a>
			    </center>
			</div>
		    </div>
		</div>
	    </div>
	    <!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->


	<!-- Menu Toggle Script -->
	<script>
	    $("#menu-toggle").click(function (e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	    });
	</script>

    </body>
</html>
