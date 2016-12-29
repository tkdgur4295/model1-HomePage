<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	String oldfile = request.getParameter("oldfile");
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	boolean pflag = bdao.passCheck(map);
	boolean flag = false;
	if (pflag) {
		flag = bdao.delete(bbsno);
	}
	if(flag){
		String upDir = application.getRealPath("/bbs/storage");
		UploadSave.deleteFile(upDir, oldfile);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
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

	<div class = "content">

	<%
		if (pflag == false) {
			out.print("패스워드가 일치하지 않습니다.");
		} else if (flag) {
			out.print("글을 삭제하였습니다.");
		} else {
			out.print("글삭제를 실패하였습니다.");
		}
	%>
	</div>


	<%
		if (pflag == false) {
	%>
	<DIV class='bottom'>
		<input type='submit' value='다시시도' onclick="history.back()"> <input
			type='button' value='목록' onclick="blist()">
	</DIV>
	<%
		} else {
	%>
	<div class='bottom'>
		<input type='submit' value='계속 등록'
			onclick="location.href='createForm.jsp'"> <input
			type='button' value='목록' onclick="blist()">

	</div>
	<%
		}
	%>


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
