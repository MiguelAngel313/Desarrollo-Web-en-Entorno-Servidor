<%-- 
    Document   : CalcularCambio2
    Created on : 21 oct 2025, 20:33:40
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/style.css"/>
        <title>Calculadora de Cambio 2</title>
    </head>
    <body>
        <h1>Gestor de cambio 2</h1>
        <div class="formulario">
            <%
                try {
                        
                    
                double precio = Double.parseDouble(request.getParameter("Precio"));
                double entregado = Double.parseDouble(request.getParameter("Entregado"));
                
                double cambio = entregado - precio;
                
                if (cambio == 0) {
            %>
            <p>No hay que devolver cambio</p>
            <%
                } else if (cambio < 0) {
            %>
            <p>La cantidad entregada no es suficiente</p>
            <%
                } else {
                    StringBuilder resultado = new StringBuilder();
                    
                    resultado.append("Cambio a devolver: ").append(String.format("%.2f", cambio)).append("€\n");
                    resultado.append("Desglose del cambio:\n");
                    
                    // Convertir a céntimos para evitar problemas de precisión con decimales
                    int resto = (int) Math.round(cambio * 100);
                    
                    int denominacion = 50000; // 500€ en céntimos
                    
                    while (resto > 0 && denominacion >= 1) {
                        if (resto >= denominacion) {
                            int cantidad = resto / denominacion;
                            resto = resto % denominacion;
                            
                            if (cantidad > 0) {
                                if (denominacion >= 500) { // A partir de 5€
                                    if (denominacion >= 10000) { // Billetes (100€ o más)
                                        resultado.append("Billetes de ").append(denominacion / 100)
                                                .append("€: ").append(cantidad).append("\n");
                                    } else { // Monedas de 5€ y 2€
                                        resultado.append("Monedas de ").append(denominacion / 100)
                                                .append("€: ").append(cantidad).append("\n");
                                    }
                                } else { // Céntimos
                                    resultado.append("Monedas de ").append(denominacion)
                                            .append(" céntimos: ").append(cantidad).append("\n");
                                }
                            }
                        }
                        
                        // Actualizar a la siguiente denominación (sistema euro completo)
                        if (denominacion == 50000) denominacion = 20000;
                        else if (denominacion == 20000) denominacion = 10000;
                        else if (denominacion == 10000) denominacion = 5000;
                        else if (denominacion == 5000) denominacion = 2000;
                        else if (denominacion == 2000) denominacion = 1000;
                        else if (denominacion == 1000) denominacion = 500;
                        else if (denominacion == 500) denominacion = 200;
                        else if (denominacion == 200) denominacion = 100;
                        else if (denominacion == 100) denominacion = 50;
                        else if (denominacion == 50) denominacion = 20;
                        else if (denominacion == 20) denominacion = 10;
                        else if (denominacion == 10) denominacion = 5;
                        else if (denominacion == 5) denominacion = 2;
                        else if (denominacion == 2) denominacion = 1;
                        else break;
                    }
            %>
            <p><%= resultado.toString().replace("\n", "<br>") %></p>
            <%
                }
                } catch (Exception e) {
                %><p class="error">Debes rellenar todos los campos.</p><%
                    }
            %>
        </div>
        <div class="volver">
            <a href="../HTML/CalcularCambio2.html">Repetir</a>
        </div>
        <div class="volver">
            <a href="../index.html">Inicio</a>
        </div>
    </body>
</html>