<%@page import="com.mycompany.gestortutoriales.Categoria"%>
<%@page import="com.mycompany.gestortutoriales.GestorCategorias"%>
<%-- 
            Document   : index
            Created on : 15/04/2024, 5:35:05 p. m.
            Author     : ADMIN
--%>

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
        // Crear una instancia de la clase Conexion
        GestorCategorias conexion = new GestorCategorias();
        GestorTutoriales gestoTuto = new GestorTutoriales();

        // Llamar al método ConsultaCategorias para obtener las categorías
        // String categorias = conexion.ConsultaCategorias();
        List<Tutorial> tutoriales = gestoTuto.listarTutoriales();
        List<Categoria> categorias = conexion.listarCategorias();

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

                <h1>Tutoriales</h1>
                <h2>Mira los tutoriales disponibles.</h2>
                <table class="table">
                    <thead>
                    <th scope="col">Categoria</th>
                    <th scope="col">Titulo</th>
                    <th scope="col">Ver</th>
                    </thead>
                    <tbody>


                        <tr>

                        <tr>
                            <%                                        // Iteramos sobre la lista de tutoriales y mostramos los detalles de cada tutorial en una tabla HTML
                                for (Tutorial tutorial : tutoriales) {
                            %>
                        <tr>


                            <td><%= tutorial.getNombreCategoria()%></td>

                            <td><%= tutorial.getNombre()%></td>
                            <td><a href="#" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%= tutorial.getIdTutorial()%>"><i class="fa-solid fa-eye"></i></a>
                                <a href="#" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editarModal" data-nombre="<%= tutorial.getIdTutorial()%>"><i class="fa-solid fa-pencil"></i></a>
                                <a href="#" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#eliminarTareaModal" data-nombre="<%= tutorial.getIdTutorial()%>"><i class="fa-solid fa-trash"></i></a></td>
                        </tr>
                        <% } %>
                        </tr>

                        </tr>
                    </tbody>
                </table>
            </div>
        </header><!-- End #header -->

        <main id="main">

            <!-- ======= Contact Us Section ======= -->
            <section id="contact" class="contact">
                <div class="container">

                    <div class="section-title">
                        <h2>Ingresar tutorial</h2>
                    </div>

                    <div class="row justify-content-center">

                        <div class="col-lg-10">

                            <div class="info-wrap">
                                <div class="row">
                                    <div class="col-lg-4 info bg-custom">
                                        <i class="bi bi-alphabet" style="background-color: #703e3b;"></i>
                                        <h4>Ponle un nombre</h4>
                                        <p>De que trata tu tutorial?<br>Ponle un nombre apropiado</p>
                                    </div>

                                    <div class="col-lg-4 info mt-4 mt-lg-0 bg-custom">
                                        <i class="bi bi-tags" style="background-color: #703e3b;" ></i>
                                        <h4>Una categoria</h4>
                                        <p>A que categoria pertenece<br>el tutorial?</p>
                                    </div>

                                    <div class="col-lg-4 info mt-4 mt-lg-0 bg-custom">
                                        <i class="bi bi-link" style="background-color: #703e3b;"></i>
                                        <h4>Una direccion</h4>
                                        <p>Tu tutorial necesita<br>un url !Agregalo!</p>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <form action="SvAgregar" method="get" class="php-email-form">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input style="background-color: #c9c7c7; color: black;" type="text" name="Nombre" class="form-control input-custom-bg-color" id="Nombre" placeholder="Nombre" required>
                                    </div>

                                    <div class="col-md-6 form-group mt-3 mt-md-0">
                                        <select class="form-select" name="Prio" placeholder="Prio" >
                                            <option value="" hidden>Prioridad</option>
                                            <option> 1</option>
                                            <option> 2</option>
                                            <option> 3</option>
                                            <option> 4</option>
                                            <option> 5</option>
                                            <option> 6</option>
                                            <option> 7</option>
                                            <option> 8</option>
                                            <option> 9</option>
                                            <option> 10</option>
                                        </select>                                            
                                    </div >

                                </div>
                                <div class="form-group mt-3">
                                    <select class="form-select" name="Estado" placeholder="Estado" >
                                        <option value="" hidden>Estado</option>
                                        <option> No revisado</option>
                                        <option> Revisado</option>
                                    </select>                                            
                                </div >
                                <div class="form-group mt-3">
                                    <select class="form-select" name="Categoria" placeholder="Categoria">
                                        <option value="" hidden>Categoria</option>
                                        <% for (Categoria categoria : categorias) {%>
                                        <option value="<%= categoria.getIdCategoria()%>"><%= categoria.getCategoria()%></option>
                                        <% } %>
                                    </select>
                                </div>


                                <div class="form-group mt-3">
                                    <input style="background-color: #c9c7c7; color: black;" type ="textarea" class="form-control" name="URL" rows="5" placeholder="Url" required>

                                </div>
                                <div class="text-center ">
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
            <div class="">
                <div class="credits">

                    Designed by <a> Padilla, Calpa</a>
                </div>
            </div>
        </footer><!-- End #footer -->





        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>



        <!-- Modal para mostrar la información de las tutoriales  -->      
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
            <div class="modal-dialog"> 
                <div class="modal-content"> 
                    <div class="modal-header"> 
                        <h5 class="modal-title" id="exampleModalLabel"style="color: #000;">Detalles del tutorial</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                    </div>
                    <div class="modal-body"> 

                        <div id="libro-details"> 
                            <!-- AquÃ­ se aÃ±ade los detalles del Tutorial-->
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
                        <h2 class="modal-title" id="eliminarLabel"style="color: #000;">Eliminar Tutorial</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h4>¿Estás seguro de que deseas eliminar este tutorial?</h4>
                        <p id="contactoNombre"></p>
                        <form id="eliminarForm" action="SvEliminarTutorial" method="GET">
                            <input type="hidden" id="SvEliminarTutorial" name="inputEliminar">
                        </form>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" onclick="eliminarContacto()">Eliminar</button>

                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de edición -->

        <div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="editarModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header"> 
                        <h2 class="modal-title" id="editarModalLabel"style="color: #000;">Editar Tutorial</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Campos de edición para el tutorial -->
                        <form id="editarForm" action="SvEditarTutorial" method="Get">
                            <input type="hidden" id="SvEditarTutorial" name="idTutorial">
                            <input type="text" class="form-control" id="nombreEdit" name="nombreEdit" placeholder="Nombre" required>
                            <select class="form-select" name="prioridadEdit" placeholder="Prio" >
                                <option value="" hidden>Prioridad</option>
                                <option> 1</option>
                                <option> 2</option>
                                <option> 3</option>
                                <option> 4</option>
                                <option> 5</option>
                                <option> 6</option>
                                <option> 7</option>
                                <option> 8</option>
                                <option> 9</option>
                                <option> 10</option>
                            </select>  
                            <select class="form-select" name="estadoEdit" placeholder="Estado" >
                                <option value="" hidden>Estado</option>
                                <option> No revisado</option>
                                <option> Revisado</option>
                            </select>

                            <select class="form-select" id="categoriaEdit" name="categoriaEdit" placeholder="Categoria">
                                <option value="" hidden>Categoria</option>
                                <% for (Categoria categoria : categorias) {%>
                                <option value="<%= categoria.getIdCategoria()%>"><%= categoria.getCategoria()%></option>
                                <% }%>
                            </select>
                            <input type="url" class="form-control" id="urlEdit" name="urlEdit" placeholder="URL">
                            <!-- Otros campos de edición -->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" onclick="editarContacto()">Guardar Cambios</button>

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
                    // funcion para mostrar los datos en la ventana modal
                    $('#exampleModal').on('show.bs.modal', function (event) {
                        var button = $(event.relatedTarget); // BotÃ³n que desencadenÃ³ el evento
                        var nombre = button.data('nombre'); // ObtÃ©n el nombre del perro

                        // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
                        $.ajax({
                            url: 'SvListar?nombre=' + nombre, // Cambia 'id' por el nombre del parÃ¡metro que esperas en tu servlet
                            method: 'GET',
                            success: function (data) {
                                // Actualiza el contenido del modal con los detalles del perro
                                $('#libro-details').html(data);
                            },
                            error: function () {
                                // Maneja errores aquÃ­ si es necesario y se imprime en consola
                                console.log('Error al cargar los detalles del libro.');
                            }
                        });
                    });

        </script>

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

        <script>
            // Evento para cargar los detalles del tutorial seleccionado al abrir la modal de edición
            $('#editarModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Botón que desencadenó el evento
                var idTutorial = button.data('nombre'); // Obtener el ID del tutorial

                $('#SvEditarTutorial').val(idTutorial);
            });

        </script>
        <script>
            function editarContacto() {
                var nombreEdit = $('#nombreEdit').val().trim();
                if (nombreEdit === "") {
                    alert("Por favor, ingrese un nombre para el tutorial.");
                    return false; // Evitar que se envíe el formulario si el nombre está vacío
                }
                // Si el nombre no está vacío, enviar el formulario al servlet
                $('#editarForm').submit();
            }

        </script>
    </body>

</html>
