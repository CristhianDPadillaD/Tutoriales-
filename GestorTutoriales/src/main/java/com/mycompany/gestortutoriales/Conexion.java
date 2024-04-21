/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestortutoriales;


import java.sql.Connection;
import java.sql.DriverManager; 
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

}