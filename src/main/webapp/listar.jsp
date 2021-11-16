<%-- 
    Document   : listar
    Created on : 15-nov-2021, 17:36:33
    Author     : DAW-A
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado</title>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        
    </head>
    <%
        List<Productos> listadoProductos = (List<Productos>) request.getAttribute("listado");
    %>
    <body>
        <h1>Lisado de productos</h1>
        <table class="table">
            <% for (Productos listadoProducto : listadoProductos) { %>
            <tr>
                <td>
                    <%= listadoProducto.getNombre() %>
                </td>
                <td>
                    <%= listadoProducto.getCategoria() %>
                </td>
                <td>
                    <%= listadoProducto.getPrecio()%>
                </td>
                <td><a href="Servlet?op=borrar&id=<%= listadoProducto.getId() %>">Borrar</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
