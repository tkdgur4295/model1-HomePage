<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="member.MemberDTO" />
<%
	String upDir = "/member/storage";
	String tempDir = "/member/temp";

	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = (UploadSave)request.getAttribute("upload");
	
	//form의 값을 받는다.
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setEmail(upload.getParameter("email"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setJob(upload.getParameter("job"));
	
	//form의 선택한 파일 받기
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	String fname = null;
	if(size>0){
		fname = UploadSave.saveFile(fileItem, upDir);
	}else{
		fname = "member.jpg";
	}
	dto.setFname(fname);
	boolean flag = dao.create(dto);
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/nav.jsp"/>

<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Agreement</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
	<!-- *********************************************** -->



	

	<DIV class='content'>
<%if(flag){ %>
	<%="아이디를 생성했습니다." %><br><br>
	<input type='submit' value='로그인' onclick = "location.href='loginForm.jsp'"> <input type='button' value='홈'
		onclick="location.href='../index.jsp'">
<%}else{ %>
	<%="아이디 생성에 실패했습니다." %><br><br>
	<input type='submit' value='다시시도' onclick = "history.back"> <input type='button' value='홈'
		onclick="location.href='../index.jsp'">
<%} %>
</DIV>



	<!-- *********************************************** -->
</div>
</body>
<!-- *********************************************** -->
</html>
