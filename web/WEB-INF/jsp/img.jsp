<%-- 
    Document   : img
    Created on : 23/07/2016, 13:38:17
    Author     : Rafael Monteiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="uploadimg" enctype="multipart/form-data">
            <input type="file" name="foto"> <br /> 
            <input type="submit" value="Upload">
        </form>
    </body>
</html>
