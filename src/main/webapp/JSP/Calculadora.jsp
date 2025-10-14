<%-- 
    Document   : newjsp
    Created on : 14 oct 2025, 2:47:41
    Author     : rmigu
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calculadora</h1>
        <div class="formulario">
            <%
            Enumeration<String> parametros = request.getParameterNames();
            int resultado = 0;
            String operacion = "";
            String mensaje = "";
            
            if (!parametros.hasMoreElements()) {
                out.println("<p class=\"error\">Uno de los campos no ha sido completado.</p>");
                }
            else{
            
                while (parametros.hasMoreElements()) {
                        parametros.nextElement();
                        Integer op1 = Integer.parseInt(request.getParameter("operando1"));
                        Integer op2 = Integer.parseInt(request.getParameter("operando2"));
                        
                        
                        String operador = request.getParameter("operador");
                        
                        switch (operador) {
                                case "Sumar":
                                    operacion = "+";
                                        resultado = op1 + op2;
                                    break;
                                case "Restar":
                                    operacion = "-";
                                        resultado = op1 - op2;
                                    break;
                                case "Multiplicar":
                                    operacion = "x";
                                        resultado = op1 * op2;
                                    break;
                                case "Dividir":
                                    if (op1 != 0 && op2 != 0) {
                                        operacion = "/";
                                            resultado = op1 / op2;
                                        }
                                    else{
                                        out.println("<p class=\"error\">No se puede realizar una division por 0</p>");
                                    }
                                    break;
                                default:
                                    throw new AssertionError();
                            }
                        
                        
                        
                    }
                //Continuar modificando el mensaje que muestre el resultado.
            }
            
            %>
        </div>>
        
        
        <div class="volver">
            <a href="../HTML/Calculadora.html">Volver</a>
        </div>
    </body>
</html>
