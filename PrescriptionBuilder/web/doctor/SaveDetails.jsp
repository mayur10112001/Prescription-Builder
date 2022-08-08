<%@page import="java.sql.*"%>
<%
String e1="",ut="";
session=request.getSession(false); //use only existing session
if(session==null)
{
    response.sendRedirect("../AuthError.jsp");
}
else
{
    try
    {
        e1=session.getAttribute("email").toString();

        ut=session.getAttribute("usertype").toString();
        if(ut.equalsIgnoreCase("doctor")==false)
        {
            response.sendRedirect("../AuthError.jsp");
        }
    }
    catch(NullPointerException e)
    {
        response.sendRedirect("../AuthError.jsp");
    }
}
%>
<%
    //Receive form data
    String prescription,patient_id=request.getParameter("h1");
    prescription=request.getParameter("T1");
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);

    //Create sql command
    String sql1="update patient_data set prescription=? where patient_id=?";

    //Create dynamic statement 
    PreparedStatement p1=cn.prepareStatement(sql1);

    //Replace question marks with data
    p1.setString(1,prescription);
    p1.setString(2,patient_id);

    //send data to tables
    int a=p1.executeUpdate();

    String msg="";
    if(a==1)
    {
        msg="DATA IS SAVED";
    }
    else
    {
        msg="ERROR: DATA NOT SAVED";
    }
%>
<head>
<link href="../styles/bootstrap.css"
rel="stylesheet" type="text/css"/>

<script src="../styles/bootstrap.js"></script>

<script>
$(document).ready(function(e) {
    $("#b1").click(function(e) {
        $("#menu1").slideToggle();
    });
});
</script>
</head>
<nav class="navbar navbar-expand-xl navbar-dark bg-danger">
<marquee><a href="#" class="navbar-brand"><%= msg %></a></marquee>
</nav>
<div class="container-fluid bg-dark" style="min-height:698px;">
<br>
<form method="post" action="ShowPatientDetails1.jsp">
    <input type="hidden" name="h1" value="<%= patient_id %>" />
    <input type="submit" name="B1" value="BACK" />
</form>
</div>

