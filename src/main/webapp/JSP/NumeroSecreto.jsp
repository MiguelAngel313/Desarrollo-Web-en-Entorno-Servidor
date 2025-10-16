<%-- 
    Document   : NumeroSecreto
    Created on : 14 oct 2025, 23:31:10
    Author     : rmigu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/style.css">
        <title>N&uacute;mero secreto</title>
    </head>
    <body>
        <h1>Adivina el n&uacute;mero secreto</h1>
        <div class="formulario">
            <p>Intenta adivinar el n&uacute;mero secreto con el menor n&uacute;mero de intentos posibles.</p>
            <form action="./NumeroSecreto.jsp" method="post">
                <label for="num"> Introduce un n&uacute;mero de 1 a 100:</label>
                <input type="number" name="numero">
                <input class="boton" type="submit" value="Probar">
            </form>
            <%
                String error = "";
                String mensaje = "";
                Integer numeroIntroducido = null;
                Random random = new Random();
                Integer numeroAleatorio = random.nextInt(1, 100);
                ArrayList<Integer> numeros = new ArrayList<>();
                ArrayList<String> mensajes = new ArrayList<>();

                // Verificar si el parámetro existe y no es nulo/vacío
                String numeroParam = request.getParameter("numero");
                if (numeroParam != null && !numeroParam.trim().isEmpty()) {
                    try {
                        numeroIntroducido = Integer.parseInt(numeroParam);

                        if (numeroIntroducido < 1 || numeroIntroducido > 100) {
                            error = "<p class=\"error\">El n&uacute;mero debe estar entre 1 y 100</p>";
                        } else {
                            numeros.add(numeroIntroducido);

                            if (numeroIntroducido < numeroAleatorio) {
                                mensaje = "El n&uacute;mero que he pensado es m&aacute;s alto.";
                                mensajes.add(mensaje);
                            } else if (numeroIntroducido > numeroAleatorio) {
                                mensaje = "El n&uacute;mero que he pensado es m&aacute;s bajo.";
                                mensajes.add(mensaje);
                            } else if (numeroIntroducido == numeroAleatorio) {
                                mensaje = "Acierto";
                                mensajes.add(mensaje);
                            }

                            out.println("<table>");
                            out.println("<tr>");
                            out.println("<th>Intento</th>");
                            for (Integer num : numeros) {
                                out.println("<td>" + num + "</td>");
                            }
                            out.println("</tr>");
                            out.println("<tr>");
                            out.println("<th>Mensaje</th>");
                            for (String men : mensajes) {
                                out.println("<td>" + men + "</td>");
                            }
                            out.println("</tr>");
                        }
                    } catch (NumberFormatException e) {
                        error = "<p class=\"error\">Por favor, introduce un n&uacute;mero v&aacute;lido</p>";
                    }
                }

                // Mostrar error si existe
                if (!error.isEmpty()) {
                    out.println(error);
                }
            %>
        </div>
    </body>
</html>
