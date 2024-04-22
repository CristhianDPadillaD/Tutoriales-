<%-- 
    Document   : inicio
    Created on : 21 abr 2024, 23:40:52
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <body>
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
                <h1>¿De qué se trata?</h1>
                <h2>En esta página puedes compartir tus tutoriales con personas que necesiten de tu ayuda.</h2>
                <img class="imagen1" width="500px" src="https://static.vecteezy.com/system/resources/previews/003/805/406/non_2x/online-tutorial-concept-learning-courses-tutorials-illustration-flat-vector.jpg">
            </div>
        </header><!-- End #header -->

        <!-- ======= Header ======= -->
        <header id="header" class="d-flex align-items-center">


            <div class="container d-flex flex-column align-items-center">
                <h1>¿Cómo puedes agregar un tutorial?</h1>
                <h2 style="text-align: center;">En la barra de navegación dirígete a la sección de tutoriales, 
                    ahí encontrarás un formulario en el que registrarás la información 
                    de tu tutorial (nombre, prioridad, estado, categoría y URL).</h2>
                <img class="imagen1" width="700px" src="estilos/imagenes/tutorial.png">
            </div>
        </header><!-- End #header -->

        <!-- ======= Header ======= -->
        <header id="header" class="d-flex align-items-center">


            <div class="container d-flex flex-column align-items-center">
                <h1>¿Cómo puedes agregar una categoría?</h1>
                <h2 style="text-align: center;">En la barra de navegación dirígete a la sección de categorías.<br>
                    Dirígete hacia abajo, y podrás ver un apartado llamado "Agregar una nueva categoría".
                    Escribe la nueva categoría que desees y presiona el botón de enviar para agregarla.</h2>
                <img class="imagen1" width="700px" src="estilos/imagenes/categoria.png">
            </div>
        </header><!-- End #header -->

    </body>
</html>
