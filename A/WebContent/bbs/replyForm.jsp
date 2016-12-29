<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.readReply(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply</title>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/nav.jsp" flush="false" />
	<!-- *********************************************** -->
<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Reply</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>


	<FORM name='frm' method='POST' action='./replyProc.jsp'
	enctype = "multipart/form-data">
	<!-- 답변을 등록하기 위해서 -->
		<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
		<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
		<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
		
		<!-- 페이지와 검색을 유지하기 위해서 -->
		<input name="col" value="<%=request.getParameter("col")%>" type="hidden"> 
		<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
		<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
		
		<!-- 부모글삭제를 막기위해서 -->
		<input name="bbsno" value="<%=request.getParameter("bbsno")%>" type="hidden">
		<TABLE>
			<TR>
				<TH>이름</TH>
				<TD><input type="text" name="wname"></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title"
					value="<%=dto.getTitle()%>의 답변"></TD>
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
<!-- *********************************************** -->
</html>
