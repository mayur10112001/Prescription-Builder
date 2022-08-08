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
    String name,company;
    name=request.getParameter("T1"); //T1 is name of textfield
    company=request.getParameter("T2");

    String msg="";
    if(name==null || name.trim().equals(""))
    {
        msg="Enter your name";
    }
    else if(company==null || company.trim().equals(""))
    {
        msg="Enter the Company";
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
        String sql1="insert into medicine_data values(?,?,?)";
        
        //Create dynamic statement 
        PreparedStatement p1=cn.prepareStatement(sql1);
        
        //Replace question marks with data
        p1.setInt(1, 0);
        p1.setString(2, name);
        p1.setString(3, company);
        
        //send data to tables
        int a=p1.executeUpdate();
        
        if(a==1)
        {
            msg="DATA IS SAVED";
        }
        else
        {
            msg="ERROR: DATA NOT SAVED";
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
                <li class="nav-item"><a class="nav-link" href="AddMedicine.jsp">ADD MORE</a></li>
                <li class="nav-item"><a class="nav-link" href="ShowMedicine.jsp">SHOW MEDICINE</a></li>
                <li class="nav-item"><a class="nav-link" href="AssistantHomecss.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
</div>
<div class="container-fluid bg-dark" style="min-height:648px;">
</div>
