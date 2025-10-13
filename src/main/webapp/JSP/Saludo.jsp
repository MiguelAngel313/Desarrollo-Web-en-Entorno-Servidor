<%-- 
    Document   : Saludo
    Created on : 9 oct 2025, 22:35:50
    Author     : rmigu
--%>

<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
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
                String nombrePersona = request.getParameter("Nombre");
                LocalTime horaActual = LocalTime.now();
                String mensaje = "";
                
                if (horaActual.isBefore(LocalTime.of(13, 0)) && horaActual.isAfter(LocalTime.of(8, 0))) {
                        mensaje = "Buenos dias ";
                    }
                if (horaActual.isBefore(LocalTime.of(21, 1)) && horaActual.isAfter(LocalTime.of(13, 0))) {
                        mensaje = "Buenas tardes ";
                    }
                if (horaActual.isBefore(LocalTime.of(7, 59)) && horaActual.isAfter(LocalTime.of(21, 1))) {
                        mensaje = "Buenas noches ";
                    }
                
                
                if (!parametros.hasMoreElements()) {
                        out.println("<p>Todos los campos son obligatorios.</p>");
                    } else {                     
                        while (parametros.hasMoreElements()) {
                                 String nombre=parametros.nextElement();
                                 String[] valores = request.getParameterValues(nombre);
                                 
                                for (int i = 0; i < valores.length; i++) {
                                        if (valores[i].equals("Hombre")) {
                                                out.println("<p>"+mensaje+"se&ntildeor "+nombrePersona+"</p>");
                                            }
                                        if (valores[i].equals("Mujer")) {
                                               out.println("<p>"+mensaje+"se&ntildeora "+nombrePersona+"</p>"); 
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
