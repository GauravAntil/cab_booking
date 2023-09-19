<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>


<%
    String mess=request.getParameter("otp");
        //reciving otp from signup.jsp page
        String data=session.getAttribute("msg").toString();
        //receiving detiails from signup.jsp page
        String name=session.getAttribute("name").toString();
        String gender=session.getAttribute("gender").toString();
        String date=session.getAttribute("date").toString();
        String contact=session.getAttribute("contact").toString();
        String city=session.getAttribute("city").toString();
        String mail=session.getAttribute("email").toString();
        String password=session.getAttribute("password").toString();
        String address=session.getAttribute("address").toString();
        
        
        if(mess.equals(data))
        {
           
//String name=request.getParameter("name");
//String gender=request.getParameter("gender");
//String date=request.getParameter("date");
//String contact=request.getParameter("contact");
//String city=request.getParameter("city");
//    
//String mail=request.getParameter("email");
//String password=request.getParameter("password");
//String address=request.getParameter("address");
//    
Connection con=null;
Statement st=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
st=con.createStatement();
String qry="insert into newuser(name,gender,date,contact,city,mail,password,address) values('"+name+"','"+gender+"','"+date+"','"+contact+"','"+city+"','"+mail+"','"+password+"','"+address+"')";

st.executeUpdate(qry);


}
catch(Exception e)
{
out.println(e);
}
out.println("<script type=\"text/javascript\">");
    out.println("alert('user created successfully')");
    out.println("location='userlogin.html';");
    out.println("</script>");
    
}
else
{
out.println("<script type=\"text/javascript\">");
    out.println("alert('You have entered incorred otp')");
    out.println("location='verifyotp.html';");
    out.println("</script>");
}

%>