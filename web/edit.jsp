<%@page import="java.util.Random"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%!
    String OTP;
public int generate(String email)
            {
         
            Random rand=new Random();
         OTP=String.valueOf(rand.nextInt(999999));
                String message = "your otp for upadting details="+OTP;
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
<%  String email=request.getParameter("mail");//this email is used for otp verfication
   

    String name=request.getParameter("name");
    String gender=request.getParameter("gender");
     String date=request.getParameter("date");
    String contact=request.getParameter("contact");
    String city=request.getParameter("city");
    
    String mail=request.getParameter("email");
String password=request.getParameter("password");
String address=request.getParameter("address");
    

    int a=generate(email);
    //transfering details from signup.html page to verify.jsp page
        session.setAttribute("msg",a);
        session.setAttribute("name",name);
        session.setAttribute("gender",gender);
        session.setAttribute("date",date);
        session.setAttribute("contact",contact);
        session.setAttribute("city",city);
        session.setAttribute("email",email);
        session.setAttribute("password",password);
        session.setAttribute("address",address);
        
        response.sendRedirect("edit_verify.html");
    %>