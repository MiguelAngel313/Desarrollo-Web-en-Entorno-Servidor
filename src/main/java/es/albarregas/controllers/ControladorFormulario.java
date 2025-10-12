/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Request;

/**
 *
 * @author rmigu
 */
@WebServlet(name = "ControladorFormulario", urlPatterns = { "/ControladorFormulario" })
public class ControladorFormulario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorFormulario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorFormulario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        StringBuilder parametros = new StringBuilder();
        Enumeration<String> nombresParametros = request.getParameterNames();

        String nombre = request.getParameter("nombre");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String salario = request.getParameter("salario");
        String numHijos = request.getParameter("numHijos");
        String[] preferencias = request.getParameterValues("preferencias");

        // Verificar si se enviaron datos (si hay al menos un parámetro)
        boolean hayDatos = parametros != null;

        if (hayDatos) {
            // Validar que ningún campo obligatorio esté vacío
            if (nombre == null || nombre.trim().isEmpty() ||
                    fechaNacimiento == null || fechaNacimiento.trim().isEmpty() ||
                    salario == null || salario.trim().isEmpty() ||
                    numHijos == null || numHijos.trim().isEmpty()) {

                // Mostrar el formulario nuevamente con mensaje de error
                mostrarFormulario(request, response, "Error: Todos los campos deben ser completados.");
            } else {
                // Si todos los campos están completos, mostrar los datos
                mostrarDatos(request, response, nombre, fechaNacimiento, salario, numHijos, preferencias);
            }
        } else {
            // Mostrar el formulario vacío cuando no hay datos
            mostrarFormulario(request, response, "");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir al método GET para procesar los datos
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response, String mensajeError) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>");
            out.println("<title>Formulario1</title>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
            out.println("<link rel=\"stylesheet\" href=\"" + request.getContextPath() + "/CSS/style.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Introduce los datos</h1>");
            // Mostrar mensaje de error si existe
            if (!mensajeError.isEmpty()) {
                out.println("<div style=\"color: orange\" class=\"error\">" + mensajeError + "</div>");
            }
            out.println("<div class=\"formulario\">");
            out.println("<form action=\"ControladorFormulario\" method=\"get\">");
            // Nombre (text)
            out.println("<label for=\"nombre\">Nombre</label><br>");
            out.println("<input type=\"text\" name=\"nombre\" placeholder=\"Introducir aquí\"><br>");
            // Fecha nacimiento (dd/mm/yy)
            out.println("<label for=\"fechaNacimiento\">Fecha de nacimiento</label><br>");
            out.println("<input type=\"date\" name=\"fechaNacimiento\"><br>");
            // salario (dos decimales)
            out.println("<label for=\"salario\">Salario</label><br>");
            out.println("<input type=\"number\" name=\"salario\" step=\"0.01\" placeholder=\"0.00\"><br>");
            // numero de hijos (entero)
            out.println("<label for=\"numHijos\">Número de hijos</label><br>");
            out.println("<input type=\"number\" name=\"numHijos\" step=\"1\" placeholder=\"0\"><br>");
            // Preferencias (select multiple)
            out.println("<label for=\"preferencias\">Preferencias</label><br>");
            out.println("<select name=\"preferencias\" multiple>");
            out.println("<option value=\"deportes\">Deportes</option>");
            out.println("<option value=\"musica\">Música</option>");
            out.println("<option value=\"cine\">Cine</option>");
            out.println("<option value=\"tecnologia\">Tecnología</option>");
            out.println("</select><br>");
            out.println("<br>");
            out.println("<input class=\"boton\" type=\"submit\" value=\"Enviar\"/>");
            out.println("</form>");
            out.println("</div>");
            out.println("<div class=\"volver\">");
            out.println("<a href=\"./index.html\">Volver</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response, String nombre, String fechaNacimiento,
            String salario, String numHijos, String[] preferencias) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html lang=\"es\">");
            out.println("<head>");
            out.println("<title>Datos del Formulario</title>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<link rel=\"stylesheet\" href=\"" + request.getContextPath() + "/CSS/style.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Datos del Formulario Recibidos</h1>");
            out.println("<div class=\"datos\">");
            out.println("<p><strong>Nombre:</strong> " + nombre + "</p>");
            out.println("<p><strong>Fecha de Nacimiento:</strong> " + fechaNacimiento + "</p>");
            out.println("<p><strong>Salario:</strong> " + salario + "€</p>");
            out.println("<p><strong>Número de Hijos:</strong> " + numHijos + "</p>");

            if (preferencias != null && preferencias.length > 0) {
                out.println("<p><strong>Preferencias:</strong> ");
                for (int i = 0; i < preferencias.length; i++) {
                    out.println(preferencias[i]);
                    if (i < preferencias.length - 1) {
                        out.println(", ");
                    }
                }
                out.println("</p>");
            } else {
                out.println("<p><strong>Preferencias:</strong> Ninguna seleccionada</p>");
            }

            out.println("</div>");
            out.println("<div class=\"volverLargo\">");
            out.println("<a href=\"ControladorFormulario\">Volver al Formulario</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}