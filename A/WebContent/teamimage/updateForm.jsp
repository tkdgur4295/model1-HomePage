<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<% 
	
	int no = Integer.parseInt(request.getParameter("no"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	
	ImageDTO dto = idao.read(no);

%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Update</title> 
<style type="text/css"> 

</style> 


<script type="text/javascript">




function checkInput(f){
	
	if(f.name.value==""){
		alert("이름을 입력해주세요");
		f.name.focus();
		return false;
		
	}
	
	if(f.title.value==""){
		alert("제목을 입력해주세요");
		f.title.focus();
		return false;
		
	}
	
	if(f.content.value==""){
		alert("내용을 입력해주세요");
		f.content.focus();
		return false;
		
	}
	
	if(f.passwd.value==""){
		alert("비밀번호을 입력해주세요");
		f.passwd.focus();
		return false;
		
	}
	if(f.filename.value==""){
		alert("파일을 등록해주세요");
		f.filename.focus();
		return false;
		
	}
}


</script>


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
    <h1><b>Update</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
 
<FORM name='frm' method='POST' action='./updateProc.jsp' enctype="multipart/form-data" onsubmit="return checkInput(this)">

<input type= "hidden" name="col" value =<%=col %>>
<input type= "hidden" name="word" value =<%=word %>>
<input type= "hidden" name="nowPage" value =<%=nowPage %>>
<input type= "hidden" name="no" value =<%=no %>>
<input type= "hidden" name="oldfile" value =<%=dto.getFilename() %>>


  <TABLE>
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="name" value="<%=dto.getName()%>"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea name="content"><%=dto.getContent()%></textarea></TD>
    </TR>
    
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" value=""></TD>
    </TR>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
  
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div>
 
<!-- *********************************************** -->
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
