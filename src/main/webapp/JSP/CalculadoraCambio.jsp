<%-- 
    Document   : CalculadoraCambio
    Created on : 19 oct 2025, 16:07:17
    Author     : Miguel
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="../CSS/style.css"/>
        <title>Cambio</title>
    </head>
    <body>
        <h1>Gestor de cambio al pagar</h1>

        <div class="formulario">
            <%
                Enumeration<String> parametros = request.getParameterNames();
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
                    int centimosTotales = (int) Math.round(cambio * 100);

                    // Calcular billetes y monedas
                    int billetes100 = centimosTotales / 10000;
                    centimosTotales %= 10000;

                    int billetes50 = centimosTotales / 5000;
                    centimosTotales %= 5000;

                    int billetes20 = centimosTotales / 2000;
                    centimosTotales %= 2000;

                    int billetes10 = centimosTotales / 1000;
                    centimosTotales %= 1000;

                    int billetes5 = centimosTotales / 500;
                    centimosTotales %= 500;

                    int monedas2 = centimosTotales / 200;
                    centimosTotales %= 200;

                    int monedas1 = centimosTotales / 100;
                    centimosTotales %= 100;

                    int monedas50 = centimosTotales / 50;
                    centimosTotales %= 50;

                    int monedas20 = centimosTotales / 20;
                    centimosTotales %= 20;

                    int monedas10 = centimosTotales / 10;
                    centimosTotales %= 10;

                    int monedas5 = centimosTotales / 5;
                    centimosTotales %= 5;

                    int monedas2cent = centimosTotales / 2;
                    centimosTotales %= 2;

                    int monedas1cent = centimosTotales;

                    %>
                    <table style="color: #F5EFE7;">
                        <tr>
                            <td>
                            <%
                                if (billetes100 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/100.jpg"/><% out.println(billetes100); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (billetes50 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/50.jpg"/><% out.println(billetes50); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (billetes20 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/20.jpg"/><% out.println(billetes20); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (billetes10 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/10.jpg"/><% out.println(billetes10); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (billetes5 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/5.png"/><% out.println(billetes5); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (monedas2 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/2.png"/><% out.println(monedas2); %><%
                                    }
                            %>
                            </td>
                        </tr>
                        <tr>
                             <td>
                            <%
                                if (monedas1 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/1.png"/><% out.println(monedas1); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (monedas50 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/050.png"/><% out.println(monedas50); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (monedas20 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/020.png"/><% out.println(monedas20); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (monedas10 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/010.png"/><% out.println(monedas10); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (monedas5 > 0) {
                                    %><img class="dinero" src="../Img/Billetes/005.png"/><% out.println(monedas5); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (monedas2cent > 0) {
                                    %><img class="dinero" src="../Img/Billetes/002.png"/><% out.println(monedas2cent); %><%
                                    }
                            %>
                            </td>
                             <td>
                            <%
                                if (monedas1cent > 0) {
                                    %><img class="dinero" src="../Img/Billetes/001.png"/><% out.println(monedas1cent); %><%
                                    }
                            %>
                            </td>
                        </tr>
                    </table>
                    <p>Total a devolver: <%out.print(Math.round(cambio * 100.0) / 100.0);%></p>
            <%
                    //Continuar poniendo la tabla con imagenes de billetes
                } 
            %>
        </div>

        <div class="volver">
            <a href="../HTML/CalculadoraCambio.html">Repetir</a>
        </div>
        <div class="volver">
            <a href="../index.html">Inicio</a>
        </div>
    </body>
</html>
