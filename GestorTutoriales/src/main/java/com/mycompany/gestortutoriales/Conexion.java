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

/**
 *
 * @author ADMIN
 */
public class Conexion {
    // Configura tus propias credenciales aquí

    String bd = "gestor";
    String URL = "jdbc:mysql://localhost:3306/Gestor";
    String USUARIO = "root";
    String CONTRASEÑA = "admin";
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection cx;      // Configura tus propias credenciales aquí

    public Conexion() {

    }

    public Connection Conectar() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            System.out.println("No se encontro a BD" + bd);
        }
        try {
            // Establece la conexión y almacénala en la variable conexion
            cx = DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
        } catch (SQLException e) {
            System.out.println("Error al conectar la base de datos " + e.getMessage());
        }
        System.out.println("conexion exitosa sos un crack: " + cx);
        return cx;
    }

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
                System.out.println("Conexion exitosa");
            } catch (SQLException e) { // Manejar cualquier error de SQL
                System.out.println("Error al agregar pruebe de nuevo" + e.getMessage());
            }
        } else {

            System.out.println("No se pudo establecer una conexión a la base de datos.");
        }
    }

    public String ConsultaCategorias (){
       
    StringBuilder categoriasStr = new StringBuilder();
    try {
        // Establecer la conexión a la base de datos
        Connection conexion = Conectar();
        if (conexion != null) {
            // Consulta SQL para obtener las categorías
            String sql = "SELECT Categoria FROM Categorias";
            try (PreparedStatement statement = conexion.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
                
                // Procesar los resultados y construir la cadena de categorías
                while (resultSet.next()) {
                    String categoria = resultSet.getString("Categoria");
                    categoriasStr.append(categoria).append(", ");
                }
                // Eliminar la última coma y espacio agregados
                if (categoriasStr.length() > 0) {
                    categoriasStr.setLength(categoriasStr.length() - 2);
                }
                // Cerrar la conexión y liberar recursos

            }
            conexion.close();
        }
    } catch (SQLException e) {
        System.out.println("Error al consultar las categorías: " + e.getMessage());
    }
    return categoriasStr.toString();
}

        
    }
