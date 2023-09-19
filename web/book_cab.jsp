<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%!
    String OTP;
    
public int generate(String email, String name, String arrival, String destination)
            {
         
            Random rand=new Random();
         OTP=String.valueOf(rand.nextInt(999999));
                String message = "Hi " + name +" You Have Successfully booked your cab from " +arrival+ " to " +destination+ " \nUse this OTP while travelling="+OTP;
		String subject = "Cab Boking System";
		String to = email;
		String from = "gauravantil15@gmail.com";

	sendEmail(message,subject,to,from);
        return (Integer.parseInt(OTP));
	}
	private static void sendEmail(String message, String subject, String to, String from) {
		String host="smtp.gmail.com";
		Properties proper = new Properties();
		proper.setProperty("mail.smtp.host", host);
		proper.setProperty("mail.smtp.port","465");
		proper.setProperty("mail.smtp.ssl.enable","true");
		proper.setProperty("mail.smtp.auth","true");
		Session session=Session.getInstance(proper, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {				
				return new PasswordAuthentication("gauravantil15@gmail.com","dhrpyotefzwkneyf");
			}			
		});
		session.setDebug(true);
		MimeMessage m = new MimeMessage(session);
		try {
		m.setFrom(from);
		m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		m.setSubject(subject);
		m.setText(message);
		Transport.send(m);
		}catch (Exception e) {
			e.printStackTrace();
		}
 
}
%>


<%
    
        
        
 String email=request.getParameter("email");      
 //out.println(mail);
String name=request.getParameter("name");
//out.println(name);
String contact=request.getParameter("contact");
//out.println(contact);
String type=request.getParameter("type");
//out.println(type);
String arrival=request.getParameter("arrival");
//out.println(arrival);
String destination=request.getParameter("destination");
//out.println(destination);
String date=request.getParameter("date");
//out.println(date);
String time=request.getParameter("time");
//out.println(time);
int a=generate(email,name,arrival,destination);

Connection con=null;
Statement st=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cabs","root","Anuj0806$");
st=con.createStatement();
String qry="insert into booking (email,name,contact,type,arrival,destination,date,time) values('"+email+"','"+name+"','"+contact+"','"+type+"','"+arrival+"','"+destination+"','"+date+"','"+time+"')";

st.executeUpdate(qry);


}
catch(Exception e)
{
out.println(e);
}
out.println("<script type=\"text/javascript\">");
    out.println("alert('cab booked successfully')");
    out.println("location='user.html';");
    out.println("</script>");
    


%>