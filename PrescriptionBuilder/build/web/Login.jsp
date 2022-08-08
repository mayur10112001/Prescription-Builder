<%@include file="a1.jsp" %>
<div align="center">
    <br>
    <br>
    <br>
    <br>
    <br>
<style>
	#form1
	{
		background-color:#0FC;
		width:550px;
		height:380px;
		border:3px solid #000;
		padding-top:32px;
		border-radius:10px;
		text-align:center;
                padding-left: 95px;
	}
	#btn1
	{
		font-family:Comic Sans Ms;
		padding-left:10px;
                padding-right:10px;
                padding-bottom:5px;
                padding-top:5px;
                margin-top: 30px;
                margin-right: 105px;
	}
	#txt1_err,#txt2_err
	{
		color:#F00;
		font-family:Comic Sans Ms;
	}
        #a1
	{
                font-family:Comic Sans Ms;
		margin-right: 95px;
                margin-bottom: 60px;
	}
        #btn1:hover
        {
            background-color: #6F6;
        }
</style>
<form id="form1" onSubmit="return A()" action="CheckLogin.jsp" method="post">
<h1 id="a1">LOGIN FORM</h1>
<table border="0" width="500" border-color="black">
    <tr>
    	<td>USERNAME</td>
        <td><input type="text" name="T1" id="txt1" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt1_err"></span></td>
    </tr>
    <tr>
    	<td>PASSWORD</td>
        <td><input type="password" name="T2" id="txt2" /></td>
    </tr>
    <tr>
        <td><br></td>
        <td><span id="txt2_err"></span></td>
    </tr>
</table>
<input id="btn1"  type="submit" value="LOGIN" />
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
                            s1.innerHTML="*enter username";
                            t1.focus();
                            return false;
                        }
                        else if(b==null || b=="")
                        {
                            s2.innerHTML="*enter password";
                            t2.focus();
                            return false;
                        } 
                       
            }
</script>
</div>
<%@include file="a2.jsp" %>