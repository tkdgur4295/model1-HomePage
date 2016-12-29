<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<%
	String upDir = "/bbs/storage";
	String tempDir = "/bbs/temp";
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	int bbsno = Integer.parseInt(upload.getParameter("bbsno"));
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String nowPage = upload.getParameter("nowPage");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	
	dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("filename");
	int filesize = (int)fileItem.getSize();
	String filename = null;
	if(filesize>0){//새로운 파일을 업로드 했다.
		UploadSave.deleteFile(upDir, oldfile);//기존파일을 삭제
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFilesize(filesize);
	dto.setFilename(filename);
	
	
	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd", dto.getPasswd());
	boolean pflag = bdao.passCheck(map);
	boolean flag = false;
	if (pflag) {
		flag = bdao.update(dto);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		url += "?col=<%=col%>" ;
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function read(bbsno) {
		var url = "read.jsp"
		url += "?bbsno=" + bbsno;
		location.href = url;
	}
</script>
<style type="text/css">

</style>
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
    <h1><b>Update</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
	

	<div class="content">
		<%
			if (pflag == false) {
				out.print("패스워드가 일치하지 않습니다.");
			} else if (flag) {
				out.print("게시판의 글을 수정하였습니다.");
			} else {
				out.print("글변경을 실패하였습니다.");
			}
		%>
	</div>
	<%
		if (pflag == false) {
	%>


	<DIV class='bottom'>
		<input type="button" value='다시 시도' onclick="history.back()"> <input
			type='button' value='목록' onclick="blist()">
	</DIV>

	<%
		} else {
	%>
	<div class='bottom'>
		<input type="button" value='계속 등록'
			onclick="location.href='createForm.jsp'"> <input
			type="button" value='읽기' onclick="read('<%=bbsno%>')"> <input
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
