<%@page import="goyal.treatment.MyLib"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
<style>
        .mylink
        {
                color:#fff;
                background-color: #009;
                font-family: Comic Sans Ms;
                text-decoration: none;
                padding-left: 25px;
                padding-right: 25px;
                padding-bottom: 15px;
                text-align:center;
                padding-top:15px;
        }
        .mylink:hover
        {
                background-color: #5D8DA5;
        }
        .myheading
        {

                font-family:Copperplate Gothic Light;
                text-align:center;
                color: #FFFFFF;
                padding-top: 15px;
                font-size: 48px;
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
<marquee><a href="#" class="navbar-brand"> WELCOME TO VIEW PATIENT DETAILS</a></marquee>
</nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="Search.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
<%
    String patient_id =request.getParameter("AhE1");
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    //Create sql
    String s1="select * from patient_data where patient_id=?";
    String s2="select * from patient_medicine_data where patient_id=?";
    String s3="select * from patient_description where patient_id=?";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, patient_id);
    PreparedStatement p2=cn.prepareStatement(s2);
    p2.setString(1, patient_id);
    PreparedStatement p3=cn.prepareStatement(s3);
    p3.setString(1, patient_id);
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    ResultSet r2=p2.executeQuery();
    ResultSet r3=p3.executeQuery();
    
    //Fetch row one by one
    if(r1.next())
    {
        //Fetch columns
        String nm,adr,phone,height,weight,remark,t,prescription,medicine,sch,dur,dos;
        Long dt;
        nm=r1.getString("name");
        adr=r1.getString("address");
        phone=r1.getString("contact");
        height=r1.getString("height");
        weight=r1.getString("weight");
        dt=r1.getLong("dt");
        remark=r1.getString("remark");
        DateFormat formatter=new SimpleDateFormat("dd/MM/yyyy");
        DateFormat formatter1=new SimpleDateFormat("HH:mm:ss");
        Calendar calendar=Calendar.getInstance();
        calendar.setTimeInMillis(dt);
        t=formatter.format(calendar.getTime());
        String tt=formatter1.format(calendar.getTime());
        int m=r1.getInt("male");
        int f=r1.getInt("female");
        //show data
        %>
        <h2 class="text-light"><%= nm %></h2>
        <p class="text-light">
            ADDRESS : <%= adr %> <br>
            CONTACT : <%= phone %> <br>
            HEIGHT : <%= height %> <br>
            WEIGHT : <%= weight %> <br>
            DATE AND TIME: <%= t %> <%= tt %> <br>
            REMARK : <%= remark %> <br>
            GENDER : <% 
                if(m==1)
                {
                    %>
                    <input type="radio" name="C1" checked value="Male" />M
                    <%
                }
                else
                {
                    %>
                    <input type="radio" name="C1" value="Male" />M
                    <%
                }
                if(f==1)
                {
                    %>
                    <input type="radio" name="C2" checked value="Female" />F
                    <%
                }
                else
                {
                    %>
                    <input type="radio" name="C2" value="Female" />F
                    <%
                }
                %><br>
        </p>
        <%
    }
%>
<%
        if(r3.next())
        {
            String prescription;
            prescription=r3.getString("description");  
        %>
        <p class="text-light">
            PRESCRIPTION :<br>
            <%
            for(int i=0; i<prescription.length(); i++)
            {
                char ch=prescription.charAt(i);
                if(ch=='\n')
                {
                    out.print("<br>");
                }
                else
                {
                    out.print(ch);
                }
            }
            %>
        </p>
        <%
    }
%>
        <%
        if(r2.next())
        {
            String medicine,dos,dur,sch;
            medicine=r2.getString("medicine");
            sch=r2.getString("schedule");
            dos=r2.getString("doses");
            dur=r2.getString("duration");
            
        %>
        <p class="text-light">MEDICINE TO BE TAKEN</p>
                <ul>
                        <li class="text-light">
                            <%= medicine %> &nbsp; <%= sch %> &nbsp; <%= dos %> &nbsp; <%= dur %>
                        </li>
                </ul>   
        </p>
        <%
    }
%>

        
           
