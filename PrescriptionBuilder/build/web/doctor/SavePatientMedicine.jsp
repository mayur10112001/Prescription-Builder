<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
<style>
        .mylink
        {
                font-family: Comic Sans Ms;
                text-decoration: none;
        }
</style>
<%
    String patient_id =request.getParameter("Ah1");
    String medicine=request.getParameter("S1");
    String date =request.getParameter("AH1");
    String sch,dur,dos;
    sch=request.getParameter("T1");
    dos=request.getParameter("T2");
    dur=request.getParameter("T3");
    
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    //Create sql
    String s1="insert into patient_medicine_data values(?,?,?,?,?,?)";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, patient_id);
    p1.setString(2, medicine);
    p1.setString(3, date);
    p1.setString(4, sch);
    p1.setString(5, dos);
    p1.setString(6, dur);
    
    //Execute statement
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
<div class="container-fluid bg-dark" style="min-height:700px;">
<form method="post" action="ShowPatientDetails1.jsp">
    <input type="hidden" name="h1" value="<%= patient_id %>" />
    <input type="submit" name="B1" value="BACK" />
</form>
</div>