<%@page import="java.awt.HeadlessException"%>
<%@ page import ="java.sql.*"%>
<%
    
String id=request.getParameter("id");
//out.println(id);

String notify=request.getParameter("notify");
//out.println(notify);



                try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try ( java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs", "root", "Anuj0806$")) {
                    String sql = "update notification set id=?,notify=? where id='"+id+"'";
                    PreparedStatement ptst = conn.prepareStatement(sql);
                    ptst.setString(1,id); 
                     ptst.setString(2,notify); 
                      
                                                    
                    ptst.executeUpdate();
                    out.println("<script type=\"text/javascript\">"); 
                out.println("alert('Notification Upadted');"); 
                out.println("location='admin_notification.jsp';"); 
                out.println("</script>"); 
                } catch (HeadlessException e) {
                    out.print(e);
                }
            } catch (HeadlessException | ClassNotFoundException | SQLException e) {
                //JOptionPane.showMessageDialog(this, "Updated Email is already register in our system");
                //JOptionPane.showMessageDialog(this, e);
                out.print(e);
            }      


        
        
//     
 
        %>