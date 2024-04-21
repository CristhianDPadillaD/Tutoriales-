/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import com.mycompany.gestortutoriales.GestorCategorias;
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
@WebServlet(name = "SvEliminarCategoria", urlPatterns = {"/SvEliminarCategoria"})
public class SvEliminarCategoria extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

  try (PrintWriter out = response.getWriter()) {
            // Obtener el parámetro del ID de la categoría desde la solicitud HTTP
            String idCategoriaParam = request.getParameter("inputEliminar");
            // Verificar si el parámetro no está vacío
            if (idCategoriaParam != null && !idCategoriaParam.isEmpty()) {
                // Convertir el parámetro a un entero
                int idCategoria = Integer.parseInt(idCategoriaParam);

                // Crear una instancia del gestor de categorías
                GestorCategorias gestorCategorias = new GestorCategorias();
                
                // Llamar al método para eliminar la categoría
                gestorCategorias.eliminarCategoria(idCategoria);

                // Redirigir a alguna página de éxito o mostrar un mensaje
                response.sendRedirect("index.jsp");
            } else {
                // Si el parámetro está vacío, mostrar un mensaje de error o manejarlo según tu lógica
                out.println("El parámetro idCategoria está vacío.");
            }
        } catch (NumberFormatException e) {
            // Manejar la excepción si ocurre un error al convertir el parámetro a un entero
            System.out.println("Error al convertir el parámetro idCategoria a entero: " + e.getMessage());
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
