<%@page import="oracle.net.aso.b"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
int no = Integer.parseInt(request.getParameter("no"));
String passwd= request.getParameter("passwd");
String oldfile=request.getParameter("filename");
String updir=application.getRealPath("/teamimage/storage");

	String col =request.getParameter("col");
	String word =request.getParameter("word");
	String nowPage =request.getParameter("nowPage");
	
	Map map= new HashMap();
	map.put("no",no);
	map.put("passwd",passwd);
	
	boolean pflag=idao.passwd(map);
	boolean flag= false;
	
	if(pflag){
		flag=idao.delete(no);
	UploadSave.deleteFile(updir, oldfile);
	
}


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
 function b() {
		var url="list.jsp";
		
		url+="?col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href=url;
		
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
    <h1><b>Delete</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
 
<div class="content">
<%if(pflag==false){ 
out.print("비밀번호가 같지 않습니다");
%>  <DIV class='bottom'>
   <input type="button" value='다시시도' onclick="history.back()">
 
    <input type='button' value='목록' onclick="b()">
  </DIV> 


<%}else if(flag){ 
   out.print("삭제 성공하였습니다");
%>
  <DIV class='bottom'>
      <input type='button' value='목록' onclick="b()">
  </DIV>
 
 

<%}else{ 
  out.print("삭제 실패하였습니다");%>
    <DIV class='bottom'>
     
 
     <input type="button" value='다시시도' onclick="history.back()">
 
    <input type='button' value='목록' onclick="b()">
  </DIV>

<%} %>
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
<!-- *********************************************** -->

</body>

<!-- *********************************************** -->
 
</html> 
 