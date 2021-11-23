/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author DAW-A
 */
public class ProductosCRUD {
    public static List<Productos> getProductos(){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("tpv");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT * FROM productos";
        Query q = manager.createNativeQuery(sql,Productos.class);
        List<Productos> productosDB = q.getResultList();
        
        return productosDB;
    }
    
    public static int destroyProducto(int id){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("tpv");
        EntityManager manager = factory.createEntityManager();
        String sql = "DELETE FROM productos WHERE id = " + id;
        Query q = manager.createNativeQuery(sql);
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate();
        manager.getTransaction().commit();
        return filasAfectadas;
    }
    
    public static Productos getProducto(int id) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("tpv");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT p FROM Productos p WHERE p.id=" + id; //consulta en JPQL 
        Query q = manager.createQuery(sql,Productos.class); //método para consultas en JPQL
        Productos productosBD =  ( Productos )q.getSingleResult();
        return productosBD;
    }
    
     public static int actualizaProducto(Productos miProducto) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("tpv");
        EntityManager manager = factory.createEntityManager();
        String sql = "UPDATE Productos p SET p.nombre = :nombre, p.categoria = :categoria, p.precio = :precio WHERE p.id = :id";
        Query q = manager.createQuery(sql,Productos.class);
        q.setParameter("id", miProducto.getId());
        q.setParameter("categoria", miProducto.getCategoria());
        q.setParameter("nombre", miProducto.getNombre());
        q.setParameter("precio", miProducto.getPrecio());
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate();
        manager.getTransaction().commit();
        //manager.close();
        return filasAfectadas;      
    }
}
