<%@page import="java.sql.*"%>
<style>
    .a1
    {
        color: #fff;
        background-color: #009;
        text-decoration: none;
        font-family:Comic Sans Ms;
        padding-left: 15px;
        padding-right:  15px;
        padding-bottom: 10px;
        padding-top: 10px;
        text-align:center;
    }
    .a1:hover
    {
        background-color: #5D8DA5;
    }
</style>
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
    String patient_id=request.getParameter("AHh1");

    String description=request.getParameter("TA1");
    
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass); 
    //Create sql command
    String sql1="update patient_description set description=? where patient_id=?";
    PreparedStatement p1=cn.prepareStatement(sql1); 
    p1.setString(1, description);
    p1.setString(2, patient_id);
    
    int a=p1.executeUpdate();
    
    String msg="";
    if(a==1)
    {
        msg="CHANGES HAS BEEN SAVED";
    }
    else
    {
        msg="CHANGES HAS NOT BEEN SAVED";
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
<div class="container-fluid bg-dark" style="min-height:648px;">
<form method="post" action="ShowPatientDetails1.jsp">
    <input type="hidden" name="h1" value="<%= patient_id %>" />
    <input type="submit" name="B1" value="BACK" />
</form>
</div>
 