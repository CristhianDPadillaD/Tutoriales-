/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestortutoriales;

/**
 *
 * @author ADMIN
 */
public class Tutorial {
    int IdTutorial;

    public int getIdTutorial() {
        return IdTutorial;
    }

    public void setIdTutorial(int IdTutorial) {
        this.IdTutorial = IdTutorial;
    }
    String nombre;
    String url;
    String estado;
    int prioridad;
    int categoria;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    public String getNombreCategoria() {
        
    String[] categoriasArray =  {"lógica de programación","Flutter", "Node.js", "Desarrollo Web", "Big Data", "Cloud Computing", "Desarrollo Móvil"}; 
    int categoriaIndex = this.getCategoria() - 1; // Restamos 1 porque los índices en arrays comienzan en 0
    if (categoriaIndex >= 0 && categoriaIndex < categoriasArray.length) {
        
        
        return categoriasArray[categoriaIndex];
    }
    return "Categoría no encontrada";
}   
    
}
