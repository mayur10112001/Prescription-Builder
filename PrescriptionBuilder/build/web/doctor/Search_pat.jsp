<%@page import="goyal.treatment.MyLib"%>
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
<marquee><a href="#" class="navbar-brand">SEARCHED PATIENT NAME</a></marquee>
</nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
<%
    
    Connection cn=new MyLib().getConnection();
    String pat=request.getParameter("q");
    String s1="select * from patient_data where name LIKE '"+pat+"%'";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    
    //Fetch row one by one
    %>
    <p>
    <table class="text-light" width:800px>
        <tr>
            <th>NAME</th>
            <th>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
            <th>MANAGE</th>
        </tr>
    <%
    while(r1.next())
    {
        //Fetch columns
        String nm,patient_id;
        nm=r1.getString("name");
        patient_id=r1.getString("patient_id");
        //show data
        %>
        <tr>
            <td><%= nm %></td>
            <td>&nbsp; &nbsp; &nbsp; &nbsp;</td>
            <td>        
            <table border="0">
            <tr>
                <td>
                    <form method="post" action="ShowPatientDetails1.jsp">
                        <input type="hidden" name="h1" value="<%= patient_id %>" />
                        <input type="submit" name="b1" value="SHOW" />
                    </form>
                </td>
            </tr>
        </table>
            </td>
        </tr>
        <%
    }
%>
    </table>
</p>
</div>