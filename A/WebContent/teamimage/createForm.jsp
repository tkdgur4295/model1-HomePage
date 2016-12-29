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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
		<jsp:include page="/menu/nav.jsp" flush="false" />
<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Create</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
	<!-- *********************************************** -->


	<FORM name='frm' method='POST' action='./createProc.jsp'
		enctype="multipart/form-data">
		<TABLE>
			<TR>
				<TH>아름</TH>
				<TD><input type="text" name="name"></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title"></TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD><textarea name="content"></textarea></TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
			<TR>
				<TH>사진</TH>
				<TD><input type="file" name="filename" accept=".jpg , .gif, .png"></TD>
			</TR>
		</TABLE>
		`

		<DIV class='bottom'>
			<input type='submit' value='작성하기'> 
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>

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
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
