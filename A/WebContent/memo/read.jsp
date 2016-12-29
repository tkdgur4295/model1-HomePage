<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%
	
	int memono = Integer.parseInt(request.getParameter("memono"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	mdao.upViewcnt(memono);
	
	/* 조회수증가 end */
	
	
	/* 조회 */
	MemoDTO dto = mdao.read(memono);
	
	String content = null;
	if (dto!=null) {
		content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read</title>
<style type="text/css">

 table { 
 	width: "60%"; 
 	margin: 0 auto; 
 } 

 table, th, td {
 	border: 1px solid black;
 	border-collapse: collapse;
 } 

 th, td { 
 	padding: 10px; 
 } 
</style>
<script type="text/javascript">
	function mcreate() {
		var url = "createForm.jsp";
		location.href = url;
	}

	function mupdate(memono) {
		var url = "updateForm.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}

	function mdelete(memono) {
		var url = "deleteForm.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}

	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
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
    <h1><b>Read</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
  
	<table>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>

		<tr>
			<th>내용</th>
			<td><%=content %></td>
		</tr>

		<tr>
			<th>조회수</th>
			<td><%=dto.getViewcnt() %></td>
		</tr>

		<tr>
			<th>등록일</th>
			<td><%=dto.getWdate() %></td>
		</tr>

	</table>



	<div style=" 	text-align: center; margin-top: 20px;">
		<input type="button" value="등록" onclick="mcreate()"> <input
			type="button" value="수정"
			onclick="mupdate('<%=dto.getMemono() %>')"> <input
			type="button" value="삭제"
			onclick="mdelete('<%=dto.getMemono() %>')"> <input
			type="button" value="목록" onclick="mlist()">

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