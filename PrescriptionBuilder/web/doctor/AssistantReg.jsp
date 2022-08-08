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
	#form1
	{
		background-color:#0FC;
		width:550px;
		height:580px;
		border:3px solid #000;
		padding-top:32px;
		font-family:Comic Sans Ms;
		border-radius:10px;
		text-align:center;
                padding-left: 43px;
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
            margin-right: 70px;
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
<marquee><a href="#" class="navbar-brand"> WELCOME TO ASSISTANT REGISTRATION FORM</a></marquee>
</nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="DoctorHomecss.jsp">BACK</a></li>
            </ul>
        </div>
   </nav>
<div class="container-fluid bg-dark" style="min-height:648px;">
<div align="center">
    <br>
<form id="form1" onSubmit="return A()" method="post" action="AssistantReg1.jsp">
  <h1 id="a1">ASSISTANT REGISTRATION </h1>
  <table border="0" width="500" border-color="black">
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
    	<td>Name</td>
        <td><input type="text" name="T1" id="txt1" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt1_err"></span></td>
    </tr>
    <tr>
    	<td>Address</td>
        <td><input type="text" name="T2" id="txt2" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt2_err"></span></td>
    </tr>
    <tr>
    	<td>Contact</td>
        <td><input type="text" name="T3" id="txt3" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt3_err"></span></td>
    </tr>
    <tr>
    	<td>Email</td>
        <td> <input type="text" name="T4" id="txt4" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt4_err"></span></td>
    </tr>
    <tr>
    	<td>Password</td>
        <td><input type="password" name="T5" id="txt5" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt5_err"></span></td>
    </tr>
    <tr>
    	<td>Confirm Password</td>
        <td><input type="password" name="T6" id="txt6" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt6_err"></span></td>
    </tr>
  </table>
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
			 var t6=document.getElementById("txt6");
			 var s6=document.getElementById("txt6_err");
			 
			 var a=t1.value;
			 var b=t2.value;
			 var c=t3.value;
			 var d=t4.value;
			 var e=t5.value;
			 var f=t6.value;
			 
			 s1.innerHTML="";
			 s2.innerHTML="";
			 s3.innerHTML="";
			 s4.innerHTML="";
			 s5.innerHTML="";
			 s6.innerHTML="";
			 
			if(a==null || a=="")
		{
			s1.innerHTML="*Enter name";
			t1.focus();
			return false;
		}
		else if(check_alpha(a)==false)
		{
			s1.innerHTML="!use only alphabets";
			t1.select();
			return false;
		}
		else if(b==null || b=="")
		{
			s2.innerHTML="*Enter address";
			t2.focus();
			return false;
		}
		else if(c==null || c=="")
		{
			s3.innerHTML="*Enter contact";
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
			s4.innerHTML="*Enter email";
			t4.focus();
			return false;
		}
		else if(e==null || e=="")
		{
			s5.innerHTML="*Enter password";
			t5.focus();
			return false;
		}
		else if(f==null || f=="")
		{
			s6.innerHTML="*Enter confirm password";
			t6.focus();
			return false;
		}
		else if(e!=f)
		{
			t5.value="";
			t6.value="";
			s6.innerHTML=").Password not matched";
			t5.focus();
			return false;
		}
	}
		
		function check_alpha(val)	
		{
			var f=true;
			for(i=0; i<val.length && f==true; i++)
			{
				var ch=val.charAt(i);
				if(!(ch>='A'&&ch<='Z' || ch>='a'&&ch<='z' ||ch==' '))
				{
					f=false;
				}
			}
			return f;
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
