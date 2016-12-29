<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %> 
<%    
	String id = request.getParameter("id");
	String passwd= request.getParameter("passwd");
	String fname= request.getParameter("fname");
	
	boolean flag = dao.loginCheck(id,passwd);
	String grade = null;//회원등급
	if(flag){//회원인경우
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		session.setAttribute("fname", fname);
		
		
		// ---------------------------------------------- 
	    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
	    // ---------------------------------------------- 
	    Cookie cookie = null; 
	       
	    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
	       
	    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
	      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록 
	   
	      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록  
	         
	    }else{ 
	      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	         
	      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	    } 
	    // ---------------------------------------------
	}
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
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
 

 
<div class = "content">
<% if(flag){
	out.print("로그인 되었습니다.<br><br>");	%>
	    <input type="button" value='홈으로' onclick ="location.href='../index.jsp'">
<%}else{
	out.print("아이디/비밀번호가 일치하지 않습니다.<br><br>");%>
    <input type="button" value='회원가입' onclick ="location.href='agreement.jsp'">
        <input type='button' value='다시시도' onclick="history.back()">
<%} %>


</div>
  

 
 
<!-- *********************************************** -->
</div>
</body>
<!-- *********************************************** -->
</html> 