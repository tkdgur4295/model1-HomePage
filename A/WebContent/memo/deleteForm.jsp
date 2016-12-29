<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int memono = Integer.parseInt(request.getParameter("memono"));
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
<style type="text/css">

.div{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

</style>
<script type="text/javascript">
	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/nav.jsp"/>

<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Delete</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
  
	<form method="post" action="delectProc.jsp" >
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name = "col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name = "word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name = "nowPage" value="<%=request.getParameter("nowPage")%>">
		<div class="div">
			삭제하면 복구할수없습니다.<br> <br> 삭제하시려면 "삭제"버튼을 클릭하세요<br> <br>
			취소는 "목록" 버튼을 누르세요 <br> <br> 
			<input type="submit" value="삭제"> 
				<input type="button" value="목록"  onclick="mlist();">
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