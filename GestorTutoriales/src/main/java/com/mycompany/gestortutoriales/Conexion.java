/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestortutoriales;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Esta clase proporciona métodos para establecer una conexión a una base de datos MySQL.
 */
public class Conexion {
    // Configuración de las credenciales y la URL de la base de datos
    String bd = "gestor";
    String URL = "jdbc:mysql://localhost:3306/Gestor";
    String USUARIO = "root";
    String CONTRASEÑA = "admin";
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection cx; // Objeto Connection para la conexión a la base de datos

    /**
     * Constructor de la clase.
     */
    public Conexion() {

    }

    /**
     * Este método establece una conexión a la base de datos.
     *
     * @return La conexión establecida.
     */
    public Connection Conectar() {
        try {
            // Cargar el controlador JDBC
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            System.out.println("No se encontró el controlador JDBC: " + ex.getMessage());
        }
        try {
            // Establecer la conexión y almacenarla en la variable cx
            cx = DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
        } catch (SQLException e) {
            System.out.println("Error al conectar la base de datos: " + e.getMessage());
        }
        // Imprimir mensaje de conexión exitosa
        System.out.println("¡Conexión exitosa!");
        return cx;
    }

}