<%-- 
    Document   : consulta
    Created on : 23/07/2016, 23:00:58
    Author     : Rafael Monteiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
        <link href="<c:url value="resources/css/bootstrap.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="resources/css/menu.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="resources/css/style.css"/>" rel="stylesheet" type="text/css"/>
        <script src="<c:url value="resources/js/jquery.js"/>" type="text/javascript"></script>
	<script src="<c:url value="resources/js/bootstrap.js"/>" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.12/af-2.1.2/b-1.2.1/b-colvis-1.2.1/b-flash-1.2.1/b-html5-1.2.1/b-print-1.2.1/cr-1.3.2/fc-3.2.2/fh-3.1.2/kt-2.1.2/r-2.1.0/rr-1.1.2/sc-1.4.2/se-1.2.0/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.12/af-2.1.2/b-1.2.1/b-colvis-1.2.1/b-flash-1.2.1/b-html5-1.2.1/b-print-1.2.1/cr-1.3.2/fc-3.2.2/fh-3.1.2/kt-2.1.2/r-2.1.0/rr-1.1.2/sc-1.4.2/se-1.2.0/datatables.min.js"></script>
	<script>
            $(document).ready(function () {
                $('#tabela').dataTable({
                    ajax: {
                        url: 'retorno',
                        dataSrc: ''
                    },
                    columns: [
                        {data: 'nome'},
                        {data: 'rua'},
                        {data: 'bairro'},
                        {data: 'cidade'},
			{data: 'rg'},
			{data: 'cpf'},
			{data: 'telefone'},
			{data: 'data'}
                    ],
		     dom: 'Bfrtip',
        buttons: [
	    {extend: 'copy', text: 'copiar'},
	    {extend: 'print', text: 'imprimir'},
            'csv', 'excel', 'pdf'
        ],
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
                    }
   
                });

            });

        </script>
        <title>Painel Administrativo</title>
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
		<table id="tabela" class="table table-striped">
		    <thead>
			<tr>
			    <th>Nome</th>
			    <th>Rua</th>
			    <th>Bairro</th>
			    <th>Cidade</th>
			    <th>RG</th>
			    <th>CPF</th>
			    <th>Telefone</th>
			    <th>Data</th>
			</tr>
		    </thead>
		    <tbody>
			
		    </tbody>
		</table>
	    </div>
		    </div>
		</div>
	</div>
      </div>
	    <center>
				<a href="#menu-toggle" class="btn btn-success" id="menu-toggle">Remover menu/Acessar menu</a>
			    </center>
	<script>
	    $("#menu-toggle").click(function (e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	    });
	</script>
    </body>
</html>
