<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class = "memo.MemoDTO"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
<jsp:setProperty property="memono" name="dto"/>
<%-- <jsp:setProperty property="*" name="dto"/> --%>

<%

	
	boolean flag = mdao.update(dto);
	
	
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
}
</style>
<script type="text/javascript">
function mlist() {
	var url = "list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}

</script>>
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


	<div class="div">
		<%
			if (flag) {
				out.print("메모를 수정하였습니다.");
			} else {
				out.print("수정에 실패하였습니다");
			}
		%>
		<br><br> <input type="button" value="목록" onclick="mlist()">
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