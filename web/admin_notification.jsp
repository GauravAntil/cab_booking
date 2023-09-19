<%@ page import ="java.sql.*"%>

<html>
<head>
	<title>View Notification</title>
	<style>
    table {
      border: 1px solid;
      border-collapse: collapse;
      width: 100%;
    }
    
    th, td {
      border: 1px solid #dddddd;
      padding: 8px;
      text-align: left;
      
    }
    
    tr:nth-child(even) {
      background-color: #52caee;
    }
    
   
  </style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Id</th>
                                <th>Notify</th>
                                <th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
                
                <%
   Connection conn=null;
   Statement st=null;
   ResultSet rs=null;
   try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
   st=con.createStatement();
   String qry=("select * from notification");
   rs=st.executeQuery(qry);
   
   while(rs.next()){
   //int a=rs.getInt(1);
   //session.setAttribute("msg",id);
  %>
   <tr>
                                <td><%=rs.getString(1)%></td>
                               
                                 <td><%=rs.getString(2)%></td>
                                 
                                 
                                  <td><a href="view_notification.jsp?id=<%=rs.getString(1)%>">Update</a></td>
                                                                    
                                  
                                  <td><a href="delete_notification.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
			</tr>  
   <%
    }
}
catch(Exception e)
{
out.println(e);
}


%>

		
	</table>
    
    
</body>
</html>
