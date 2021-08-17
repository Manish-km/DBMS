package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.lang.*;
import java.sql.*;

public final class form1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
Class.forName("oracle.jdbc.driver.OracleDriver");
      out.write('\n');

String name="",usn = "",phone = "",gender = "",clg = "",regDate = "";
int amount = 0;
//String event1 = "",event2 = "", event3 = "",event4 = "",event5 = "";
String insertLabel = "Submit";

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;
int pid = 0;

con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Manu2","Manoj");
 /*--------------------CODE WHILE UPDATING--------------------*/
 try
 {
 if(request.getParameter("uid")!=null)
 {
     pid = Integer.parseInt(request.getParameter("uid"));
     pst = con.prepareStatement("SELECT USN,NAME,PHONE,CLG_NAME,REG_DATE,AMOUNT,GENDER FROM STUDENT NATURAL JOIN EVENT NATURAL JOIN REGISTRATION WHERE PID=? GROUP BY USN,NAME,PHONE,CLG_NAME,REG_DATE,AMOUNT,GENDER");
     pst.setInt(1,pid);
     rs = pst.executeQuery();
     while(rs.next())
     {
         name = rs.getString(2);
         usn = rs.getString(1);
         phone = rs.getString(3);
         clg = rs.getString(4);
         regDate = rs.getString(5);
         amount = rs.getInt(6);
         gender = rs.getString(7);
         
         insertLabel = "Update";
     }
 }
 }

 catch(Exception e)
 {
     
      out.write("\n");
      out.write("     <script>alert(\"Check exceptions\"+e.printStackTrace);</script>\n");
      out.write("     ");

 }

/*--------------------CODE WHILE DELETING--------------------*/
try
{
if(request.getParameter("did")!=null)
{
pid = Integer.parseInt(request.getParameter("did"));

pst = con.prepareStatement("DELETE FROM REGISTRATION WHERE PID=?");//DELETE CHILD ROW FIRST
pst.setInt(1, pid);
int num = pst.executeUpdate();

usn = request.getParameter("dusn"));
pst = con.prepareStatement("DELETE FROM STUDENT WHERE USN=?");//DELETE PARENT ROW NEXT
pst.setString(1,usn);
num = pst.executeUpdate();
if(num!=0)
 {
      out.write("\n");
      out.write(" <script>\n");
      out.write("  alert(\"Registration Cancelled Successfully!\");\n");
      out.write(" </script>   \n");
      out.write(" ");
}
else
 {
      out.write("\n");
      out.write(" <script>\n");
      out.write("  alert(\"Error in Cancellation\");\n");
      out.write(" </script>   \n");
      out.write(" ");
}
}
}
catch(Exception e)
{

      out.write("\n");
      out.write(" <script>\n");
      out.write(" alert(\"Check exceptions\"+e.printStackTrace);\n");
      out.write(" </script>\n");

}

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>REGISTRATION FORM</title>\n");
      out.write("    </head>\n");
      out.write("    <body link=\"yellow\" alink=\"yellow\" vlink=\"red\" background=\"nature1.jpg\">\n");
      out.write("        <font face=\"Lato\" size=\"5\"><a href=\"regStudents.jsp\">REGISTERED STUDENTS</a></font>\n");
      out.write("        <form name=\"myForm\" action=\"id.jsp\" method=\"POST\">\n");
      out.write("           \n");
      out.write("            <table style=\"background-color: lightblue\"  align=\"center\"  border=\"2\">\n");
      out.write("                \n");
      out.write("                <thead>\n");
      out.write("                    <th style=\"background: darkcyan\" style=\"padding-bottom: 20px\" colspan=\"2\">\n");
      out.write("                        <h3>EDIT THE DETAILS WHEREVER NECESSARY</h3>\n");
      out.write("                    </th>\n");
      out.write("                   \n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("   \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Name :</td>\n");
      out.write("                        <td><input type=\"text\" name=\"name\" value=\"");
      out.print(name);
      out.write("\" placeholder=\"Enter your name\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>USN :</td>\n");
      out.write("                        <td><input type=\"text\" name=\"usn\" value=\"");
      out.print(usn);
      out.write("\" placeholder=\"Enter USN\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>Phone :</td>\n");
      out.write("                        <td><input type=\"text\" name=\"phone\" value=\"");
      out.print(phone);
      out.write("\" placeholder=\"Enter valid Phone Number\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Gender :</td>\n");
      out.write("                        <td>Male<input type=\"radio\" name=\"gender\" value=\"MALE\"/>Female<input type=\"radio\" name=\"gender\" value=\"FEMALE\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td>College Name :</td>\n");
      out.write("                        <td><input type=\"text\" name=\"clg\" value=\"");
      out.print(clg);
      out.write("\" placeholder=\"Enter college Name\" /></td>                   \n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Registration Date</td>\n");
      out.write("                        <td><input type=\"text\" name=\"regDate\" value=\"");
      out.print(regDate);
      out.write("\" placeholder=\"DD/MM/YY\" /></td>                   \n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Amount Paid</td>\n");
      out.write("                        <td><input type=\"text\" name=\"amount\" value=\"");
      out.print(amount);
      out.write("\" placeholder=\"Enter amount paid\" /></td>                   \n");
      out.write("                    </tr>\n");
      out.write("                   <td style=\"padding:20px\" colspan=\"2\">\n");
      out.write("                       <input type=\"submit\" value=\"");
      out.print(insertLabel);
      out.write("\" name=\"insert\" />\n");
      out.write("                       <input type=\"hidden\" value=\"");
      out.print(pid);
      out.write("\" name=\"editedPid\" />\n");
      out.write("                   </td>\n");
      out.write("                </tbody>\n");
      out.write("            </table>  \n");
      out.write("            \n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
