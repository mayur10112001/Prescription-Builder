<%@page import="goyal.treatment.MyLib"%>
<%@page import="java.sql.*"%>
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


<nav class="navbar navbar-expand-xl navbar-dark bg-danger">
<marquee><a href="#" class="navbar-brand"> WELCOME TO THE MEDICINE LIST</a></marquee>
</nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="Search_med1.jsp">SEARCH</a></li>
                <li class="nav-item"><a class="nav-link" href="AssistantHomecss.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
<div class="container-fluid bg-dark" style="height:auto;">
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
    //Load jdbc mysql driver
    Connection cn=new MyLib().getConnection();
    %>
    <%
    //Create sql
    String s1="select * from medicine_data";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    
    //Fetch row one by one
    while(r1.next())
    {
        //Fetch columns
        String nm,company,medicine_id;
        nm=r1.getString("medicine");
        company=r1.getString("company");
        medicine_id=r1.getString("medicine_id");
        //show data
        %>
        <ul>
            <li><h3 class="text-light"><%= nm %></h3></li>
        <p class="text-light">
            COMPANY : <%= company %>
        </p>
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
    </ul>
        <%
    }
%>
</div>