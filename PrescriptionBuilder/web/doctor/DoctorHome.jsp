<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.*"%>
<style>
    .a1
    {
        color: #fff;
        background-color: #009;
        text-decoration: none;
        font-family:Comic Sans Ms;
        padding-left: 25px;
        padding-right:  25px;
        padding-bottom: 15px;
        padding-top: 15px;
        text-align:center;
    }
    .a1:hover
    {
        background-color: #5D8DA5;
    }
</style>
<html>
<head>
<link href="../styles/bootstrap.css" rel="stylesheet" type="text/css"/>
<script src="../styles/bootstrap.js"></script>

<script>
$(document).ready(function(e) {
    $("#b1").click(function(e) {
        $("#menu1").slideToggle();
    });
});
</script>
</head>

<body>

<nav class="navbar navbar-expand-xl navbar-dark bg-danger">
            <marquee><a href="#" class="navbar-brand">WELCOME TO PATIENT DETAILS</a></marquee>
            </nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="DoctorHomecss.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>   
<div class="container-fluid bg-dark" style="min-height:648px;" >
    <br>
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
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    //Create sql
    String s1="select * from patient_data";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    
    //Fetch row one by one
    while(r1.next())
    {
        //Fetch columns
        String nm,patient_id,t;
        Long dt;
        nm=r1.getString("name");
        patient_id=r1.getString("patient_id");
        dt=r1.getLong("dt");
        DateFormat formatter=new SimpleDateFormat("dd/MM/yyyy");
        DateFormat formatter1=new SimpleDateFormat("HH:mm:ss");
        Calendar calendar=Calendar.getInstance();
        calendar.setTimeInMillis(dt);
        t=formatter.format(calendar.getTime());  
        java.util.Date a=formatter.parse(t);
        String tt=formatter1.format(calendar.getTime());
        Long DT;
        String T;
        DT=System.currentTimeMillis();
        DateFormat formatter2=new SimpleDateFormat("dd/MM/yyyy");
        Calendar calendar1=Calendar.getInstance();
        calendar1.setTimeInMillis(DT);
        T=formatter2.format(calendar1.getTime());
        java.util.Date A=formatter2.parse(T);
        //show data
        if(a.compareTo(A) == 0)
        {
        %>
        <ul>
            <li><form method="post" action="ShowPatientDetails1.jsp">
            <input type="hidden" name="h1" value="<%= patient_id %>" />
            <input type="submit" name="B1" value="<%= nm %>" />
            </form></li>
        </ul>
        <%
        }
    }
%>
</div>