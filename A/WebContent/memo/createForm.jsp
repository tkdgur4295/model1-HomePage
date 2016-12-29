<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
<style type="text/css">
</style>
<script type="text/javascript">
	function input(frm) {
		if (frm.title.value == "") {
			alert("제목을 입력하시오");
			frm.title.focus();
			return false;
		}

		if (frm.content.value == "") {
			alert("내용을 입력하시오");
			frm.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="/menu/nav.jsp"/>
<div class="w3-main" style="margin-left:300px">
	<header class="w3-container" id="portfolio">
	
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Create</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
  
	<form name="frm" method="post" action="./createProc.jsp"
		onsubmit="return input(this)"
		style="text-align: center;">
		<table style="margin: auto;">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="30" value="create"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="30">create</textarea></td>
			</tr>
		</table>

		<div>
			<input type="submit" value="전송">
		</div>

	</form>
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