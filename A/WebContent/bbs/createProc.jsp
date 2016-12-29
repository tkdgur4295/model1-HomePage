<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />

<%
	String upDir = "bbs/storage";
	String tempDir = "/bbs/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename = null;
	if(size>0){
	filename = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setFilesize(size);
	dto.setFilename(filename);
	
	boolean flag = bdao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BbsCreate</title>
</style>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp"
		url+="?filename=<%=filename%>";
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
    <h1><b>Create</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
	<DIV class="content">
		<%
			if (flag) {
				out.print("글이 등록되었습니다.");
			} else {
				out.print("글 등록에 실패했습니다.");
			}
		%>
	</DIV>
	<div class="bottom">
		<input type="button" value="계속등록"
			onclick="location.href='createForm.jsp'"> <input
			type="button" value="목록" onclick="blist()">

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
