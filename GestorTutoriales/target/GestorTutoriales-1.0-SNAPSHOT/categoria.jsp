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
        <nav class="navbar navbar-expand-lg navbar-light barra-navegacion">
            <a class="navbar-brand" href="index.jsp">Tus tutoriales</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="tutoriales.jsp">Tutoriales <span class="sr-only"></span></a>
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
                <h2>Estas son las categorias disponibles para tus tutoriales.</h2>
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
                 <td> <a href="#" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editarModal" data-nombre="<%= categoria.getIdCategoria()%>"><i class="fa-solid fa-pencil"></i></a>
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
                        <h2>Agrega una nueva categoria. </h2>
                    </div>


                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <form action="SvAgregarCategoria" method="get" class="php-email-form">
                                <div class="row text-">
                                    <div class="text-center">
                                        <input style="background-color: white;" type="text" name="categoria" class="form-control" id="categoria" placeholder="Categoria" required>
                                    </div>
                                </div>
                    
                                    
                                <div class="text-center">
                                    <input style="background-color: #a1181a;" type="submit" name="name" value="Enviar">
                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </section><!-- End Contact Us Section -->

        </main><!-- End #main -->


        <!-- ======= Footer ======= -->
        <footer id="footer">
                <div class="credits">

                    Designed by <a> Padilla, Calpa</a>
                </div>
        </footer><!-- End #footer -->





        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


  

        <!-- Modal de confirmacion de la accion eliminar  -->           
        <div class="modal fade" id="eliminarTareaModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="eliminarLabel" style="color: #000;">Eliminar Categoria</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h4>¿Estás seguro de que deseas eliminar esta categoria?</h4>
                        <p id="contactoNombre"></p>
                        <form id="eliminarForm" action="SvEliminarCategoria" method="GET">
                            <input type="hidden" id="SvEliminar" name="inputEliminar">
                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" onclick="eliminarCategoria()">Eliminar</button>

                    </div>
                </div>
            </div>
        </div>

      <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="editarModalLabel" style="color: #000;">Editar Categoria </h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Campos de edición para el tutorial -->
                        <form id="editarForm" action="SvEditarCategoria" method="Get">
                            <input type="hidden" id="SvEditarCategoria" name="idCategoria">
                            <input type="text" class="form-control" id="nombreEdit" name="nombreEdit" placeholder="Nombre" required>
                            <!-- Otros campos de edición -->
                    </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="editarCategoria()">Guardar Cambios</button>

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
                $('#SvEliminar').val(nombreContacto);
                console.log(nombreContacto);
            });


        </script>   

        <script>
            function eliminarCategoria() {
                $('#eliminarForm').submit(); // Enviar el formulario al servlet
            }
        </script>
        
  <script>
    // Evento para cargar los detalles del tutorial seleccionado al abrir la modal de edición
    $('#editarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que desencadenó el evento
        var idCategoria = button.data('nombre'); // Obtener el ID del tutorial
        $('#SvEditarCategoria').val(idCategoria);
    });

    // Función para validar y enviar el formulario al servlet
    function editarCategoria() {
        var nombreEdit = $('#nombreEdit').val().trim();
        if (nombreEdit === "") {
            alert("Por favor, ingrese un nombre para la categoría.");
            return false; // Evitar que se envíe el formulario si el nombre está vacío
        }
        // Si el nombre no está vacío, enviar el formulario al servlet
        $('#editarForm').submit();
    }
</script>




    </body>

</html>
