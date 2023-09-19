<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    String Name=request.getParameter("name");
    String email=request.getParameter("email");
    String contact=request.getParameter("contact");
    String type=request.getParameter("type");
    String no=request.getParameter("vehicle");
Connection con=null;
Statement st=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
st=con.createStatement();
String qry="insert into addcabs(Name,email,contact,type,no) values('"+Name+"','"+email+"','"+contact+"','"+type+"','"+no+"')";

st.executeUpdate(qry);


}
catch(Exception e)
{
out.println(e);
}
out.println("<script type=\"text/javascript\">");
    out.println("alert('cab added successfully')");
    out.println("location='add_cabs.html';");
    out.println("</script>");
    

%>