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
        #form1
        {
          margin-top: 10px;
        }
</style>
<%String patient_id =request.getParameter("h1");%>
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
<marquee><a href="#" class="navbar-brand"> WELCOME TO PATIENT DETAILS</a></marquee>
</nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="DoctorHomecss.jsp">BACK</a></li>
                <li class="nav-item"><a class="nav-link" href="Search.jsp">SEARCH</a></li>
                
            </ul>
    <ul class="navbar-nav text-center ml-auto">
        <li class="nav-item"><a class="nav-link" href="#">
            <form id="form1" method="post" action="ViewPatientDetails.jsp">
            <input type="hidden" name="AhE1" value="<%= patient_id %>" />
            <input type="submit" name="b1" value="VIEW" />
            </form>
        </a></li>
    </ul>
</div>
</nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
<%
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass);
    
    //Create sql
    String s1="select * from patient_data where patient_id=?";
    
    //Create dynamic statement
    PreparedStatement p1=cn.prepareStatement(s1);
    p1.setString(1, patient_id);
    
    //Execute statement
    ResultSet r1=p1.executeQuery();
    
    //Fetch row one by one
    if(r1.next())
    {
        //Fetch columns
        String nm,adr,phone,height,weight,remark,t;
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
        int a=r1.getInt("male");
        int b=r1.getInt("female");
        //show data
        %>
        <h2 class="text-light"><%= nm %></h2>
        <div style="width:200px; height:auto; float:right">
        <%
                MyLib obj=new MyLib();
		String photo=obj.getPhoto(e1);
                if(photo.equalsIgnoreCase("no"))
                {
                    %>
        			<form method="post" enctype="multipart/form-data" action="UploadPhoto.jsp" >
                                    <p class="text-light">Photo 
        			    <label for="F1"></label>
                                    <input type="hidden" name="Q1" value="<%= patient_id %>">
                                    <input type="file" name="F1" id="F1" />
        			  </p>
        			  <p>
        			    <input type="submit" name="B1" id="B1" value="Upload Photo" />
                      </p>
        			</form>
                    <%
                }
                else
                {
                    %>
                    <img src="photos/<%= photo %>" width="150" height="150" />
                <%
                }
        %>
        </div>
        <p class="text-light">
            ADDRESS : <%= adr %> <br>
            CONTACT : <%= phone %> <br>
            HEIGHT : <%= height %> <br>
            WEIGHT : <%= weight %> <br>
            GENDER : <% 
                if(a==1)
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
                if(b==1)
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
            DATE AND TIME: <%= t %> <%= tt %> <br>
            REMARK : <%= remark %> <br>
        </p>
            <table border="0" >
                    <tr>
                        <td>
                            <form method="post" action="SavePatientDescription.jsp">
                                <p class="text-light">DESCRIPTION:</p>
                            <input type="hidden" name="aAah1" value="<%= patient_id %>" />
                                 <%
                                    String aa=new MyLib().getDescription(Integer.parseInt(patient_id));
                                    if(aa.equalsIgnoreCase("NA")==false)
                                    {
                                        %>
                                        <p><textarea rows="5" cols="60" name="TA1"><%= aa %></textarea></p>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <p><textarea rows="5" cols="60" name="TA1"></textarea></p>
                                        <%
                                    }
                                    %>
                                <input type="hidden" name="aAaH1" value="<%= dt %>" />
                                <input type="submit" name="b1" value="SUBMIT" />
                            </form>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <form method="post" action="EditPatientDescription.jsp">
                                <input type="hidden" name="AAah1" value="<%= patient_id %>" />
                                <input type="submit" name="BB1" value="EDIT" />
                            </form>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <form method="post" action="DeletePatientDescription.jsp">
                                <input type="hidden" name="aAAh1" value="<%= patient_id %>" />
                                <input type="submit" name="Ah1" value="DELETE" />
                            </form>
                        </td>
                        <td>
                        &nbsp;
                        </td>
                        
                    </tr>
                </table>
            <p class="text-light">MEDICINE TO BE TAKEN</p>
            <%
            String sql1="select * from patient_medicine_data where patient_id=?";
            PreparedStatement p11=cn.prepareStatement(sql1);
            p11.setInt(1, Integer.parseInt(patient_id));
            ResultSet r11=p11.executeQuery();
            while(r11.next())
            {
                String medicine=r11.getString("medicine");
                String schedule=r11.getString("schedule");
                String doses=r11.getString("doses");
                String duration=r11.getString("duration");
                %>
                <table border="0" >
                    <tr>
                        <td class="text-light">
                            <%= medicine %> &nbsp; <%= schedule %> &nbsp; <%= doses %> &nbsp; <%= duration %>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <form method="post" action="EditPatientMedicine.jsp">
                                <input type="hidden" name="Aaah1" value="<%= medicine %>" />
                                <input type="hidden" name="AAAh1" value="<%= patient_id %>" />
                                <input type="submit" name="BB1" value="EDIT" />
                            </form>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <form method="post" action="DeletePatientMedicine.jsp">
                                <input type="hidden" name="Aah1" value="<%= medicine %>" />
                                <input type="hidden" name="AAh1" value="<%= patient_id %>" />
                                <input type="submit" name="Ah1" value="DELETE" />
                            </form>
                        </td>
                    </tr>
                </table>
            <% } %>
            <table border="0">
                <tr>
                <form method="post" action="SavePatientMedicine.jsp">
                    <td>
                        <select name="S1">
                        <%
                        ArrayList<String> lst=new MyLib().getMedicines();

                        for(int i=0; i<lst.size();i++)
                        {
                            String med=lst.get(i);
                            %>
                            <option><%= med %></option>
                            <%
                        }
                        %>
                        </select>
                    </td>
                    <td>
                        &nbsp;
                    </td>            
                    </tr>
                    <tr>
                        <td class="text-light">SCHEDULE:</td>
                        <td><input type="text" name="T1" id="txt1" /></td>
                    </tr>
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td class="text-light">DOSES:</td>
                        <td><input type="text" name="T2" id="txt2" /></td>
                    </tr>
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td class="text-light">DURATION:</td>
                        <td><input type="text" name="T3" id="txt3" /></td>
                    </tr>
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="Ah1" value="<%= patient_id %>" />
                            <input type="hidden" name="AH1" value="<%= dt %>" />
                            <input type="submit" name="b1" value="SUBMIT" />
                        </td>   
                    </tr>
                    </form>
            </table>
        <%
    }
%>
</div>