<%@page import="java.sql.*"%>
<style>
    .a1
    {
        color: #fff;
        background-color: #009;
        text-decoration: none;
        font-family:Comic Sans Ms;
        padding-left: 15px;
        padding-right:  15px;
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
<h1>EDIT PATIENT MEDICINE DETAILS</h1>
<%
    String medicine=request.getParameter("AHh1");
    String patient_id=request.getParameter("AHH1");

    String schedule=request.getParameter("T2");
    String doses=request.getParameter("T3");
    String duration=request.getParameter("T4");
    
    //Load jdbc mysql driver
    Class.forName("com.mysql.jdbc.Driver");
    //Create connection
    String path="jdbc:mysql://localhost:3306/prescription";
    String dbuser="root";
    String dbpass="";
    Connection cn=DriverManager.getConnection(path, dbuser, dbpass); 
    //Create sql command
    String sql1="update medicine_data set schedule=?,doses=?,duration=? where medicine=?";
    PreparedStatement p1=cn.prepareStatement(sql1); 
    p1.setString(1, schedule);
    p1.setString(2, doses);
    p1.setString(3, duration);
    p1.setString(4, medicine);
    
    int a=p1.executeUpdate();
    
    String msg="";
    if(a==1)
    {
        msg="Changes has been saved";
    }
    else
    {
        msg="Changes has not been saved";
    }
    %>
    <h3><%= msg %></h3>
<form method="post" action="ShowPatientDetails1.jsp">
    <input type="hidden" name="h1" value="<%= patient_id %>" />
    <input type="submit" name="B1" value="BACK" />
</form>