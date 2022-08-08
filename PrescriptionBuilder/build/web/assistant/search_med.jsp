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
<marquee><a href="#" class="navbar-brand">SEARCHED MEDICINES</a></marquee>
</nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
<%
    
    Connection cn=new MyLib().getConnection();
    String med=request.getParameter("q");
    String s1="select * from medicine_data where medicine LIKE '"+med+"%'";
    
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
            <th>COMPANY</th>
            <th>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</th>
            <th>MANAGE</th>
        </tr>
    <%
    while(r1.next())
    {
        //Fetch columns
        String nm,company,medicine_id;
        nm=r1.getString("medicine");
        company=r1.getString("company");
        medicine_id=r1.getString("medicine_id");
        //show data
        %>
        <tr>
            <td><%= nm %></td>
            <td>&nbsp; &nbsp; &nbsp; &nbsp;</td>
            <td><%= company %></td>
            <td>&nbsp; &nbsp; &nbsp; &nbsp;</td>
            <td>        
            <table border="0">
            <tr>
                <td>
                    <form method="post" action="EditMedicine.jsp">
                        <input type="hidden" name="h1" value="<%= medicine_id %>" />
                        <input type="submit" name="b1" value="EDIT" />
                    </form>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <form method="post" action="DeleteMedicine.jsp">
                        <input type="hidden" name="h1" value="<%= medicine_id %>" />
                        <input type="submit" name="b1" value="DELETE" />
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