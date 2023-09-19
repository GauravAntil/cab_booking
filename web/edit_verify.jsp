<%-- 
    Document   : update_employee_data
    Created on : 19-Mar-2023, 8:52:58 am
    Author     : Jitender
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.awt.HeadlessException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
      String OTP=session.getAttribute("msg").toString();
      
      String otp=request.getParameter("otp");
      
      String name=session.getAttribute("name").toString();
      String gender=session.getAttribute("gender").toString();
      String date=session.getAttribute("date").toString();
      String contact=session.getAttribute("contact").toString();
      String city=session.getAttribute("city").toString();
      String mail=session.getAttribute("email").toString();
      String password=session.getAttribute("password").toString();
      String address=session.getAttribute("address").toString();
//      out.println(name);
//      out.println(id);
//      out.println(address);
//      out.println(phone);
//      out.println(email);
if(OTP.equals(otp))
{
try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try ( java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs", "root", "Anuj0806$")) {
                    String sql = "update newuser set name=?,gender=?,date=?,contact=?,city=?,mail=?,password=?,address=? where mail='"+mail+"'";
                    PreparedStatement ptst = conn.prepareStatement(sql);
                    ptst.setString(1,name); 
                     ptst.setString(2,gender); 
                      ptst.setString(3,date);
                       ptst.setString(4,contact);
                        ptst.setString(5,city); 
                        ptst.setString(6,mail);
                         ptst.setString(7,password); 
                          ptst.setString(8,address); 
                                                    
                    ptst.executeUpdate();
                    out.println("<script type=\"text/javascript\">"); 
                out.println("alert('Your data is suceesfully updated');"); 
                out.println("location='user.html';"); 
                out.println("</script>"); 
                } catch (HeadlessException e) {
                    out.print(e);
                }
            } catch (HeadlessException | ClassNotFoundException | SQLException e) {
                //JOptionPane.showMessageDialog(this, "Updated Email is already register in our system");
                //JOptionPane.showMessageDialog(this, e);
                out.print(e);
            }      



        }
        else{
        out.println("<script type=\"text/javascript\">"); 
                out.println("alert('you have entered wront otp');"); 
                out.println("location='edit_verify.html';"); 
                out.println("</script>"); 
        }
        
     
 
        %>
    </body>
</html>
