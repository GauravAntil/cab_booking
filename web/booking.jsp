<%@ page import ="java.sql.*"%>

<html>
<head>
	<title>View users</title>
	<style>
    table {
      border: 1px solid;
      border-collapse: collapse;
      width: 100%;
      font-family: Arial, sans-serif;
    }
    
    th, td {
      text-align: left;
      padding: 8px;
    }
    
    th {
      background-color: #5fb5e3;
      color: #ea1111;
      font-weight: bold;
    }
    
    tr:nth-child(even) {
      background-color: #cad665;
    }
    
    tr:hover {
      background-color: #e76d15;
    }
  </style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Email</th>
				<th>Name</th>
				<th>Contact</th>
				<th>Type</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Date</th>
				<th>Time</th>
				
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
   String qry=("select * from booking");
   rs=st.executeQuery(qry);
   while(rs.next()){
   String a=rs.getString(1);
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
                                  <td><a href="cancel_booking.jsp?arrival=<%=rs.getString(5)%>&destination=<%=rs.getString(6)%>">Delete</a></td>
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
