<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page import="java.time.*" %>
<html>
    <head>
        <title>Insert Item Record</title>
    </head>
    <body>
        <h1>Item's Data Insertion</h1></br>
        <%
            int oa=0;

            
        String itm_id=request.getParameter("iid");
        String itm_nm=request.getParameter("idm");
        String itm_ty=request.getParameter("ity");
        String itm_mf=request.getParameter("im");
        int itm_pc=Integer.parseInt(request.getParameter("ipc"));
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"Products","root","sharma");
            PreparedStatement ps=conn.prepareStatement("insert into Item_Table values(?,?,?,?,?)");
            ps.setString(1,itm_id);
            ps.setString(2,itm_nm);
            ps.setString(3,itm_ty);
            ps.setString(4,itm_mf);
            ps.setInt(5,itm_pc);
            
            oa=ps.executeUpdate();
            if(oa==1)
            {
             out.println("Data has been saved into DB.");   
            }
        }catch(Exception ex){
            out.println("Unable insert Data.");
            out.println("</br>"+ex);
        }
        %>
        <!--<a href="srchRecord.jsp">Next</a>-->
    </body>
</html>
