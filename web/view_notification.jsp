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
            }
            form{
                background-color: burlywood;
    width: 400px;
    border-radius: 20px;
    margin-left: 225px;
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
     border-radius: -104px;
    text-align: left;
            }
            input[type="submit"]{
                width: 108px;
    background-color: limegreen;
    height: 40px;
    margin-left: 75px;
    margin-top: 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    font-size: 15px;
            }
	</style>
</head>
<body>
	
                
                <%
   String id=request.getParameter("id");
   Connection conn=null;
   Statement st=null;
   ResultSet rs=null;
   try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
   st=con.createStatement();
   String qry=("select * from notification where id='"+id+"'");
   rs=st.executeQuery(qry);
   while(rs.next()){
   String a=rs.getString(1);
   session.setAttribute("msg",a);
  %>
  <div class="form"><!-- comment -->
      <h2>Update Details</h2>
      
      <form action="update_notification.jsp" method="post">
          <table>
              
              <tr><th><label for="name">id</label></th></tr>
              <tr>  <th><input type="text" name="id" value="<%=rs.getInt(1)%>"  id="notify"  readonly autocomplete="off" aria-describedby="emailHelp"
                             placeholder=" id"><br></th>
              </tr>
          
              <tr><th><label for="gender">notification</label></th></tr>
              <tr><th> <input type="text" name="notify" value="<%=rs.getString(2)%>"  id="notify" autocomplete="off" aria-describedby="emailHelp"
                              placeholder=" Notification"><br></th></tr>
         
             
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
