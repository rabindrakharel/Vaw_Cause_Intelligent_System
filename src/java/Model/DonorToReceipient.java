/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author paradise lost
 */
public class DonorToReceipient {
     Connector connector;
    Statement st;
    ArrayList<ArrayList<String>> Nodes;
    
    public  DonorToReceipient() throws SQLException
    {  
    connector=new Connector();
    st=(Statement)connector.returnStatement();
    Nodes=new ArrayList<ArrayList<String>>();
    }
    
    public ArrayList<ArrayList<String>> getNodes() throws SQLException
    {
     String query="SELECT DISTINCT donor_dim.donor_lat AS x1, donor_dim.donor_long AS y1, receiver_dim.receiver_lat AS x2, receiver_dim.receiver_long AS y2\n" +
"FROM donor_dim, receiver_dim, cross_pairs\n" +
"WHERE donor_dim.donor_name = cross_pairs.donor\n" +
"AND receiver_dim.receiver_name = cross_pairs.receiver\n" +
"LIMIT 2";   
     ResultSet rs=st.executeQuery(query);
    while(rs.next()){
    ArrayList<String> pair=new ArrayList<String>();
    pair.add(0,rs.getString("x1"));
    pair.add(1,rs.getString("y1"));
    pair.add(2,rs.getString("x2"));
    pair.add(3,rs.getString("y2"));
    System.out.println(rs.getString("x1"));
    Nodes.add(pair);
    }    
    return Nodes;    
    } 
    
      public ArrayList<ArrayList<String>> getNodesByDonor(String Donor) throws SQLException
    {
     String query="SELECT DISTINCT donor_dim.donor_lat AS x1, donor_dim.donor_long AS y1, receiver_dim.receiver_lat AS x2, receiver_dim.receiver_long AS y2\n" +
"FROM donor_dim, receiver_dim, cross_pairs\n" +
"WHERE donor_dim.donor_name = cross_pairs.donor\n" +
"AND donor_dim.donor_name =  '"+Donor+"'\n" +
"AND receiver_dim.receiver_name = cross_pairs.receiver";   
     ResultSet rs=st.executeQuery(query);
    while(rs.next()){
    ArrayList<String> pair=new ArrayList<String>();
    pair.add(0,rs.getString("x1"));
    pair.add(1,rs.getString("y1"));
    pair.add(2,rs.getString("x2"));
    pair.add(3,rs.getString("y2"));
    System.out.println(rs.getString("x1"));
    Nodes.add(pair);
    }    
    return Nodes;    
    }
    
       public ArrayList<ArrayList<String>> getNodesByReceiver(String Receiver) throws SQLException
    {
     String query="SELECT DISTINCT donor_dim.donor_lat AS x1, donor_dim.donor_long AS y1, receiver_dim.receiver_lat AS x2, receiver_dim.receiver_long AS y2\n" +
"FROM donor_dim, receiver_dim, cross_pairs\n" +
"WHERE donor_dim.donor_name = cross_pairs.donor\n" +
"AND receiver_dim.receiver_name =  '"+Receiver+"'\n" +
"AND receiver_dim.receiver_name = cross_pairs.receiver";   
     ResultSet rs=st.executeQuery(query);
    while(rs.next()){
    ArrayList<String> pair=new ArrayList<String>();
    pair.add(0,rs.getString("x1"));
    pair.add(1,rs.getString("y1"));
    pair.add(2,rs.getString("x2"));
    pair.add(3,rs.getString("y2"));
    System.out.println(rs.getString("x1"));
    Nodes.add(pair);
    }    
    return Nodes;    
    }
      
     public ArrayList<ArrayList<String>> getDonorCoordinates() throws SQLException
    {
     String query="SELECT DISTINCT donor_dim.donor_lat AS x1, donor_dim.donor_long AS y1, receiver_dim.receiver_lat AS x2, receiver_dim.receiver_long AS y2\n" +
"FROM donor_dim, receiver_dim, cross_pairs\n" +
"WHERE donor_dim.donor_name = cross_pairs.donor\n" +
"AND receiver_dim.receiver_name = cross_pairs.receiver\n" +
"LIMIT 100";   
     ResultSet rs=st.executeQuery(query);
    while(rs.next()){
    ArrayList<String> pair=new ArrayList<String>();
    pair.add(0,rs.getString("x1"));
    pair.add(1,rs.getString("y1"));
    pair.add(2,rs.getString("x2"));
    pair.add(3,rs.getString("y2"));
    System.out.println(rs.getString("x1"));
    Nodes.add(pair);
    }    
    return Nodes;    
    } 
     
      public ArrayList<ArrayList<String>> getReceiverCoordinates() throws SQLException
    {
     String query="SELECT DISTINCT donor_dim.donor_lat AS x1, donor_dim.donor_long AS y1, receiver_dim.receiver_lat AS x2, receiver_dim.receiver_long AS y2\n" +
"FROM donor_dim, receiver_dim, cross_pairs\n" +
"WHERE donor_dim.donor_name = cross_pairs.donor\n" +
"AND receiver_dim.receiver_name = cross_pairs.receiver\n" +
"LIMIT 10";   
     ResultSet rs=st.executeQuery(query);
    while(rs.next()){
    ArrayList<String> pair=new ArrayList<String>();
    pair.add(0,rs.getString("x1"));
    pair.add(1,rs.getString("y1"));
    pair.add(2,rs.getString("x2"));
    pair.add(3,rs.getString("y2"));
    System.out.println(rs.getString("x1"));
    Nodes.add(pair);
    }    
    return Nodes;    
    } 
    
    
    
    public static void main(String[] args ) throws SQLException
    {
        DonorToReceipient d1=new DonorToReceipient();
        d1.getNodes();
    
    }
}
