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
                
                if (!parametros.hasMoreElements()) {
                        out.println("<p>Todos los campos son obligatorios.");
                    } else {                     
                        while (parametros.hasMoreElements()) {
                                 String nombre=parametros.nextElement();
                                 String[] valores = request.getParameterValues(nombre);
                                 
                                for (int i = 0; i < valores.length; i++) {
                                        if (valores[i].equals("Hombre")) {
                                                out.println("Buenas tardes se&ntildeor "+nombre);
                                            }
                                    }
                            }
                    }
            %>
        </div>
        <div class="volver">
            <a href="../HTML/Saludo.html">Volver</a>
        </div>
    </body>
</html>
