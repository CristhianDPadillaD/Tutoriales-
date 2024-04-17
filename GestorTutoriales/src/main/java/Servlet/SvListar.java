/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import com.mycompany.gestortutoriales.Conexion;
import com.mycompany.gestortutoriales.Tutorial;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
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
             Conexion conexion = new Conexion();

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             ServletContext context = getServletContext();
        
  String idString = request.getParameter("nombre");
    
    if (idString != null && !idString.isEmpty()) {
    
            int id = Integer.parseInt(idString);
            System.out.println("ID del tutorial: " + id);

            // Obtener los detalles del tutorial según el identificador
   
            Tutorial tutorial = conexion.obtenerTutorialPorId(id, context);
            
            
          // Mover aquí la configuración del tipo de contenido y la codificación de caracteres

    String tutorialHtml = "<h2>Titulo:" + tutorial.getNombre() + "</h2>" +
            "<p>Categoria: " + tutorial.getNombreCategoria() + "</p>" +
            "<p>Estado: " + tutorial.getEstado() + "</p>" +
            "<p>URL: " + tutorial.getUrl() + "</p>" ;
      response.setContentType("text/html"); 
         
      System.out.println(" Tutorial: " + tutorialHtml);

    response.getWriter().write(tutorialHtml);
            // Enviar la respuesta al cliente
           
       processRequest(request, response);
    
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
