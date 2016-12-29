<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	
	
	bdao.upViewcnt(bbsno); //조회수 증가
	BbsDTO dto = bdao.read(bbsno);// 한건의 데이터 읽어오기
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<scriptsrc="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<scriptsrc="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";		
		url += "&nowPage=<%=nowPage%>";		
		location.href = url;
	}
	function bupdate() {
		var url = "updateForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";	
		url += "&nowPage=<%=nowPage%>";		
		location.href = url;
	}
	function bdelete() {
		var url = "deleteForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";	
		url += "&nowPage=<%=nowPage%>";		
		url += "&oldfile=<%=dto.getFilename()%>";				
		location.href = url;
	}
	function breply() {
		var url = "replyForm.jsp"
		url += "?bbsno=<%=bbsno%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";		
		location.href = url;
	}
	function down(filename) {
		var url="<%=root%>/download";
		url += "?dir=/bbs/storage";
		url += "&filename="+filename;
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
    <h1><b>Read</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>

	<TABLE style="width: 40%">
		<TR>
			<TH>번호</TH>
			<td><%=dto.getBbsno()%></td>
		</TR>
		<TR>
			<TH>이름</TH>
			<td><%=dto.getWname()%></td>
		</TR>
		<TR>
			<TH>제목</TH>
			<td><%=dto.getTitle()%></td>
		</TR>
		<TR>
			<TH>내용</TH>
			<td><%=dto.getContent()%></td>
		</TR>
		<TR>
			<TH>입력날짜</TH>
			<td><%=dto.getWdate()%></td>
		</TR>
		<TR>
			<TH>조회수</TH>
			<td><%=dto.getViewcnt()%></td>
		</TR>
		<TR>
			<TH>파일명</TH>
			<td>
				<%if(dto.getFilename()==null) {
				out.print("파일없음");
			}else{ %> 
			<%=dto.getFilename()%>(<%=dto.getFilesize()/1024 %>KB) 
			
				<a href = "javascript:down('<%=dto.getFilename()%>')">
				<span class='glyphicon glyphicon-file'></span>
				</a>
				
				<%} %>
			</td>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='등록'
			onclick="location.href='createForm.jsp'"> <input
			type="button" value='목록' onclick="blist()"> <input
			type="button" value='수정' onclick="bupdate()"> <input
			type="button" value='삭제' onclick="bdelete()"> <input
			type="button" value='답변' onclick="breply()">
	</DIV>


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
