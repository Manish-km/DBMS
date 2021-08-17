<%-- 
    Document   : id
    Created on : Dec 22, 2020, 7:16:08 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PARTICIPATION ID</title>
    </head>
    <br>
    <br>
<body background="college-fest.jpg" link="darkgreen" alink="yellow" vlink="lightblue">
        <font face="Lato" size="5"><a href="form.jsp">REGISTER</a></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <font face="Lato" size="5"><a href="index.html">HOME</a></font>
        <h2 align="center"><font face="Lato" color="yellow" size="5"><big><i>THANK YOU FOR REGISTERING!!! </i></big></font></h2>
        <h1 align="center" ><font face="Lato" COLOR="yellow" size="15">___YOUR PARTICIPATION ID IS___</font></h1>
        
<table align="center" width="15" cellspacing="10" cellpadding="5">
<tbody>
<%
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    int pid = 0;
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Manu2","Manoj");
    
String name = request.getParameter("name");
String usn = request.getParameter("usn");
String phone = request.getParameter("phone");
String gender = request.getParameter("gender");
String clg = request.getParameter("clg");
String regDate = request.getParameter("regDate");
int amount = Integer.parseInt(request.getParameter("amount"));
String event1 = request.getParameter("event1");
String event2 = request.getParameter("event2");
String event3 = request.getParameter("event3");
String event4 = request.getParameter("event4");
String event5 = request.getParameter("event5");
String event6 = request.getParameter("event6");
String event7 = request.getParameter("event7");
String event8 = request.getParameter("event8");
String event9 = request.getParameter("event9");

 /*--------------------INSERT CODE--------------------*/
 if(request.getParameter("insert").equals("Submit"))
 {
     try
     {
        pst = con.prepareStatement("INSERT INTO STUDENT(USN,NAME,PHONE,GENDER,CLG_NAME) VALUES(?,?,?,?,?)");
        pst.setString(1, usn);
        pst.setString(2, name);
        pst.setString(3, phone);
        pst.setString(4, gender);
        pst.setString(5, clg);
        int num = pst.executeUpdate();
        
        pst = con.prepareStatement("INSERT INTO REGISTRATION(PID,REG_DATE,USN,AMOUNT) VALUES(PIDSEQ.NEXTVAL,?,?,?)");
        pst.setString(1, regDate);
        pst.setString(2, usn);
        pst.setInt(3, amount);
        num = pst.executeUpdate();
        
        if(event1 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event1);
        num = pst.executeUpdate();
        }
        if(event2 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event2);
        num = pst.executeUpdate();
        }
        if(event3 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event3);
        num = pst.executeUpdate();
        }
        if(event4 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event4);
        num = pst.executeUpdate();
        }
        if(event5 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event5);
        num = pst.executeUpdate();
        }
        if(event6 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event6);
        num = pst.executeUpdate();
        }
        if(event7 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event7);
        num = pst.executeUpdate();
        }
        if(event8 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event8);
        num = pst.executeUpdate();
        }
        if(event9 != null)
        {
        pst = con.prepareStatement("INSERT INTO EVENT(USN,EVENT_NAME) VALUES(?,?)");
        pst.setString(1, usn);
        pst.setString(2, event9);
        num = pst.executeUpdate();
        }
        
        pst = con.prepareStatement("SELECT PID FROM REGISTRATION");
        rs = pst.executeQuery();
        while(rs.next())
        {
         pid = rs.getInt(1);
        }
        %>     
        <tr>
            <td style:"height:100px;width:100px"><font face="Lato" color="red" size="30"><%=pid%></font></td>      
        </tr>
        <%
            
        if(num!=0)
        {%>
        <script>
             alert("Successfuly Registered!");
        </script>   
        <%}

        else
        {%>
        <script>
             alert("Enter Details Correctly");
        </script>   
        <%}
     }
     catch(Exception e)
     {
        %>
         <script>
            alert("Check exceptions"+e.printStackTrace);
         </script>
        <%
     }
 }
/*--------------------UPDATE CODE--------------------*/
if(request.getParameter("insert").equals("Update"))
{
try
{
pid = Integer.parseInt(request.getParameter("editedPid"));

pst = con.prepareStatement("UPDATE STUDENT SET NAME=?,PHONE=?,GENDER=?,CLG_NAME=? WHERE USN=?");
pst.setString(1,name);
pst.setString(2,phone);
pst.setString(3,gender);
pst.setString(4,clg);
pst.setString(5,usn);
int num = pst.executeUpdate();

pst = con.prepareStatement("UPDATE REGISTRATION SET REG_DATE=?,USN=?,AMOUNT=? WHERE PID=?");
pst.setString(1,regDate);
pst.setString(2,usn);
pst.setInt(3,amount);
pst.setInt(4,pid);
num = pst.executeUpdate();

if(num!=0)
{
%>
<script>alert("Successfuly updated!");</script>
<%
}
else
{
%>
<script>alert("Error in updation");</script>
<%
}
}
catch(Exception e)
{
%>
<script>alert("Check exceptions"+e.printStackTrace);</script>
<%
}
}
%>
                
</tbody>    
</table>


<br></br>


<h3 align="center">FIND YOUR DETAILS BELOW</h3>
<table style="background-color: lightcoral" border="1" align="center"  border="2">
<thead width="15" style="background: brown" style="padding-bottom: 20px">
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
</body>
</html>
