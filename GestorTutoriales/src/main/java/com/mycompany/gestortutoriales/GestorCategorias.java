/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestortutoriales;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class GestorCategorias {
    
     public void agregarCategoria(String categoria) {
        try {
            // Establecer la conexión a la base de datos
            Connection conexion = new Conexion().Conectar();
            if (conexion != null) {
                // Llamar al procedimiento almacenado para agregar la categoría
                String sql = "{CALL AgregarCategoria(?)}";
                try (CallableStatement statement = conexion.prepareCall(sql)) {
                    // Establecer el parámetro de entrada del procedimiento almacenado
                    statement.setString(1, categoria);
                    // Ejecutar el procedimiento almacenado
                    statement.executeUpdate();
                    System.out.println("Categoría agregada exitosamente");
                }
                conexion.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al agregar la categoría: " + e.getMessage());
        }
    }
     

    public void eliminarCategoria(int idCategoria) {
        try {
            // Establecer la conexión a la base de datos
            Connection conexion = new Conexion().Conectar();
            if (conexion != null) {
                // Llamar al procedimiento almacenado para eliminar la categoría
                String sql = "{CALL EliminarCategoria(?)}";
                try (CallableStatement statement = conexion.prepareCall(sql)) {
                    // Establecer el parámetro de entrada del procedimiento almacenado
                    statement.setInt(1, idCategoria);
                    // Ejecutar el procedimiento almacenado
                    statement.executeUpdate();
                    System.out.println("Categoría eliminada exitosamente");
                }
                conexion.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al eliminar la categoría: " +e.getMessage());
                    }
        }
     
    
public String buscarCategoria (int id) throws SQLException {
     String nombreCategoria = null;

        // Establecer la conexión a la base de datos
        Conexion conexion = new Conexion();
        Connection connection = conexion.Conectar();

        // Consulta SQL para obtener el nombre de la categoría por su ID
        String sql = "SELECT Categoria FROM Categorias WHERE IdCategoria = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            // Establecer el ID de la categoría como parámetro de la consulta
            statement.setInt(1, id);

            // Ejecutar la consulta
            try (ResultSet resultSet = statement.executeQuery()) {
                // Si se encuentra una fila, obtener el nombre de la categoría
                if (resultSet.next()) {
                    nombreCategoria = resultSet.getString("Categoria");
                } else {
                    System.out.println("No se encontró una categoría con el ID proporcionado: " + id);
                }
            }
        }

        

        return nombreCategoria;
    }

   public String ConsultaCategorias() {
    StringBuilder categoriasStr = new StringBuilder();
    try {
        // Establecer la conexión a la base de datos
        Connection conexion = new Conexion().Conectar();
        if (conexion != null) {
            // Consulta SQL para obtener las categorías con sus IDs
            String sql = "SELECT IdCategoria, Categoria FROM Categorias";
            try (PreparedStatement statement = conexion.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
                
                // Procesar los resultados y construir la cadena de categorías con sus IDs
                while (resultSet.next()) {
                    int idCategoria = resultSet.getInt("IdCategoria");
                    String categoria = resultSet.getString("Categoria");
                    categoriasStr.append(idCategoria).append(": ").append(categoria).append(", ");
                }
                // Eliminar la última coma y espacio agregados
                if (categoriasStr.length() > 0) {
                    categoriasStr.setLength(categoriasStr.length() - 2);
                }
            }
            conexion.close();
        }
    } catch (SQLException e) {
        System.out.println("Error al consultar las categorías: " + e.getMessage());
    }
    return categoriasStr.toString();
}
   public List<Categoria> listarCategorias() {
    List<Categoria> categorias = new ArrayList<>();
    try (Connection conexion = new Conexion().Conectar()) {
        String sql = "SELECT * FROM Categorias";
        try (PreparedStatement statement = conexion.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(resultSet.getInt("IdCategoria"));
                categoria.setCategoria(resultSet.getString("Categoria"));
                categorias.add(categoria);
            }
        }
    } catch (SQLException ex) {
        System.out.println("Error al listar las categorías: " + ex.getMessage());
    }
    return categorias;
}


}
