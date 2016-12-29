<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BbsCreate</title>
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
    <h1><b>Bbs</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>

	<DIV class="title">등록</DIV>

	<FORM name='frm' method='POST' action='./createProc.jsp'
		enctype="multipart/form-data">
		<TABLE>
			<TR>
				<TH>이름</TH>
				<TD><input type="text" name="wname"></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title"></TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD><textarea rows="10" cols="50" name="content"></textarea></TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
			<TR>
				<TH>파일명</TH>
				<TD><input type="file" name="filename"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='등록'> <input type="reset"
				value='재입력'> <input type="button" value='취소'
				onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	</div>
</body>
<!-- *********************************************** -->
</html>
