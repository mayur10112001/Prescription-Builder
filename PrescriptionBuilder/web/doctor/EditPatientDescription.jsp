<%@page import="java.sql.*"%>
<style>
    .a1
    {
        color: #fff;
        background-color: #009;
        text-decoration: none;
        font-family:Comic Sans Ms;
        padding-left: 20px;
        padding-right:  20px;
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
    <marquee><a href="#" class="navbar-brand">WELCOME TO EDIT PATIENT DESCRIPTION</a></marquee>
</nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
<%
    //Receive hidden field
    String patient_id=request.getParameter("AAah1");
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    //Create sql
    String s1="select * from patient_description where patient_id=?";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, patient_id);
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    
    //Fetch row one by one
    if(r1.next())
    {
        //Fetch columns
        String des;
        des=r1.getString("description");
    %>
    <form id="form1" name="form1" method="post" action="EditPatientDescription1.jsp">
        <table>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td class="text-light">Description:</td>
                <td><textarea rows="5" cols="60" name="TA1"></textarea></td>
            </tr>
        </table>
        <input type="hidden" name="AHh1" value="<%= patient_id %>" />
        <input type="submit" name="B1" value="EDIT" />
    </form>
    <%
    }
    else
    {
        %>
        <h3 class="text-light">No data found</h3>
        <%
    }
    %>
</div>