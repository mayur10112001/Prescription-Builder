<html>
<head>
<link href="../styles/bootstrap.css"rel="stylesheet" type="text/css"/>
<script src="../styles/bootstrap.js"></script>

<script>
$(document).ready(function(e) {
    $("#b1").click(function(e) {
        $("#menu1").slideToggle();
    });
});
</script>
</head>

<body>

<nav class="navbar navbar-expand-xl navbar-dark bg-danger">
            <marquee><a href="#" class="navbar-brand">WELCOME TO DOCTOR WORK AREA</a></marquee>
            </nav>
            <nav class="navbar navbar-expand-xl navbar-dark bg-dark">
            <a href="#" class="navbar-brand">OPD</a>
        	<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="DoctorHome.jsp">HOME</a></li>
                <li class="nav-item"><a class="nav-link" href="AssistantReg.jsp">ASSISTANT REGISTRATION</a></li>
                <li class="nav-item"><a class="nav-link" href="Search.jsp">SEARCH</a></li>
                <li class="nav-item"><a class="nav-link" href="../Logout.jsp">SIGN OUT</a></li>
            </ul>
        	</div>
            </nav>

<div class="container-fluid bg-dark" style="min-height:648px;" >