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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body  >
        
     
        <form action="SvAgregar" method="get">
           
            <ul>
                <input type="text" name="Nombre"  placeholder="Nombre" >
                 <input type="url" name="URL" placeholder="URL">
                <input type="text" name="Estado" placeholder="Estado">
                   <input type="num" name="Prio" placeholder="Prioridad">
   
                     <li>
                <select name="Categoria" placeholder="Categoria" onload="llamarDoPost()">
                    <%-- Agrega una opción para mostrar la categoría seleccionada --%>
                    <option value="${categorias}"</option>
                </select>
            </li>
            <li><input type="submit" name="name" value="Conectar"></li> 
        </ul>
            </ul>
                        
        </form>
    </body>
    <script>
function llamarDoPost() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "SvAgregar", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
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
