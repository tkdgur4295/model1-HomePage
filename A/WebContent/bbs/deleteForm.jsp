<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = bdao.checkRefno(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
<script type="text/javascript">
function incheck(f) {
	if(f.passwd.value==""){
		alert("패스워드를 입력하세요.");
		f.passwd.focus();
		return false;
	}
	
}

</script>

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
    <h1><b>Delete</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>


	<div class="content">
	<%if(flag){
		out.print("답변이 있는 글이므로 삭제 할 수 없습니다.<br>");
		out.print("<input type ='button' value='다시시도' onclick='history.go(-2)'>");
		}else{ %>
	<FORM name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return incheck(this)">
		<input type = "hidden" name = "bbsno" value="<%=bbsno %>">
		<input name="col" value="<%=request.getParameter("col")%>" type="hidden">
		<input name="word" value="<%=request.getParameter("word")%>" type="hidden">
		<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden">
		<input name="oldfile" value="<%=request.getParameter("oldfile")%>" type="hidden">
		삭제되면 복구할수없습니다.<br><br>
			<TABLE>
				<TR>
					<TH>패스워드</TH>
					<TD><input type="password" name = "passwd"></TD>
				</TR>
			</TABLE>

			<DIV class='bottom'>
				<input type='submit' value='확인'> 
				<input type='button' value='취소' onclick="history.back()">
			</DIV>
		</FORM>
		<%} %>
	</div>


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
