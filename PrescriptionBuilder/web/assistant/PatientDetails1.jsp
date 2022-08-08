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
    //Receive form data
    String name,add,contact,height,weight;
    name=request.getParameter("T1"); //T1 is name of textfield
    add=request.getParameter("T2");
    contact=request.getParameter("T3");
    height=request.getParameter("T4");
    weight=request.getParameter("T5");
    String a,b;
    a=request.getParameter("C1");
    b=request.getParameter("C2");

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
    else if(height==null || height.trim().equals(""))
    {
        msg="Enter your Height";
    }
    else if(weight==null || weight.trim().equals(""))
    {
        msg="Enter your Weight";
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
        String sql1="insert into patient_data values(?,?,?,?,?,?,?,?,?,?)";
        
        //Create dynamic statement 
        PreparedStatement p1=cn.prepareStatement(sql1);
        
        //Replace question marks with data
        p1.setInt(1, 0);
        p1.setString(2, name);
        p1.setString(3, add);
        p1.setString(4, contact);
        p1.setString(5, height);
        p1.setString(6, weight);
        p1.setLong(7, System.currentTimeMillis());
        p1.setString(8,request.getParameter("T6"));
        if(a==null) p1.setInt(9, 0);
        else p1.setInt(9, 1);
        if(b==null) p1.setInt(10, 0);
        else p1.setInt(10, 1);
        
        //send data to tables
        int aa=p1.executeUpdate();
        
        if(aa==1)
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
                <li class="nav-item"><a class="nav-link" href="PatientDetails.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
    </div>
