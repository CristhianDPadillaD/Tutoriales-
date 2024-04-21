/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestortutoriales;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;

/**
 *
 * @author ADMIN
 */
public class GestorTutoriales {
    
     public void AgregarTutorial(String Nombre, String Url, String Estado, int Prioridad, int IdCategoria, Connection agregarCon) {

        if (agregarCon != null) {
            try {

                CallableStatement stmt = agregarCon.prepareCall("{call AgregarTutorial(?, ?, ?, ?, ?)}");
                stmt.setString(1, Nombre);
                stmt.setString(2, Url);
                stmt.setString(3, Estado);
                stmt.setInt(4, Prioridad);
                stmt.setInt(5, IdCategoria);
                stmt.execute();
                agregarCon.close();
                System.out.println("Se agrego con exito ");
            } catch (SQLException e) { // Manejar cualquier error de SQL
                System.out.println("Error al agregar pruebe de nuevo" + e.getMessage());
            }
        } else {

            System.out.println("No se pudo establecer una conexión a la base de datos.");
        }
    }
     
     public void borrarTutorial(int id) {
    try (Connection conexion = new Conexion().Conectar()) {
        String sql = "DELETE FROM Tutoriales WHERE IdTutorial = ?";
        try (PreparedStatement statement = conexion.prepareStatement(sql)) {
            statement.setInt(1, id);
            int filasAfectadas = statement.executeUpdate();
            if (filasAfectadas > 0) {
                System.out.println("Tutorial con ID " + id + " eliminado exitosamente.");
            } else {
                System.out.println("No se encontró un tutorial con ID " + id + " para eliminar.");
            }
        }
    } catch (SQLException ex) {
        System.out.println("Error al intentar borrar el tutorial con ID " + id + ": " + ex.getMessage());
    }
}

       // Método para modificar un tutorial
public void modificarTutorial(int idTutorial, String nuevoNombre, String nuevaUrl, String nuevoEstado, int nuevaPrioridad, int nuevoIdCategoria) throws SQLException {
    String query = "UPDATE Tutoriales SET Nombre = ?, Url = ?, Estado = ?, Prioridad = ?, IdCategoria = ? WHERE IdTutorial = ?";
    try (Connection connection = new Conexion().Conectar();
            PreparedStatement statement = connection.prepareStatement(query)) {
        // Establecer los parámetros en la consulta preparada
        statement.setString(1, nuevoNombre);
        statement.setString(2, nuevaUrl);
        statement.setString(3, nuevoEstado);
        statement.setInt(4, nuevaPrioridad);
        statement.setInt(5, nuevoIdCategoria);
        statement.setInt(6, idTutorial);

        // Ejecutar la consulta
        int filasModificadas = statement.executeUpdate();
        if (filasModificadas != 1) {
            throw new SQLException("No se pudo modificar el tutorial con ID: " + idTutorial);
        }
    } catch (SQLException e) {
        // Manejar la excepción
        e.printStackTrace();
        throw e; // Relanzar la excepción para que sea manejada por quien llame al método
    }
}

     
      public List<Tutorial> listarTutoriales() {
        List<Tutorial> tutoriales = new ArrayList<>();
        try (Connection conexion = new Conexion().Conectar()) {
            String sql = "SELECT * FROM Tutoriales";
            try (PreparedStatement statement = conexion.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Tutorial tutorial = new Tutorial();
                     tutorial.setIdTutorial(resultSet.getInt("IdTutorial"));
                    tutorial.setNombre(resultSet.getString("Nombre"));
                    tutorial.setUrl(resultSet.getString("Url"));
                    tutorial.setEstado(resultSet.getString("Estado"));
                    tutorial.setPrioridad(resultSet.getInt("Prioridad"));
                    tutorial.setCategoria(resultSet.getInt("IdCategoria"));
                    tutoriales.add(tutorial);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar los tutoriales: " + ex.getMessage());
        }
        return tutoriales;
    }
      
      public Tutorial obtenerTutorialPorId(int Id, ServletContext context) {
    Conexion conexion = new Conexion();
    Tutorial tutorial = null;
    
    // Realizamos una consulta SQL para obtener el tutorial con el ID proporcionado
    String sql = "SELECT * FROM Tutoriales WHERE IdTutorial = ?";
    try (Connection connection = conexion.Conectar();
         PreparedStatement statement = connection.prepareStatement(sql)) {
        
        statement.setInt(1, Id);
        try (ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) { // Si hay resultados, creamos un objeto Tutorial
                tutorial = new Tutorial();
                tutorial.setIdTutorial(resultSet.getInt("IdTutorial"));
                tutorial.setNombre(resultSet.getString("Nombre"));
                tutorial.setUrl(resultSet.getString("Url"));
                tutorial.setEstado(resultSet.getString("Estado"));
                tutorial.setPrioridad(resultSet.getInt("Prioridad"));
                tutorial.setCategoria(resultSet.getInt("IdCategoria"));
            } else {
                System.out.println("No se encontró un tutorial con el ID proporcionado: " + Id);
            }
        }
    } catch (SQLException ex) {
        System.out.println("Error al obtener el tutorial con el ID proporcionado: " + ex.getMessage());
    }
    
    return tutorial;
}
}
