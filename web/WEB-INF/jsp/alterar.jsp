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
	<script>
            $(document).ready(function () {
                
	         $.ajax({
                url: 'buscarUsuario',
                 data: 'id='+${param.Id},
                 method: 'POST',
                 dataType: 'json',
                 success: function(data){
                  
                        
                        $('#nome').val(data.nome);
                        $('#rua').val(data.rua);
                        $('#bairro').val(data.bairro);
                        $('#cidade').val(data.cidade);
                        $('#rg').val(data.rg);
                        $('#cpf').val(data.cpf);
                        $('#telefone').val(data.telefone);
                        $('#data').val(data.data);
			$('#foto').val(data.foto);
                        $('#img').attr('src',data.foto);
                  
            
                 }
                 
                 });
                 
                var form = $('#form');
                $('#submit').click(function (event) {
                    $.ajax({
                        url: 'alterarUsuario',
                        data: form.serialize(),
                        type: 'post',
                        success: function (data) {
                            $('#resultado').html(data).fadeIn().delay(1000).fadeOut();
                        }
                    });
                });
                 
                 
              });



           
        </script>
        <title>Atualizar cadastro</title>
    </head>
    <body>
       
        <div class="corpo">
            <div class="col-md-6">
            <table class="table table-bordered">
                <form id="form">
                        <tr>
                            <td>Nome</td>
                            <td> <input type="text" value="" id="nome" name="nome" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Rua</td>
                            <td><input type="text" value="" id="rua" name="rua" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Bairro</td>
                            <td><input type="text" value="" id="bairro" name="bairro" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Cidade</td>
                            <td><input type="text" value="" id="cidade" name="cidade" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>RG</td>
                            <td><input type="text" value="" id="rg" name="rg" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>CPF</td>
                            <td><input type="text" value="" id="cpf" name="cpf" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Telefone</td>
                            <td><input type="text" value="" id="telefone" name="telefone" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Data</td>
                            <td><input type="text" value="" id="data" name="data" class="form-control"></td>
                        </tr>
			
			<tr>
                            <td>Foto</td>
                            <td><input type="text" value="" id="foto" name="foto" class="form-control" readonly></td>
                        </tr>
                        <!--Leva o ID até o controler para fazer update-->
                        <input type="hidden" value="${param.Id}" name="id">
                        </form>
                        
                </table>
                <input type="button" value="Atualizar" class="btn btn-primary" id="submit">
                <a href="usuario?id=${param.Id}"><input type="button" value="Voltar" class="btn btn-primary"></a>
                <div id="resultado"></div>
                </div>
            <input type="hidden" value="<?php echo $_GET['Id'] ?>" id="id">
            
            
            
           
            <div class="row">
                <div>
                    <form action="alterarImagem" method="POST" enctype="multipart/form-data">
                    <center>
                        <img style="width: 450px;height: 320px" id="img" class="img-responsive">
                        <input type="file" name="foto" required="">
                        <input type="hidden" value="${param.Id}" name="id">
                        <input type="submit" value="Atualizar" class="btn btn-primary">
                    </center>
                    </form>
                </div>
            </div>
          
        </div>
        
    </body>
</html>
