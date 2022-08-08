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
<marquee><a href="#" class="navbar-brand">LOGIN ERROR: EITHER USERNAME OR PASSWORD IS INCORRECT</a></marquee>
</nav>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
<a href="#" class="navbar-brand">OPD</a>
<div class="collapse navbar-collapse" id="item">
            <ul class="navbar-nav text-center ml-5 mr-auto">
                <li class="nav-item"><a class="nav-link" href="Login.jsp">TRY AGAIN</a></li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid bg-dark" style="min-height:648px;" ></div>