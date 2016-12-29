<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	
	
	MemoDTO dto = mdao.read(memono);
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<style type="text/css">

.div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: "50%";
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<jsp:include page="/menu/nav.jsp"/>

<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Update</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>

	<form name="frm" method="post" action="./updateProc.jsp"
		onsubmit="return input(this)">
		<input type="hidden" name = "memono" value="<%=memono %>">
		<input type="hidden" name = "col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name = "word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name = "nowPage" value="<%=request.getParameter("nowPage")%>">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="30" value="<%=dto.getTitle()%>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="30"><%=dto.getContent()%></textarea></td>
			</tr>
		</table>

		<div class = "div">
			<input type="submit" value="수정">
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