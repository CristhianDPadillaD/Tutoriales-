/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import com.mycompany.gestortutoriales.Conexion;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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

        con.AgregarTutorial(Nombre, Url, Estado, Prioridad, IdCategoria, agregarCon);

        response.sendRedirect("index.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
//        // Preparar la consulta SQL para obtener todas las categorías
//        Connection categoria = con.Conectar();
//        PreparedStatement stmt = categoria.prepareStatement("SELECT idCategoria, categoria FROM Categorias");
//
//        // Ejecutar la consulta y obtener el resultado
//        ResultSet rs = stmt.executeQuery();
//        
//        while (rs.next() != null){
//       categorias.add(rs.getString("categoria"));
//    }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
