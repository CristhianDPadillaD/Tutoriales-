<%-- 
    Document   : index
    Created on : 15/04/2024, 5:35:05 p. m.
    Author     : ADMIN
--%>

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
        Conexion conexion = new Conexion();

        // Llamar al método ConsultaCategorias para obtener las categorías
        String categorias = conexion.ConsultaCategorias();
        List<Tutorial> tutoriales = conexion.listarTutoriales();
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

        <!-- Vendor CSS Files -->
        <link href="estilos/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="estilos/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="estilos/style.css" rel="stylesheet">
        
          <script src="Script/Script.js" type="text/javascript"></script>
    </head>
    <body  >


        <!-- ======= Header ======= -->
        <header id="header" class="d-flex align-items-center">
            <div class="container d-flex flex-column align-items-center">

                <h1>Tutoriales</h1>
                <h2>pagina de tutoriales</h2>
                <table class="table">
                    <thead>
                    <th scope="col">Categoria</th>
                    <th scope="col">Titulo</th>
                    <th scope="col">Ver</th>
                    </thead>
                    <tbody>


                        <tr>

                        <tr>
                            <%
                                // Iteramos sobre la lista de tutoriales y mostramos los detalles de cada tutorial en una tabla HTML
                                for (Tutorial tutorial : tutoriales) {
                            %>
                        <tr>

                            <td><%= tutorial.getNombre()%></td>


                            <td><%= tutorial.getCategoria()%></td>
                           <td><a href="#" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre= "<% tutorial.getIdTutorial();%>"><i class="fa-solid fa-eye"></i></a>
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
                            <form action="SvAgregar" method="get">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input type="text" name="Nombre" class="form-control" id="Nombre " placeholder="Nombre" required>
                                    </div>
                                    <div class="col-md-6 form-group mt-3 mt-md-0">
                                        <input type="num" class="form-control" name="Prio" id="Prio" placeholder="Prioridad" required>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="text" class="form-control" name="Estado" id="Estado" placeholder="Estado" required>
                                </div >
                                <div class="form-group mt-3">
                                    <li>
                                        <select name="Categoria" placeholder="Categoria">
                                            <% String[] categoriasArray = categorias.split(", "); %>
                                            <% for (int i = 0; i < categoriasArray.length; i++) {%>
                                            <option value="<%=i + 1%>"><%=categoriasArray[i]%></option>
                                            <% }%>
                                        </select>

                                    </li>
                                </div >
                                <div class="form-group mt-3">
                                    <input  type ="textarea" class="form-control" name="URL" rows="5" placeholder="Url" required>

                                </div>
                                <div class="text-center"><input type="submit" name="name" value="Conectar"></div>
                            </form>
                        </div>

                    </div>

                </div>
            </section><!-- End Contact Us Section -->

        </main><!-- End #main -->

                              <!-- Modal de confirmacion de la accion eliminar  -->           
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
         <div class="modal-dialog"> 
             <div class="modal-content"> 
                 <div class="modal-header"> 
                    <h5 class="modal-title" id="exampleModalLabel">Detalles del Contacto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> 
                 </div>
                 <div class="modal-body"> 
                  
                     <div id="contacto-details"> 
                         <!-- AquÃ­ se aÃ±ade los detalles del contacto-->
                </div>
                 </div> 
                 <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button> 
                </div>
             </div> 
         </div> 
     </div>

        
        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container">
                <div class="credits">

                    Designed by <a> Padilla, Calpa</a>
                </div>
            </div>
        </footer><!-- End #footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
    var titulo = button.data('nombre'); // ObtÃ©n el nombre del contacto

    // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
    $.ajax({
      url: 'SvListar?nombre=' + titulo, // Cambia 'id' por el nombre del parÃ¡metro que esperas en tu servlet
      method: 'GET',
      success: function (data) {
        // Actualiza el contenido del modal con los detalles del perro
        $('#contacto-details').html(data);
      },
      error: function () {
        // Maneja errores aquÃ­ si es necesario y se imprime en consola
        console.log('Error al cargar los detalles del contacto.');
      }
    });
  });
        </script>
    </body>

</html>
