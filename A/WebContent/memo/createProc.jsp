<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class = "memo.MemoDTO"/>
<jsp:setProperty property ="*" name = "dto"/>
<%
	
	boolean flag = mdao.create(dto);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create</title>
<style type="text/css">	
.div{
text-align: center;
margin-top: 100px;
}
</style>
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
<div class="w3-main" style="margin-left:300px">

	<div class="div">
		<%
			if (flag) {
				out.print("메모 등록");
			} else {
				out.print("등록 실패");
			}
		%>
		<br> <input type="button" value="계속 등록"
			onclick="location.href='./createForm.jsp'"> <input
			type="button" value="목록" onclick="location.href='./list.jsp'">
	</div>
	
</div>
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