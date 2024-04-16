<%-- 
    Document   : index
    Created on : 15/04/2024, 5:35:05 p. m.
    Author     : ADMIN
--%>

<%@page import="com.mycompany.gestortutoriales.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>ComingSoon - Bootstrap Coming Soon Template</title>
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
    </head>
    <body  >


    <!-- ======= Header ======= -->
    <header id="header" class="d-flex align-items-center">
        <div class="container d-flex flex-column align-items-center">

            <h1>Tutoriales</h1>
            <h2>pagina de tutoriales</h2>

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
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Nombre" required>
                                </div>
                                <div class="col-md-6 form-group mt-3 mt-md-0">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Prioridad" required>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Estado" required>
                            </div >
                            <div class="form-group mt-3">
                            <li>
                                <select name="Categoria" placeholder="Categoria" onload="llamarDoPost()">
                                    <%-- Agrega una opción para mostrar la categoría seleccionada --%>
                                    <option value="${categorias}"</option>
                                </select>
                            </li>
                            </div >
                            <div class="form-group mt-3">
                                <textarea class="form-control" name="message" rows="5" placeholder="Url" required></textarea>
                            </div>
                            <div class="text-center"><input type="submit" name="name" value="Conectar"></div>
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

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="estilos/script.js"></script>

</body>
<script>
                        function llamarDoPost() {
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "SvAgregar", true);
                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === 4 && xhr.status === 200) {
                                    // La solicitud se ha completado y se han recibido los datos
                                    console.log(xhr.responseText); // Puedes mostrar la respuesta en la consola para depurar
                                }
                            };
                            // Puedes enviar datos en el cuerpo de la solicitud si es necesario
                            // xhr.send("parametro1=valor1&parametro2=valor2");
                            xhr.send(); // Envía la solicitud POST al servlet
                        }
</script>

</html>
