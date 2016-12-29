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
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

<script type="text/javascript">




function checkInput(f){
	
	if(f.filename.value==""){
		alert("파일을 변경되지 않았습니다. 변경해주세요");
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
    <h1><b>Bbs</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype="multipart/form-data" onsubmit="return checkInput(this)">
 		 <input type= "hidden" name="col" value =<%=col %>>
		<input type= "hidden" name="word" value =<%=word %>>
		<input type= "hidden" name="nowPage" value =<%=nowPage %>>
		<input type= "hidden" name="no" value =<%=no %>>
		<input type= "hidden" name="oldfile" value =<%=dto.getFilename() %>>
  <TABLE>
  
    <TR>
      <TH>변경전 파일</TH>
      <TD><img src="./storage/<%=dto.getFilename()%>" ></TD>
    </TR>
  
  
    <TR>
      <TH>변경 파일</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
  
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</div>
</body>
<!-- *********************************************** -->
</html> 
