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
<marquee><a href="#" class="navbar-brand">WELCOME TO EDIT MEDICINE DETAILS</a></marquee>
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
    //Receive hidden field
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
    %>
    <form id="form1" name="form1" method="post" action="EditMedicine1.jsp">
        <table>
            <tr>
                <td class="text-light">MEDICINE NAME:</td>
                <td><input value="<%= nm %>" type="text" name="T1" id="txt1" /></td>
            </tr>
            <tr>
                <td>
                    <br>
                </td>
            </tr>
            <tr>
                <td class="text-light">COMPANY:</td>
                <td><input value="<%= company %>" type="text" name="T2" id="txt2" /></td>
            </tr>
            <tr>
                <td>
                    <br>
                </td>
            </tr>
        </table>
        <input type="hidden" name="Hh1" value="<%= medicine_id %>" />
        <input type="submit" name="B1" value="EDIT" />
    </form>
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