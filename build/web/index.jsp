<%@page import="java.io.*"%>
<%@page import="java.net.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<html>
<head><title>Item Registration</title></head>
<body>
    
<form name="fr1" method="post" action="save_Itm.jsp">
<center><h1>Item Registration</h1>
    <%
        int i=0,j=0,k=0;
    	char ch06 = 'P';
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"Products","root","sharma");
		Statement smt3=con.createStatement();
		ResultSet rs2=smt3.executeQuery("SELECT Item_ID from Item_Table");		
		while(rs2.next())
		{
		j++;
		k=j;
		}
		k=k+1;
        String cid = ch06+ String.valueOf(k);
        out.println("<input type=\"text\" name=\"iid\" placeholder=\"Item ID\" value=\""+cid+"\"><br>");
        }
	catch(Exception ex)
	{
            out.println("Unable to Prepare TextBox Value.");
            out.println("</br>"+ex);
	}
    %>

<input type="text" name="inm" placeholder="Item Name"><br>
<input type="text" name="ity" placeholder="Item Type"><br>
<input type="text" name="im" placeholder="Menufecturer"><br>
<input type="text" name="ipc" placeholder="Item Price"><br>
<input type="submit" name="sbmt" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;
<input type='reset' name='cls' value="Clear"><br>
</center>
</form>
</body>
</html>