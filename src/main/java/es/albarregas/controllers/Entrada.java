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

/**
 *
 * @author arey1
 */
@WebServlet(name = "Entrada", urlPatterns = {"/Entrada"})
public class Entrada extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Entrada</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Entrada at " + request.getContextPath() + "</h1>");
            out.println("<h2>M&eacute;todo de llamada es " + request.getMethod() + "</h2>");
            Enumeration<String> parametros=request.getParameterNames();
            out.println("<ul>");
            
            while (parametros.hasMoreElements()) {                
                String nombre =parametros.nextElement();
                out.println("<li>"+nombre+" con valor "+request.getParameter(nombre)+"</li>");
            }
            out.print("</ul>");
            out.println("<a href=\".\">Volver</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Entrada</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Entrada at " + request.getContextPath() + "</h1>");
            out.println("<h2>M&eacute;todo de llamada es " + request.getMethod() + "</h2>");
            String para1 = request.getParameter("param1");
            String para2 = request.getParameter("param2");
            out.println("Parametro1: " + para1);
            out.println("Parametro2: " + para2);
            out.println("<a href=\".\">Volver</a>");
            out.println("</body>");
            out.println("</html>");
        }
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

}
