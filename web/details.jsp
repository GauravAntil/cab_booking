<%@ page import ="java.sql.*"%>

<html>
<head>
	<title>View users</title>
	<style>
            body{
                background-color: graytext;
            }
            h2{
               text-align: center;
    margin-top: 50px;
            }
            form{
                background-color: burlywood;
    width: 400px;
    border-radius: 20px;
    margin-left: 400px;
    margin-top: 50px;
    padding-top: 25px;
            }
            label{
                text-align: center;
    margin-left: -111px;
    font-size: 15px;
            }
            input[type="text"]{
                width: 250px;
                margin-left: 75px;
                 height: 40px;
     border-radius: 10px;
    text-align: left;
            }
            input[type="submit"]{
                width: 150px;
    background-color: limegreen;
    height: 40px;
    margin-left: 120px;
    margin-top: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    font-size: 15px
            }
           .sign  a {
      
			float: left;
    color: #fff;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    border-radius: 10%;
    background-color: #4caf50;
    border: 2px;
    border-radius: 10px;
    width: 160px;
    height: 10px;
    margin-top: 17px;
    margin-left: 24px;
    padding-top: 10px;
		}
	</style>
</head>
<body>
	
                
                <%
                    String id=session.getAttribute("msg").toString(); 
                    //out.println(id);
   Connection conn=null;
   Statement st=null;
   ResultSet rs=null;
   try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
   st=con.createStatement();
   String qry=("select * from newuser where mail='"+id+"'");
   rs=st.executeQuery(qry);
   while(rs.next()){
   String a=rs.getString(6);
   session.setAttribute("msg",a);
  %>
  <div class="form"><!-- comment -->
      <h2>Update Details</h2>
      
      <form action="edit.jsp" method="post">
          <table>
              
              <tr><th><label for="name">Name</label></th></tr>
              <tr>  <th><input type="text" name="name" value="<%=rs.getString(1)%>"  id="name" autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" Name"><br></th>
              </tr>
          
              <tr><th><label for="gender">Gender</label></th></tr>
              <tr><th> <input type="text" name="gender" value="<%=rs.getString(2)%>"  id="gender" autocomplete="off" aria-describedby="emailHelp"
                              placeholder=" gender"><br></th></tr>
         
              <tr><th><label for="date">D.O.B</label></th></tr>
              <tr><th><input type="text" name="date" value="<%=rs.getString(3)%>"  id="date" autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" D.O.B"><br></th></tr>
          
              <tr><th><label for="contact">Contact</label></th></tr>
              <tr><th><input type="text" name="contact" value="<%=rs.getString(4)%>"  id="contact" autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" contact"><br></th></tr>
          
              <tr><th><label for="city">city</label></th></tr>
              <tr><th><input type="text" name="city" value="<%=rs.getString(5)%>"  id="city" autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" city"><br></th></tr>
          
              <tr><th><label for="mail">email id</label></th></tr>
              <tr><th><input type="text" name="mail" value="<%=rs.getString(6)%>" readonly id="mail" autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" email"><br></th></tr>
          
              <tr><th> <label for="password">password</label></th></tr>
              <tr><th><input type="text" name="password" value="<%=rs.getString(7)%>"  id="password" autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" password"><br></th></tr>
          
              <tr><th><label for="address">Address</label></th></tr>
              <tr><th><input type="text" name="address" value="<%=rs.getString(8)%>"  id="address" autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" address"><br></th></tr>
          
            </table>  
                             <input type="submit" name="action" value="update">
                             
      </form>
                             
      
  </div>
  
 <%   }
}
catch(Exception e)
{
out.println(e);
}


%>

		
	
    
    
</body>
</html>
