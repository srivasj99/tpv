<%-- 
    Document   : actualizar.jsp
    Created on : 22-nov-2021, 17:41:38
    Author     : DAW-A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Producto</h1>
        <form action="Servlet?op=actualizarDatos" method="post">
            <p>ID: <input type="text" value="${producto.id}" name="id" readonly></p>
            <p>Nombre: <input type="text" value="${producto.nombre}" name="nombre"></p>
            <p>Categoria: <input type="text" value="${producto.categoria}" name="categoria"></p>
            <p>Precio: <input type="text" value="${producto.precio}" name="precio"></p>
            <input type="submit" value="Actualizar producto"> 
        </form>
    </body>
</html>
