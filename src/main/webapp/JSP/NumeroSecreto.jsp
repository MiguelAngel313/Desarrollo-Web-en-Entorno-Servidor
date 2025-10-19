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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/style.css">
        <title>N&uacute;mero secreto</title>
    </head>
    <body>
        <h1>Adivina el n&uacute;mero secreto</h1>
        <div class="formulario">
            <p>Intenta adivinar el n&uacute;mero secreto con el menor n&uacute;mero de intentos posibles.</p>
            
            <%
                String error = "";
                String mensaje = "";
                Integer numeroIntroducido = null;
                
                // Obtener parámetros del request
                String numeroAleatorioStr = request.getParameter("numeroAleatorio");
                String numerosStr = request.getParameter("numeros");
                String mensajesStr = request.getParameter("mensajes");
                
                Integer numeroAleatorio = null;
                ArrayList<Integer> numeros = new ArrayList<>();
                ArrayList<String> mensajes = new ArrayList<>();
                
                // Si no hay número aleatorio, generar uno nuevo (primera vez)
                if (numeroAleatorioStr == null || numeroAleatorioStr.isEmpty()) {
                    Random random = new Random();
                    numeroAleatorio = random.nextInt(1, 100);
                } else {
                    // Recuperar el número aleatorio existente
                    numeroAleatorio = Integer.parseInt(numeroAleatorioStr);
                    
                    // Recuperar los números intentados
                    if (numerosStr != null && !numerosStr.isEmpty()) {
                        String[] numerosArray = numerosStr.split(",");
                        for (String numStr : numerosArray) {
                            numeros.add(Integer.parseInt(numStr));
                        }
                    }
                    
                    // Recuperar los mensajes
                    if (mensajesStr != null && !mensajesStr.isEmpty()) {
                        String[] mensajesArray = mensajesStr.split("\\|");
                        for (String men : mensajesArray) {
                            mensajes.add(men);
                        }
                    }
                }

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
                                mensaje = "¡Acierto! Has adivinado el n&uacute;mero.";
                                mensajes.add(mensaje);
                            }

                            // Mostrar tabla con intentos
                            out.println("<table border='1'>");
                            out.println("<tr>");
                            out.println("<th>Intento</th>");
                            out.println("<th>Mensaje</th>");
                            out.println("</tr>");
                            for (int i = 0; i < numeros.size(); i++) {
                            out.println("<tr>");
                                out.println("<td>#" + (i+1) + ": " + numeros.get(i) + "</td>");
                                out.println("<td>" + mensajes.get(i) + "</td>");
                            out.println("</tr>");
                            }
                            
                            
                            
                            
                            out.println("</table>");
                            
                            // Mostrar mensaje especial si acertó
                            if (numeroIntroducido == numeroAleatorio) {
                                out.println("<p class='acierto'>¡Felicidades! Has adivinado el n&uacute;mero en " + numeros.size() + " intentos.</p>");
                            }
                        }
                    } catch (NumberFormatException e) {
                        error = "<p class=\"error\">Por favor, introduce un n&uacute;mero v&aacute;lido</p>";
                    }
                }

                // Mostrar error si existe
                if (!error.isEmpty()) {
                    out.println(error);
                }
                
                // Preparar datos para enviar en el formulario
                StringBuilder numerosBuilder = new StringBuilder();
                for (Integer num : numeros) {
                    if (numerosBuilder.length() > 0) {
                        numerosBuilder.append(",");
                    }
                    numerosBuilder.append(num);
                }
                
                StringBuilder mensajesBuilder = new StringBuilder();
                for (String men : mensajes) {
                    if (mensajesBuilder.length() > 0) {
                        mensajesBuilder.append("|");
                    }
                    mensajesBuilder.append(men);
                }
            %>
            
            <form action="./NumeroSecreto.jsp" method="post">
                <label for="num"> Introduce un n&uacute;mero de 1 a 100:</label>
                <input type="number" name="numero" min="1" max="100">
                <!-- Campos ocultos para mantener el estado -->
                <input type="hidden" name="numeroAleatorio" value="<%= numeroAleatorio %>">
                <input type="hidden" name="numeros" value="<%= numerosBuilder.toString() %>">
                <input type="hidden" name="mensajes" value="<%= mensajesBuilder.toString() %>">
                <input class="boton" type="submit" value="Probar">
                
            </form>    
        </div>
                <div class="volver">
                    <a href="../index.html">Volver</a>
                </div>
    </body>
</html>