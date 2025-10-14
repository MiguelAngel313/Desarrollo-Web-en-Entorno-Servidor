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
            String mensaje = "El resultado de ";
            
            if (!parametros.hasMoreElements()) {
                out.println("<p class=\"error\">Uno de los campos no ha sido completado.</p>");
                }
            else{
            
                try {
                        
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
                                        mensaje = "<p class=\"error\">No se puede realizar una division por 0</p>";
                                    }
                                    break;
                                default:
                                    throw new AssertionError();
                            }
                        if (op1 != 0 && op2 != 0) {
                        mensaje += op1+ " "+ operacion +" "+ op2 + " = "+ resultado;
                            }
                        
                        break;
                        
                    }
                out.println("<p>"+mensaje+"</p>");
                    } catch (Exception e) {
                        out.println("<p class=\"error\">Uno o varios campos no han sido completados.</p>");
                    }
                
            }
            
            %>
            
            <form action="../JSP/Calculadora.jsp" method="post">
            <label for="operando1">Primer operando:</label><br>
            <input type="number" name="operando1" style="width: 10vh;"><br>
            <label for="operando2">Segundo operando:</label><br>
            <input type="number" name="operando2" style="width: 10vh;"><br>
        
            <label class="check" style="margin-left: 30vh;">
                <input class="operadores" type="radio" name="operador" value="Sumar">Sumar
                <input class="operadores" type="radio" name="operador" value="Restar">Restar 
                <input class="operadores" type="radio" name="operador" value="Multiplicar">Multiplicar
                <input class="operadores" type="radio" name="operador" value="Dividir">Dividir
            </label><br>

            <input class="boton" type="submit" value="Enviar" style="margin-right: 20px;">
            <input class="boton" type="reset" value="Limpiar">
        </form>
        </div>>
        
        
        <div class="volver">
            <a href="../index.html">Volver</a>
        </div>
    </body>
</html>
