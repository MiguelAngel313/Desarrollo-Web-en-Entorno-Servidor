<%-- 
    Document   : Nacimiento
    Created on : 13 oct 2025, 18:03:35
    Author     : rmigu
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/style.css"/>
    </head>
    <body>
        <h1>Calculadora de edad</h1>
        <div class="formulario">
            <%
            
            Enumeration<String> parametros = request.getParameterNames();
            
            if (!parametros.hasMoreElements()) {
                 out.println("<p>Todos los campos son obligatorios.</p>");
                }
            else{
                try {
                    String fechaStr = request.getParameter("fecha");
                    LocalDate fechaNacimiento = LocalDate.parse(fechaStr);
                    LocalDate fechaActual = LocalDate.now();
                    String mensaje = "<p>Tienes ";
                    
                    if (fechaNacimiento.isAfter(fechaActual)) {
                            out.println("<p class=\"error\">La fecha itroducida no puede ser superior a la fecha actual</p>");
                        }
                    if (fechaNacimiento.isBefore(fechaActual)) {
                    Period diferencia = Period.between(fechaNacimiento, fechaActual);
                    int anios = diferencia.getYears();
                    int meses = diferencia.getMonths();
                    int dias = diferencia.getDays();
                    
                    if (anios != 0) {
                            mensaje += anios+" a&ntildeos ";
                        }
                    
                    if (meses != 0) {
                            mensaje += meses+" meses ";
                        }
                    if (dias != 0){
                        mensaje += dias+" dias";
                    }
                        mensaje += "</p>";
                        out.println(mensaje);
                        }
                    
                    if (fechaNacimiento.equals(fechaActual)) {
                    out.println("<p>Has nacido hoy.</p>");
                        }
                    
                    
                    } catch (Exception e) {
                        out.println("<p class=\"error\">Introduce una fecha v&aacutelida</p>");
                    }
            }
            
            %>
        </div>
        <div class="volver">
            <a href="../HTML/Nacimiento.html">Volver</a>
        </div>
    </body>
</html>
