<%@ page import ="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Cab Booking System - Notifications</title>
	<style>
		/* Global Styles */
		body {
                    background-image: url("https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg");
			background-size:cover;
                        font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			margin: 0;
			padding: 0;
		}

		header {
			background-color: #333;
			color: #fff;
			padding: 10px;
		}

		h1, h2, h3 {
			margin: 0;
		}

		nav ul {
			list-style: none;
			margin: 0;
			padding: 0;
		}

		nav li {
			display: inline-block;
			margin-right: 20px;
		}

		nav li a {
			color: #fff;
			text-decoration: none;
		}

		nav li.active a {
			border-bottom: 2px solid #fff;
		}

		main {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
		}

		.notification {
			background-color: wheat;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    padding: 10px;
    border-radius: 20px;
		}

		.notification ul {
			list-style: none;
			margin: 0;
			padding: 0;
		}

		.notification li {
			margin-bottom: 5px;
		}

		footer {
			background-color: #333;
			color: #fff;
			padding: 10px;
			text-align: center;
		}
		input[type="text"]{
			width: 100px;
		}
		
		marquee{
			direction: up;
		}
		.nt{
			border: 1px grey;
		}
                ul li{
                    margin-left: 100px;
    color: yellow;
    font-size: larger;
                }
	</style>
</head>
<body>
	<header>
		<h1>Cab Booking System</h1>
		
	</header>

	<main>
		
			
           
	
	</main>

	    <%
   Connection conn=null;
   Statement st=null;
   ResultSet rs=null;
   try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
   st=con.createStatement();
   String qry="select notify from notification";
   rs=st.executeQuery(qry);
   
   while(rs.next()){
   //int a=rs.getInt(1);
   //session.setAttribute("msg",id);
  %>
  <ul>
     
      <li> <%=rs.getString(1)%> </li>
      
      
  </ul>

   <%
    }
}
catch(Exception e)
{
out.println(e);
}


%>


</body>
</html>
