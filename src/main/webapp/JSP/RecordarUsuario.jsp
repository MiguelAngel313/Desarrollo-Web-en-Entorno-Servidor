<%-- 
    Document   : RecordarUsuario
    Created on : 23 oct 2025, 16:20:30
    Author     : Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recordar Usuario</title>
        <link rel="stylesheet" href="../CSS/style.css"/>
    </head>
    <body>
        
       
        
       <h1>Introduce un usuario y contrase&Ntilde;a</h1>
        <div class="formulario">
             <%
            try {
                
                String usuario = request.getParameter("user1");
                
                if (request.getParameter("recordar").equals("on")) {
                        try {
                                Cookie cookie = new Cookie("usuario", usuario);
                                cookie.setMaxAge(60);
                                response.addCookie(cookie);
                            } catch (NullPointerException e) {
                            }
                    }
                    
                } catch (Exception e) {
                    %><p class="error"> Debes rellenar todos los campos.</p><%
                }
        %>
            <form action="./RecordarUsuario.jsp">
                
                <%
                    try {
                            
                        
                            Cookie[] cookies = request.getCookies();
                            String valor = "";
                            String marcado = "";
                            String habilitado = "";
                            
                            for (Cookie c: cookies){
                                if (c.getName().equals("usuario")) {
                                        valor = c.getValue();
                                        marcado = "checked";
                                        habilitado = "disabled";
                                    }
                            }
                            
                        
                %>
                <label for="user1">Usuario</label> <br>
                <input name="user1" type="text" value="<%=valor%>"> <br>
    
                <label for="passwd">Contrase&ntilde;a</label> <br>
                <input name="passwd" type="password"> <br>
                
                <input type="checkbox" name="recordar" class="check" checked="<%=marcado%>" <%=habilitado%>> <p style="margin-left: -540px">Recordar usuario</p> <br>
                 <%
                } catch (Exception e) {
                        }
                %>
                <input type="submit" value="Enviar" class="boton"> <br>
            </form>
        </div>
        <div class="volver">
            <a href="../index.html">Inicio</a>
        </div>
    </body>
</html>
