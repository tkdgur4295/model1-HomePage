<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	int no=Integer.parseInt(request.getParameter("no"));
	String col=request.getParameter("col");
	String word=request.getParameter("word");
	String nowPage=request.getParameter("nowPage");
	String filename=request.getParameter("filename");
	 boolean flag= idao.checkRefno(no);
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
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function a(f) {
	if(f.passwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	
}
function b() {
	var url="list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	location.href=url;
	
			}

</script>
 
 
 
</head> 
 

<!-- *********************************************** -->

<body>

<!-- *********************************************** -->
 
 
 
<jsp:include page="/menu/nav.jsp" flush="false" />
<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Delete</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
  
 <div class="content">삭제 하실려면 비밀번호를 입력해 주세요
 <%if(flag){
out.print("답변이 있는 글이므로 삭제 할 수 없습니다.<br>");
out.print("<input type ='button' value='다시시도' onclick='history.go(-2)'>");%>
 <%}else{ %>
<FORM name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return a(this)">
 <input type="hidden" name="no" value="<%=no %>">
 <input type="hidden" name="col" value="<%=col %>">
 <input type="hidden" name="word" value="<%=word %>">
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type="hidden" name="filename" value="<%=filename %>">
   <TABLE>
  
    <TR>
 
      <TH>비밀번호</TH>
 
      <TD><input type="password" name="passwd" placeholder="비밀번호 입력"></TD>
      
 
    </TR>
 
  </TABLE>
 
  
 
  <DIV class='bottom'>

    <input type='submit' value='삭제'>
    <input type="button" value='목록' onclick="b()">

 
  </DIV>
  <%} %>
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
 
</div>

<!-- *********************************************** -->

</body>

<!-- *********************************************** -->
 
</html> 
 