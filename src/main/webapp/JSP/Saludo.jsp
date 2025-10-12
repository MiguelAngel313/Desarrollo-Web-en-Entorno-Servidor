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
                        out.println("<table>");
                        out.println("<tr><th>Par&aacutemetros</th><th>Valor</th></tr>");
                        
                        while (parametros.hasMoreElements()) {
                                 String nombreParametro = parametros.nextElement();
                                 String[] valores = request.getParameterValues(nombreParametro);
                                 
                                 if (valores != null && valores.length > 1) {
                                         out.println("<tr>");
                                         out.println("<td>"+nombreParametro+"</td>");
                                         
                                         for (int i = 0; i < valores.length; i++) {
                                                 if (i > 0) out.println(", ");
                                                 out.println(valores[i] != null ? valores[i] : "");
                                             }
                                         out.println("</td>");
                                         out.println("</tr>");
                                     } else {
                                    String valorParametro = request.getParameter(nombreParametro);
                                    out.println("<tr>");
                                    out.println("<td><strong>" + nombreParametro + "</strong></td>");
                                    out.println("<td>" + (valorParametro != null ? valorParametro : "") + "</td>");
                                    out.println("</tr>");
                                     }
                            }
                        out.println("</table>");
                    }
            %>
        </div>
        <div class="volver">
            <a href="../HTML/Saludo.html">Volver</a>
        </div>
    </body>
</html>
