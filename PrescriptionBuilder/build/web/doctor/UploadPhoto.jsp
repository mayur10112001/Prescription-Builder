<%@page import="goyal.treatment.MyLib" %>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link href="../styles/bootstrap.css" rel="stylesheet" type="text/css"/>
<script src="../styles/bootstrap.js"></script>

<script>
$(document).ready(function(e) {
    $("#b1").click(function(e) {
        $("#menu1").slideToggle();
    });
});
<%String patient_id=request.getParameter("Q1");%>
</script>
</head>

<body>

<nav class="navbar navbar-expand-xl navbar-dark bg-danger">
            <marquee><a href="#" class="navbar-brand">PHOTO UPLOADED</a></marquee>
            </nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="#">
                    <form id="form1" method="post" action="ShowPatientDetails1.jsp">
                    <input type="hidden" name="h1" value="<%= patient_id %>" />
                    <input type="submit" name="b1" value="BACK" />
                    </form>
                </a></li>
            </ul>
        </div>
   </nav>   
<div class="container-fluid bg-dark" style="min-height:648px;" >
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
    String saveFile="";
    String contentType = request.getContentType();
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
    DataInputStream in = new DataInputStream(request.getInputStream());
    int formDataLength = request.getContentLength();
    byte dataBytes[] = new byte[formDataLength];
    int byteRead = 0;
    int totalBytesRead = 0;
    while (totalBytesRead < formDataLength) {
    byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
    totalBytesRead += byteRead;
    }
    String file = new String(dataBytes);
    saveFile = file.substring(file.indexOf("filename=\"") + 10);
    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
    int lastIndex = contentType.lastIndexOf("=");
    String boundary = contentType.substring(lastIndex + 1,contentType.length());
    int pos;
    pos = file.indexOf("filename=\"");
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    pos = file.indexOf("\n", pos) + 1;
    int boundaryLocation = file.indexOf(boundary, pos) - 4;
    int startPos = ((file.substring(0, pos)).getBytes()).length;
    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

    String path=application.getRealPath("/");
    String path1=path.replace("\\", "/");
    String path2=path1+"/doctor/photos/";
    saveFile=e1+"_"+saveFile;
    File f = new File(path2+saveFile);
    FileOutputStream fileOut = new FileOutputStream(f);
    fileOut.write(dataBytes, startPos, (endPos - startPos));
    fileOut.flush();
    fileOut.close();


    //Send page details in table
    MyLib obj=new MyLib();

    Class.forName(obj.getDriver());
    Connection cn=DriverManager.getConnection(obj.getConnectionString(), obj.getUserName(), obj.getPassword());
    String sql="insert into report_photos values(?,?)";
    PreparedStatement p1=cn.prepareStatement(sql);
    p1.setString(1,patient_id);
    p1.setString(2,saveFile);
    p1.executeUpdate();
    }
%>
</div>