<%-- 
    Document   : Saludo
    Created on : 9 oct 2025, 22:35:50
    Author     : rmigu
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/style.css">
        <title>Saludo</title>
    </head>
    <body>
        <h1>Datos del formulario</h1>
        <div class="formulario">
            <%
                Enumeration<String> parametros=request.getParameterNames();
                String nombreParametro;
                String valorParametro;
                
                if (parametros == null || !parametros.hasMoreElements()) {
                    }
                else{
                     while (parametros.hasMoreElements()) {
                             
                         nombreParametro = parametros.nextElement();
                         valorParametro = request.getParameter(nombreParametro);
                         out.println("<p>"+nombreParametro + ": "+ valorParametro+"</p>");
                         
                         }
   
                }
            %>
        </div>
    </body>
</html>
