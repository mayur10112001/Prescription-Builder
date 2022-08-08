<%@page import="java.sql.*" %>
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
<marquee><a href="#" class="navbar-brand">WELCOME TO DELETE MEDICINE DETAILS</a></marquee>
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
<%
     String medicine_id=request.getParameter("h1");
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    //Create sql
    String s1="select * from medicine_data where medicine_id=?";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, medicine_id); 
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    
    //Fetch row one by one
    if(r1.next())
    {
        //Fetch columns
        String nm,company;
        nm=r1.getString("medicine");
        company=r1.getString("company");
  
        //show data
        %>
        <h3 class="text-light"><%= nm %></h3>
        <p class="text-light">
            COMPANY : <%= company %> <br>
        <form method="post" action="DeleteMedicine1.jsp">
            <input type="hidden" name="HH1" value="<%= medicine_id %>" />
            <input type="submit" name="B1" value="Delete" />
        </form>
            
        </p>
        <%
    }
    %>
</div>