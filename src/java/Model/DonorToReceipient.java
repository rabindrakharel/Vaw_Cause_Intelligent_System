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
     String query="SELECT D.cntry_lat as x1 , D.cntry_long as y1 , R.cntry_lat as x2 , R.cntry_long as y2\n" +
"FROM (\n" +
"SELECT DISTINCT  c.cntry_lat, c.cntry_long\n" +
"FROM cntry_dim c, donor_cntry_vs_yr dc\n" +
"WHERE c.cntry_name = dc.cntry_name\n" +
")D, (\n" +
"\n" +
"SELECT DISTINCT c.cntry_lat, c.cntry_long\n" +
"FROM cntry_dim c, receiptant_cntry_vs_yr rc\n" +
"WHERE c.cntry_name = rc.cntry_name\n" +
") R\n" +
"WHERE 1 LIMIT 100";   
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
