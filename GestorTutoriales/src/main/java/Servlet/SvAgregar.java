/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import com.mycompany.gestortutoriales.Conexion;
import com.mycompany.gestortutoriales.GestorTutoriales;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SvAgregar", urlPatterns = {"/SvAgregar"})
public class SvAgregar extends HttpServlet {

    Conexion con = new Conexion();
    GestorTutoriales agregar = new GestorTutoriales();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        String Nombre = request.getParameter("Nombre");
            String Url = request.getParameter("URL");
        String Estado = request.getParameter("Estado");
        int Prioridad = Integer.parseInt(request.getParameter("Prio"));

        int IdCategoria = Integer.parseInt(request.getParameter("Categoria"));
        Connection agregarCon = con.Conectar();

        agregar.AgregarTutorial(Nombre, Url, Estado, Prioridad, IdCategoria, agregarCon);

        response.sendRedirect("index.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
