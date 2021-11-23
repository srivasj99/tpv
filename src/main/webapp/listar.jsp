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
    
    <body>
        <%
        List<Productos> listadoProductos = (List<Productos>) request.getAttribute("listado");
        String mensaje = (String) request.getAttribute("mensaje");
        
        %>
        <div class="container">
        <h1>Lisado de productos por nombre</h1>
        <%if(mensaje != null){%>
        <h2 class="alert alert-success"><%=mensaje%></h2>
        <%}%>
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
                    <td><a href="Servlet?op=borrar&id=<%= listadoProducto.getId() %>" onclick="return Confirmation()">Borrar</a></td>
                    <td><a href="Servlet?op=actualizar&id=<%= listadoProducto.getId() %>">Actualizar</a></td>
                </tr>
                <%}%>
            </table>
            <a href="Servlet?op=insertar" class="btn btn-primary">Insertar</a>
        </div>
            <script>
                function Confirmation(){
                    if(confirm("Esta seguro de eliminar el registro?") == true){
                        alert("El registro ha sido eliminado correctamente!!!");
                        return true;
                    }else{
                        return false;
                    }
                }
            </script>
    </body>
</html>
