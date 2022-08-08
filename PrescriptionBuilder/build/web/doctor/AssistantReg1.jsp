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
    String name,add,contact,email,pass;
    name=request.getParameter("T1"); //T1 is name of textfield
    add=request.getParameter("T2");
    contact=request.getParameter("T3");
    email=request.getParameter("T4");
    pass=request.getParameter("T5");

    String msg="";
    if(name==null || name.trim().equals(""))
    {
        msg="Enter your name";
    }
    else if(add==null || add.trim().equals(""))
    {
        msg="Enter your Address";
    }
    else if(contact==null || contact.trim().equals(""))
    {
        msg="Enter your Phone Number";
    }
    else if(email==null || email.trim().equals(""))
    {
        msg="Enter your Email";
    }
    else if(pass==null || pass.trim().equals(""))
    {
        msg="Enter your Password";
    }
    else 
    {
        //Load jdbc mysql driver
        Class.forName("com.mysql.jdbc.Driver");
        //Create connection
        String path="jdbc:mysql://localhost:3306/prescription";
        String dbuser="root";
        String dbpass="";
        Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
        
        //Create sql command
        String sql1="insert into assistant_data values(?,?,?,?,?)";
        String sql2="insert into login_data values(?,?,?)";
        
        //Create dynamic statement 
        PreparedStatement p1=cn.prepareStatement(sql1);
        PreparedStatement p2=cn.prepareStatement(sql2);
        
        //Replace question marks with data
        p1.setString(1, name);
        p1.setString(2, add);
        p1.setString(3, contact);
        p1.setString(4, email);
        
        p2.setString(1, email);
        p2.setString(2, pass);
        p2.setString(3, "assistant");
        
        //send data to tables
        int a=p1.executeUpdate();
        int b=p2.executeUpdate();
        
        if(a==1 && b==1)
        {
            msg="DATA IS SAVED";
        }
        else
        {
            msg="ERROR: DATA IS SAVED";
        }
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
                <li class="nav-item"><a class="nav-link" href="AssistantReg.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
    </div>

