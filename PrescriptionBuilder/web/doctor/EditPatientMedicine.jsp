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
<marquee><a href="#" class="navbar-brand">WELCOME TO EDIT PATIENT MEDICINE </a></marquee>
</nav>
<div class="container-fluid bg-dark" style="min-height:700px;">
<%
    //Receive hidden field
    String medicine=request.getParameter("Aaah1");
    String patient_id=request.getParameter("AAAh1");
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    //Create sql
    String s1="select * from patient_medicine_data where medicine=?";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, medicine);
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    
    //Fetch row one by one
    if(r1.next())
    {
        //Fetch columns
        String sch,dos,dur;
        sch=r1.getString("schedule");
        dos=r1.getString("doses");
        dur=r1.getString("duration");
    %>
        <table class="text-light">
            <tr>
                <td>MEDICINE NAME:</td>
                <td><input value="<%= medicine %>" type="text" name="T1" id="txt1" /></td>
            </tr>
            <tr>
                <td>SCHEDULE:</td>
                <td><input value="<%= sch %>" type="text" name="T2" id="txt2" /></td>
            </tr>
            <tr>
                <td>DOSES:</td>
                <td><input value="<%= dos %>" type="text" name="T3" id="txt3" /></td>
            </tr>
            <tr>
                <td>DURATION:</td>
                <td><input value="<%= dur %>" type="text" name="T4" id="txt4" /></td>
            </tr>
        </table>
            <table>
                <tr>
                    <td>
                        <form id="form1" name="form1" method="post" action="EditPatientMedicine1.jsp">
                        <input type="hidden" name="AHh1" value="<%= medicine %>" />
                        <input type="hidden" name="AHH1" value="<%= patient_id %>" />
                        <input type="submit" name="B1" value="EDIT" />
                        </form>
                    </td>
                    <td><br></td>
                    <td>
                        <form method="post" action="ShowPatientDetails1.jsp">
                        <input type="hidden" name="h1" value="<%= patient_id %>" />
                        <input type="submit" name="B1" value="BACK" />
                        </form>
                    </td>
                </tr>
            </table>
    <%
    }
    else
    {
        %>
        <h3>No data found</h3>
        <%
    }
    %>
</div>