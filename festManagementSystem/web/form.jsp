<%-- 
    Document   : form
    Created on : Dec 22, 2020, 6:24:43 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<%Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%
String name="",usn = "",phone = "",gender = "",clg = "",regDate = "";
int amount = 0;
//String event1 = "",event2 = "", event3 = "",event4 = "",event5 = "";
String insertLabel = "Submit";

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;
int pid = 0;

con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Manu2","Manoj");

/*--------------------CODE WHILE DELETING--------------------*/
try
{
if(request.getParameter("did")!=null)
{
usn = request.getParameter("dusn");
pst = con.prepareStatement("DELETE FROM STUDENT WHERE USN=?");
pst.setString(1,usn);
int num = pst.executeUpdate();
/*pid = Integer.parseInt(request.getParameter("did"));

pst = con.prepareStatement("DELETE FROM REGISTRATION WHERE PID=?");
pst.setInt(1, pid);
num = pst.executeUpdate();  */

if(num!=0)
 {%>
 <script>
  alert("Registration Cancelled Successfully!");
 </script>   
 <%}
else
 {%>
 <script>
  alert("Error in Cancellation");
 </script>   
 <%}
}
}
catch(Exception e)
{
%>
 <script>
 alert("Check exceptions"+e.printStackTrace);
 </script>
<%
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRATION FORM</title>
    </head>
    <body link="yellow" alink="yellow" vlink="grey" background="form5.jpg">
        <font face="Lato" size="5"><a href="index.html"><b>HOME</b></a></font>
        <form name="myForm" action="id.jsp" method="POST">
           
            <table style="background-color: lightblue"  align="center"  border="2">
                
                <thead>
                    <th style="background: darkcyan" style="padding-bottom: 20px" colspan="2">
                        <h3>FILL THE DETAILS</h3>
                    </th>
                   
                </thead>
                <tbody>
   
                    <tr>
                        <td>Name :</td>
                        <td><input type="text" name="name" value="<%=name%>" placeholder="Enter your name" size="50" /></td>
                    </tr>
                    
                    <tr>
                        <td>USN :</td>
                        <td><input type="text" name="usn" value="<%=usn%>" placeholder="Enter Correct USN" size="50" /></td>
                    </tr>
                    
                    <tr>
                        <td>Phone :</td>
                        <td><input type="text" name="phone" value="<%=phone%>" placeholder="Enter valid Phone Number" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Gender :</td>
                        <td>Male<input type="radio" name="gender" value="MALE"/>Female<input type="radio" name="gender" value="FEMALE" /></td>
                    </tr>
                    
                    <tr>
                        <td>College Name :</td>
                        <td><input type="text" name="clg" value="<%=clg%>" placeholder="Enter college Name" /></td>                   
                    </tr>
                    <tr>
                        <td>Registration Date</td>
                        <td><input type="text" name="regDate" value="<%=regDate%>" placeholder="DD/MM/YY" /></td>                   
                    </tr>
                    <tr>
                        <td>Amount Paid</td>
                        <td><input type="text" name="amount" value="<%=amount%>" placeholder="Enter amount paid" /></td>                   
                    </tr>
                    <tr>
                        <td>Event :</td>
                        <td>Solo Dance<input type="radio" name="event1" value="Solo Dance"/>
                            Classical<input type="radio" name="event2" value="Classical" />
                            Group Dance<input type="radio" name="event3" value="Group Dance"/>
                            Photography<input type="radio" name="event4" value="Photography"/>
                            Beat Boxing<input type="radio" name="event5" value="Beat Boxing"/>
                            Face Painting<input type="radio" name="event6" value="Face Painting"/>
                            Code Studio<input type="radio" name="event7" value="Code Studio"/>
                            Battle Of Bands<input type="radio" name="event8" value="Battle Of Bands"/>
                            Fashion Show<input type="radio" name="event9" value="Fashion Show"/>
                        </td>                 
                    </tr>
                   <td style="padding:20px" colspan="2">
                       <input type="reset" value="Clear" name="clear" />&nbsp;
                       <input type="submit" value="<%=insertLabel%>" name="insert" />
                       <input type="hidden" value="<%=pid%>" name="editedPid" />
                   </td>
                </tbody>
            </table>  
            
        </form>
    </body>
</html>
