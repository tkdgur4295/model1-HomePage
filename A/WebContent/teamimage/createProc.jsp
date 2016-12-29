<%@include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="image.ImageDTO"></jsp:useBean>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String upDir = application.getRealPath("/teamimage/storage");
	String tempDir = application.getRealPath("/teamimage/temp");

	UploadSave upload = new UploadSave(request,-1,-1,tempDir);

	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setFilename(UploadSave.encode(upload.getParameter("filename")));
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int) fileItem.getSize();
	String filename = null;
	if (size > 0) {
		filename = UploadSave.saveFile(fileItem, upDir);

	} else {
		filename = "image.jpg";
	}

	dto.setFilename(filename);

	boolean flag = idao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImgCreate</title>
<script type="text/javascript">
function ilist() {
	var url = "list.jsp"
	
	location.href = url;
	
}

</script>
<style type="text/css">

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

		<jsp:include page="/menu/nav.jsp" flush="false" />
<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Create</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>

	<FORM name='frm' method='POST' action='./.do'>
	
	<div class=content>	<%
			if (flag) {
				out.print("작성 성공!");
		%>
		<%
			} else {
				out.print("작성 실패!");
			}
		%>
</div>

		<DIV class='bottom'>
			<input type="button" value='계속등록' onclick="location.href='createForm.jsp'" > 
			<input type='button' value='목록' onclick="ilist()">
		</DIV>
	</FORM>
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
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
