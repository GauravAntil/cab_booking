<%@ page import ="java.sql.*"%>

<html>
<head>
	<title>View users</title>
        <style>
           
    table {
      border-collapse: collapse;
      width: 100%;
    }
    
    th, td {
      text-align: left;
      padding: 8px;
    }
    
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    
    td {
      transition: background-color 0.3s ease;
    }
    
    td:hover {
      background-color: #ddd;
    }
    table {
  border: 2px solid;
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

td {
  transition: background-color 0.3s ease;
}

td:hover {
  background-color: gray;
}
h1{
    text-align: center;
}
  </style>
        
</head>
<body>
    <h1>User Details</h1>
    
    <table id="tb">
		<thead>
			<tr>
				<th>Name</th>
				<th>Gender</th>
				<th>Date</th>
				<th>Contact</th>
				<th>City</th>
				<th>Mail</th>
				<th>Password</th>
				<th>Address</th>
			
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
   String qry=("select * from newuser");
   rs=st.executeQuery(qry);
   while(rs.next()){
   String a=rs.getString(6);
   session.setAttribute("msg",a);
  %>
   <tr>
                                <td><%=rs.getString(1)%></td>
                                 <td><%=rs.getString(2)%></td>
                                 <td><%=rs.getString(3)%></td>
                                 <td><%=rs.getString(4)%></td>
                                 <td><%=rs.getString(5)%></td>
                                  <td><%=rs.getString(6)%></td>
                                  <td><%=rs.getString(7)%></td>
                                  <td><%=rs.getString(8)%></td>
                                  <%--<td><a href="edituser.jsp?id=<%=rs.getString(1)%>">Edit</a></td>--%>
                                  <td><a href="deleteuser.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
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
