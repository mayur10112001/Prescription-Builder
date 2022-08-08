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
<marquee><a href="#" class="navbar-brand"> WELCOME TO ADDING MEDICINE FORM </a></marquee>
</nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="AssistantHomecss.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
<div align="center">
    <br>
    <br>
    <br>
<style>
	#form1
	{
		background-color:#0FC;
		width:550px;
		height:350px;
		border:3px solid #000;
		padding-top:32px;
		font-family:Comic Sans Ms;
		border-radius:10px;
		text-align:center;
                padding-left: 50px;
	}
	#btn1
	{
		font-family:Comic Sans Ms;
		padding:5px;
	}
	#txt1_err,#txt2_err,#txt3_err,#txt4_err,#txt5_err,#txt6_err
	{
		color:#F00;
		font-family:Arial;
	}
        #a1,#btn1
        {
            margin-right: 60px;
        }
  
</style>
<form id="form1" onSubmit="return A()" method="post" action="AddMedicine1.jsp">
  <h1 id="a1">MEDICINE DETAILS </h1>
  <table border="0" width="500" border-color="black">
    <tr>
        <td><br></td>
    </tr
    <tr>
        <td><br></td>
    </tr>
    <tr>
    	<td>MEDICINE NAME:</td>
        <td><input type="text" name="T1" id="txt1" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt1_err"></span></td>
    </tr>
    <tr>
        <td><br></td>
    </tr>
    <tr>
    	<td>COMPANY:</td>
        <td><input type="text" name="T2" id="txt2" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt2_err"></span></td>
    </tr>
    <tr>
        <td><br></td>
    </tr>
    <tr>
        <td><br></td>
    </tr>
  </table>
  <p><input type="submit" name="B1" id="btn1" value="ADD" /></p>
</form>
<script>

       function A()
	   {
			 var t1=document.getElementById("txt1");
			 var s1=document.getElementById("txt1_err");
			 var t2=document.getElementById("txt2");
			 var s2=document.getElementById("txt2_err");
			 
			 var a=t1.value;
			 var b=t2.value;
                         
			 s1.innerHTML="";
			 s2.innerHTML="";
			 
			if(a==null || a=="")
                        {
                                s1.innerHTML="*Enter name";
                                t1.focus();
                                return false;
                        }
                        else if(b==null || b=="")
                        {
                                s2.innerHTML="*Enter conpany";
                                t2.focus();
                                return false;
                        }
            }
</script>
</div>
</div>