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
        if(ut.equalsIgnoreCase("assistant")==false)
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
    String medicine_id=request.getParameter("Hh1");

    //Receive form data
    String name,company;
    name=request.getParameter("T1"); //T1 is name of textfield
    company=request.getParameter("T2");

    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass); 
    //Create sql command
    String sql1="update medicine_data set medicine=?,company=? where medicine_id=?";
    PreparedStatement p1=cn.prepareStatement(sql1); 
    p1.setString(1, name);
    p1.setString(2, company);
    p1.setString(3, medicine_id);

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
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="ShowMedicine.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
</div>
