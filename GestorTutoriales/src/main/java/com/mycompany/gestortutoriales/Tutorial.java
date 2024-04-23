/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestortutoriales;

import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
/**
 * Esta clase representa un tutorial y proporciona métodos para acceder y modificar sus atributos.
 */
public class Tutorial {
    // Atributos
    private int IdTutorial;
    private String nombre;
    private String url;
    private String estado;
    private int prioridad;
    private int categoria;

    // Métodos de acceso y modificación para el atributo IdTutorial
    public int getIdTutorial() {
        return IdTutorial;
    }

    public void setIdTutorial(int IdTutorial) {
        this.IdTutorial = IdTutorial;
    }

    // Métodos de acceso y modificación para el atributo nombre
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Métodos de acceso y modificación para el atributo url
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    // Métodos de acceso y modificación para el atributo estado
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    // Métodos de acceso y modificación para el atributo prioridad
    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    // Métodos de acceso y modificación para el atributo categoria
    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    /**
     * Obtiene el nombre de la categoría del tutorial.
     *
     * @return El nombre de la categoría del tutorial.
     */
    public String getNombreCategoria() {
        String nombreCategoria = "Categoría no encontrada"; // Valor por defecto
        
        // Crear una instancia de GestorCategorias
        GestorCategorias conexion = new GestorCategorias();
        
        try {
            // Llamar al método buscarCategoria de la instancia de GestorCategorias para obtener el nombre de la categoría
            nombreCategoria = conexion.buscarCategoria(this.getCategoria());
        } catch (SQLException e) {
            System.out.println("Error al obtener el nombre de la categoría: " + e.getMessage());
        }
        
        return nombreCategoria;
    }
}