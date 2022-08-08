<head>
<link href="styles/bootstrap.css"
rel="stylesheet" type="text/css"/>

<script src="styles/bootstrap.js"></script>

<script>
$(document).ready(function(e) {
    $("#b1").click(function(e) {
        $("#menu1").slideToggle();
    });
});
</script>
</head>

<nav class="navbar navbar-expand-xl navbar-dark bg-danger">
<marquee><a href="#" class="navbar-brand">AUTHORIZATION ERROR: YOU ARE NOT THE AUTHORIZED USER</a></marquee>
</nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="Login.jsp">GOTO LOGIN</a></li>
            </ul>
        </div>
   </nav>
    <div class="container-fluid bg-dark" style="min-height:648px;" ></div>
