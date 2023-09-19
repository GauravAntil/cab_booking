<%@ page import ="java.sql.*"%>
<%
   String action=request.getParameter("action");
   if(action.equals("Login"))
   {
   String username=request.getParameter("username");
    session.setAttribute("msg",username);
   String pwd=request.getParameter("password");
   try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select mail,password from newuser where mail='"+username+"'and password='"+pwd+"'");
   //ResultSet rs=st.executeQuery("select name,password from login where username=? and password=?");
   if(rs.next())
    {
   response.sendRedirect("user.html");
    }
    else
    {
    out.println("<script type=\"text/javascript\">");
    out.println("alert('invalid username or password')");
    out.println("location='userlogin.html';");
    out.println("</script>");
    }
}
catch(Exception e)
{
out.println(e);
}
}
else if(action.equals("Back") )
{
response.sendRedirect("index.html");
}
%>

