<%-- 
    Document   : regStudents
    Created on : Dec 23, 2020, 10:48:37 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTERED STUDENTS</title>
    </head>
    <body link="yellow" alink="yellow" vlink="lightgrey" background="rs1.jpg">
        <font face="Lato" size="5"><a href="index.html"><b>HOME</b></a></font>
         <h3 align="center"><font color="lightblue">FIND YOUR DETAILS BELOW</font></h3>
<table style="background-color: darkgrey" border="1" align="center"  border="2">
<thead width="15" style="background: grey" style="padding-bottom: 20px">
<tr>
    <th>PID</th>
    <th>USN</th>
    <th>Name</th>
    <th>Phone</th>
    <th>Gender</th>
    <th>College name</th>
    <th>Number of Events Participated</th>
    <th>Registered date</th>
    <th>Amount Paid</th>
    <th>Edit</th>
    <th>Cancel(Your Amount will be refunded)</th>
    
</tr>
<tbody>
<%
try
{
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    int pid = 0;
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Manu2","Manoj");
    
    String name="",usn = "",phone = "",gender = "",clg = "",regDate = "";
    int amount = 0;

    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Manu2","Manoj");
    
    pst = con.prepareStatement("SELECT COUNT(*),USN,NAME,PHONE,GENDER,CLG_NAME,PID,REG_DATE,AMOUNT,PID FROM STUDENT NATURAL JOIN EVENT NATURAL JOIN REGISTRATION GROUP BY USN,NAME,PHONE,GENDER,CLG_NAME,PID,REG_DATE,AMOUNT,PID ORDER BY REGISTRATION.PID DESC");
    rs = pst.executeQuery();
    
    while(rs.next())
    {
    int noOfEvent = rs.getInt(1);
    usn = rs.getString(2);
    name = rs.getString(3);
    phone = rs.getString(4);
    gender = rs.getString(5);
    clg = rs.getString(6);
    pid = rs.getInt(7);
    regDate = rs.getString(8);
    amount = rs.getInt(9);
    pid = rs.getInt(10);
    %>
    <tr>
    <td><%=pid%></td>
    <td><%=usn%></td>
    <td><%=name%></td>
    <td><%=phone%></td>
    <td><%=gender%></td>
    <td><%=clg%></td>
    <td><%=noOfEvent%></td>
    <td><%=regDate%></td>
    <td><%=amount%></td>
    <td>
        <font face="Lato"><a href="updateForm.jsp?uid=<%=pid%>">Edit details</a></font>
    </td>
    <td>
        <font face="Lato"><a href="form.jsp?did=<%=pid%>&dusn=<%=usn%>">Cancel Participation</a></font>
    </td>
    </tr>
    <%
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
</tbody>
</thead>
</table>
<%
    Connection con = null;
    CallableStatement cst = null;
    
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Manu2","Manoj");
    cst = con.prepareCall("{call totsum(?,?)}");
    cst.setInt(1, 50);
    cst.registerOutParameter(2, Types.INTEGER);
    cst.execute();
    int sum = cst.getInt(2);
    
%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div align="center">
    <font face="Lato" color="lightgreen" size="5">TOTAL AMOUNT COLLECTED <%=sum%></a></font>
</div>
    </body>
</html>
