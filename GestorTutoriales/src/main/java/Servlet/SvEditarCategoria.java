/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import com.mycompany.gestortutoriales.GestorCategorias;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SvEditarCategoria", urlPatterns = {"/SvEditarCategoria"})
public class SvEditarCategoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          int idTutorial = Integer.parseInt(request.getParameter("idCategoria"));
    String nuevoNombre = request.getParameter("nombreEdit").trim();
    GestorCategorias ges = new GestorCategorias();
    
    System.out.println("Valor del campo después de trim(): [" + nuevoNombre + "]");
   
        try {
            ges.modificarCategoria(idTutorial, nuevoNombre);
               response.sendRedirect("categoria.jsp");
               
        } catch (SQLException ex) {
            Logger.getLogger(SvEditarCategoria.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
