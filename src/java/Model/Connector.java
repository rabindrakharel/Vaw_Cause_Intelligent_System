/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author paradise lost
 */
public class Connector {
    
    private Connection connection;
    private ResultSet rs;
    
    public Connector(){
    try{
    Class.forName("com.mysql.jdbc.Driver");
    connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/aid_data","root","");
    }
    catch(Exception ex)
    {
    System.out.print(ex);
    } }

    public Statement returnStatement() throws SQLException
    {
        Statement st=connection.createStatement();
        return st;
        
    }
    
    public static void main(String[] args) throws SQLException
    {
    Connector c1=new Connector();
    c1.returnStatement();
    }
    
}

