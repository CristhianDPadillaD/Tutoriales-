/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import com.mycompany.gestortutoriales.Conexion;
import com.mycompany.gestortutoriales.Tutorial;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SvListar", urlPatterns = {"/SvListar"})
public class SvListar extends HttpServlet {
    

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
        // Obtener el ID del tutorial desde los parámetros de la solicitud
        int id = Integer.parseInt(request.getParameter("nombre"));
        System.out.println(id);
        
        // Obtener una instancia de Conexion
        Conexion conexion = new Conexion();
            
        // Obtener los detalles del tutorial según el identificador
        Tutorial tutorial = conexion.obtenerTutorialPorId(id);
        
        // Crear el HTML para mostrar los detalles del tutorial
        String htmlResponse = "<h2>Detalles del Tutorial</h2>";
        htmlResponse += "<p><strong>Nombre:</strong> " + tutorial.getNombre() + "</p>";
        htmlResponse += "<p><strong>Categoría:</strong> " + tutorial.getCategoria() + "</p>";
        htmlResponse += "<p><strong>URL:</strong> " + tutorial.getUrl() + "</p>";
        htmlResponse += "<p><strong>Estado:</strong> " + tutorial.getEstado() + "</p>";
        // Agregar más detalles según sea necesario
        
        // Enviar la respuesta al cliente
        try (PrintWriter out = response.getWriter()) {
            out.println(htmlResponse);
        }
            processRequest(request, response);
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
