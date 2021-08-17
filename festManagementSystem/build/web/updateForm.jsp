<%-- 
    Document   : form1
    Created on : Dec 23, 2020, 8:27:32 PM
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
     %>
     <script>alert("Check exceptions"+e.printStackTrace);</script>
     <%
 }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRATION FORM</title>
    </head>
    <body link="yellow" alink="yellow" vlink="red" background="nature1.jpg">
        <font face="Lato" size="5"><a href="regStudents.jsp">REGISTERED STUDENTS</a></font>
        <form name="myForm" action="id.jsp" method="POST">
           
            <table style="background-color: lightblue"  align="center"  border="2">
                
                <thead>
                    <th style="background: darkcyan" style="padding-bottom: 20px" colspan="2">
                        <h3>EDIT THE DETAILS WHEREVER NECESSARY</h3>
                    </th>
                   
                </thead>
                <tbody>
   
                    <tr>
                        <td>Name :</td>
                        <td><input type="text" name="name" value="<%=name%>" placeholder="Enter your name" size="50" /></td>
                    </tr>
                    
                    <tr>
                        <td>USN :</td>
                        <td><input type="text" name="usn" value="<%=usn%>" placeholder="Enter USN" size="50" /></td>
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
                   <td style="padding:20px" colspan="2">
                       <input type="submit" value="<%=insertLabel%>" name="insert" />
                       <input type="hidden" value="<%=pid%>" name="editedPid" />
                   </td>
                </tbody>
            </table>  
            
        </form>
    </body>
</html>

