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
<marquee><a href="#" class="navbar-brand"> WELCOME TO PATIENT ENTRY FORM</a></marquee>
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
		width:850px;
		height:400px;
		border:3px solid #000;
		padding-top:32px;
		font-family:Comic Sans Ms;
		border-radius:10px;
		text-align:center;
                padding-left: 28px;
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
            margin-right: 80px;
        }
        .a11
        {
            color: #fff;
            background-color: #009;
            text-decoration: none;
            font-family:Comic Sans Ms;
            padding-left: 25px;
            padding-right:  25px;
            padding-bottom: 15px;
            padding-top: 15px;
            text-align:center;
        }
        .a11:hover
        {
            background-color: #5D8DA5;
        }
</style>
<form id="form1" onSubmit="return A()" method="post" action="PatientDetails1.jsp">
  <h1 id="a1">PATIENT DETAILS</h1>
  <table border="0" width="800" border-color="black">
    <tr>
    	<td>NAME:</td>
        <td><input type="text" name="T1" id="txt1" /></td>
        <td><span id="txt1_err"></span></td>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<td>HEIGHT:</td>
        <td> <input type="text" name="T4" id="txt4" /></td>
        <td><span id="txt4_err"></span> </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
    	<td>ADDRESS:</td>
        <td><input type="text" name="T2" id="txt2" /></td>
        <td><span id="txt2_err"></span></td>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <td>WEIGHT:</td>
        <td> <input type="text" name="T5" id="txt5" /></td>
        <td><span id="txt5_err"></span> </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
    	<td>PHONE NO.:</td>
        <td><input type="text" name="T3" id="txt3" /></td>
        <td><span id="txt3_err"></span></td>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <td>GENDER:</td>
        <td>
            <input type="radio" name="C1" value="Male"/>M
            <input type="radio" name="C2" value="Female"/>F
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
    	<td>REMARK :</td>
        <td><input type="text" name="T6" id="txt6" /></td>
        <td><span id="txt6_err"></span></td>
    </tr>
  </table>
  <br>
  <br>
  <p><input type="submit" name="B1" id="btn1" value="REGISTER" /></p>
</form>
<script>

       function A()
	   {
			 var t1=document.getElementById("txt1");
			 var s1=document.getElementById("txt1_err");
			 var t2=document.getElementById("txt2");
			 var s2=document.getElementById("txt2_err");
			 var t3=document.getElementById("txt3");  
			 var s3=document.getElementById("txt3_err");
			 var t4=document.getElementById("txt4");
			 var s4=document.getElementById("txt4_err");
                         var t5=document.getElementById("txt5");
			 var s5=document.getElementById("txt5_err");
			 
			 var a=t1.value;
			 var b=t2.value;
			 var c=t3.value;
			 var d=t4.value;
                         var e=t5.value;
			 
			 s1.innerHTML="";
			 s2.innerHTML="";
			 s3.innerHTML="";
			 s4.innerHTML="";
                         s5.innerHTML="";
			 
			if(a==null || a=="")
                        {
                            s1.innerHTML="*Enter Name";
                            t1.focus();
                            return false;
                        }
                        else if(b==null || b=="")
                        {
                            s2.innerHTML="*Enter Address";
                            t2.focus();
                            return false;
                        }
                        else if(c==null || c=="")
                        {
                            s3.innerHTML="*Enter Contact";
                            t3.focus();
                            return false;
                        }
                        else if(check_number(c)==false)
                        {
                            s3.innerHTML="!Only digits";
                            t3.select();
                            return false;
                        }
                        else if(d==null || d=="")
                        {
                            s4.innerHTML="*Enter Height";
                            t4.focus();
                            return false;
                        }
                        else if(e==null || e=="")
                        {
                            s5.innerHTML="*Enter Weight";
                            t5.focus();
                            return false;
                        }
                }
                function check_number(val)	
		{
			var f=true;
			for(i=0; i<val.length && f==true; i++)
			{
				var ch=val.charAt(i);
				if(!(ch>='0'&&ch<='9'))
				{
					f=false;
				}
			}
			return f;
		}

</script>
</div>
</div>

