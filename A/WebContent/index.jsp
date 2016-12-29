<!DOCTYPE html>
<html>
<title>HomePage</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
</style>
<% String root = request.getContextPath(); %>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidenav/menu -->
	<jsp:include page="/menu/nav.jsp" />

<!-- Overlay effect when opening sidenav on small screens -->
<DIV CLASS="W3-OVERLAY W3-HIDE-LARGE W3-ANIMATE-OPACITY" ONCLICK="W3_CLOSE()" STYLE="CURSOR:POINTER" TITLE="CLOSE SIDE MENU" ID="MYOVERLAY"></DIV>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Header -->
  <header class="w3-container" id="portfolio">
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Home</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
  </div>

<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>
