/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import com.mycompany.gestortutoriales.GestorTutoriales;
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
@WebServlet(name = "SvEditarTutorial", urlPatterns = {"/SvEditarTutorial"})
public class SvEditarTutorial extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  // Obtener los parámetros enviados desde la página HTML
    int idTutorial = Integer.parseInt(request.getParameter("idTutorial"));
    String nuevoNombre = request.getParameter("nombreEdit");
    String nuevaUrl = request.getParameter("urlEdit");
    String nuevoEstado = request.getParameter("estadoEdit");
    int nuevaPrioridad = Integer.parseInt(request.getParameter("prioridadEdit"));
    int nuevoIdCategoria = Integer.parseInt(request.getParameter("categoriaEdit"));
    
        System.out.println(idTutorial);
                System.out.println(nuevoNombre);
                        System.out.println(nuevoEstado);
                                System.out.println(nuevaUrl);
                                        System.out.println(nuevaPrioridad);
                                        System.out.println(nuevoIdCategoria);
    // Crear una instancia de GestorTutoriales para modificar el tutorial
    GestorTutoriales gestor = new GestorTutoriales();
    try {
        // Llamar al método modificarTutorial para guardar los cambios
        gestor.modificarTutorial(idTutorial, nuevoNombre, nuevaUrl, nuevoEstado, nuevaPrioridad, nuevoIdCategoria);
    } catch (SQLException ex) {
        // Manejar cualquier excepción que pueda ocurrir durante la modificación del tutorial
        Logger.getLogger(SvEditarTutorial.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    // Redirigir la solicitud de vuelta a la página principal
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
