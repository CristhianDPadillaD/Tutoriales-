<%-- 
    Document   : index
    Created on : 15/04/2024, 5:35:05 p. m.
    Author     : ADMIN
--%>

<%@page import="com.mycompany.gestortutoriales.Categoria"%>
<%@page import="com.mycompany.gestortutoriales.GestorCategorias"%>
<%@page import="com.mycompany.gestortutoriales.GestorTutoriales"%>
<%@page import="com.mycompany.gestortutoriales.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.gestortutoriales.Conexion" %>    
<%@ page import="com.mycompany.gestortutoriales.Conexion" %>
<%@ page import="com.mycompany.gestortutoriales.Tutorial" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>
    <%

              // Obtener la lista de categorías desde el gestor
                List<Categoria> categorias = new GestorCategorias().listarCategorias();

    %>

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Gestor de Tutoriales Online</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="estilos/img/favicon.png" rel="icon">
        <link href="estilos/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

        <!-- Vendor CSS Files -->
        <link href="estilos/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="estilos/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="estilos/style.css" rel="stylesheet">

        <script src="Script/Script.js" type="text/javascript"></script>
    </head>
    <body  >
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="categoria.jsp">Categorias </a>
                    </li>
                </ul>
            </div>
        </nav>


        <!-- ======= Header ======= -->
        <header id="header" class="d-flex align-items-center">


            <div class="container d-flex flex-column align-items-center">

                <h1>Categorias</h1>
                <h2>pagina de Categorias</h2>
                <table class="table">
                    <thead>
                    <th scope="col">Id</th>
                    <th scope="col">Categorias</th>
                         <th scope="col">Acciones</th>
                    </thead>
                <tbody>
        
 
                  

            <% 
  
                for (Categoria categoria : categorias) {
            %>
            <tr>
                <td><%= categoria.getIdCategoria() %></td>
                <td><%= categoria.getCategoria() %></td>
                 <td> <a href="#" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editarModal" data-nombre="<>"><i class="fa-solid fa-pencil"></i></a>
                                   <a href="#" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminarTareaModal" data-nombre="<%= categoria.getIdCategoria()%>"><i class="fa-solid fa-trash"></i></a></td>
            </tr>
           
            <% } %>
        </tbody>
</tbody>

                </table>
            </div>
        </header><!-- End #header -->

        <main id="main">

            <!-- ======= Contact Us Section ======= -->
            <section id="contact" class="contact">
                <div class="container">

                    <div class="section-title">
                        <h2>Agrega un </h2>
                    </div>

                    <div class="row justify-content-center">

                        <div class="col-lg-10">

                            <div class="info-wrap">
                                <div class="row">
                                    <div class="col-lg-4 info">
                                        <i class="bi bi-geo-alt"></i>
                                        <h4>Location:</h4>
                                        <p>A108 Adam Street<br>New York, NY 535022</p>
                                    </div>

                                    <div class="col-lg-4 info mt-4 mt-lg-0">
                                        <i class="bi bi-envelope"></i>
                                        <h4>Email:</h4>
                                        <p>info@example.com<br>contact@example.com</p>
                                    </div>

                                    <div class="col-lg-4 info mt-4 mt-lg-0">
                                        <i class="bi bi-phone"></i>
                                        <h4>Call:</h4>
                                        <p>+1 5589 55488 51<br>+1 5589 22475 14</p>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <form action="SvAgregarCategoria" method="get">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input type="text" name="categoria" class="form-control" id="categoria" placeholder="Categoria" required>
                                    </div>
                                </div>
                    
                                    
                                <div class="text-center"><input type="submit" name="name" value="Enviar"></div>
                            </form>
                        </div>

                    </div>

                </div>
            </section><!-- End Contact Us Section -->

        </main><!-- End #main -->


        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container">
                <div class="credits">

                    Designed by <a> Padilla, Calpa</a>
                </div>
            </div>
        </footer><!-- End #footer -->





        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <h5 class="modal-title" id="exampleModalLabel">Detalles del Libro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                    </div>
                    <div class="modal-body"> 

                        <div id="libro-details"> 
                            <!-- AquÃ­ se aÃ±ade los detalles del perro-->
                        </div>
                    </div> 
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button> 
                    </div>
                </div> 
            </div> 
        </div>

        <!-- Modal de confirmacion de la accion eliminar  -->           
        <div class="modal fade" id="eliminarTareaModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="eliminarLabel">Eliminar Tutorial</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h4>¿Estás seguro de que deseas eliminar esta categoria?</h4>
                        <p id="contactoNombre"></p>
                        <form id="eliminarForm" action="SvEliminarCategoria" method="GET">
                            <input type="hidden" id="SvEliminarCategoria" name="inputEliminar">
                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" onclick="eliminarContacto()">Eliminar</button>

                    </div>
                </div>
            </div>
        </div>



        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="estilos/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  

        <script>
            $('#eliminarTareaModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Botón que desencadenó el evento
                var nombreContacto = button.data('nombre'); // Obtén el nombre del contacto desde data-nombre

                // Establecer el valor del campo oculto con el nombre del contacto
                $('#SvEliminarTutorial').val(nombreContacto);
            });


        </script>   

        <script>
            function eliminarContacto() {
                $('#eliminarForm').submit(); // Enviar el formulario al servlet
            }
        </script>

     




    </body>

</html>
