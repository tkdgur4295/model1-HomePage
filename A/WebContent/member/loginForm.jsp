<%@ page contentType="text/html; charset=UTF-8" %> 
<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
      
      /*----쿠키설정 내용시작----------------------------*/
      String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
      String c_id_val = ""; // ID 값
       
      Cookie[] cookies = request.getCookies(); 
      Cookie cookie=null; 
       
      if (cookies != null){ 
       for (int i = 0; i < cookies.length; i++) { 
         cookie = cookies[i]; 
       
         if (cookie.getName().equals("c_id")){ 
           c_id = cookie.getValue();     // Y 
         }else if(cookie.getName().equals("c_id_val")){ 
           c_id_val = cookie.getValue(); // user1... 
         } 
       } 
      } 

      /*----쿠키설정 내용 끝----------------------------*/
      
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
 
 
<FORM name='frm' method='POST' action='<%=root %>/member/loginProc.jsp'>
  <TABLE>
  
    <TR>
      <TH>아이디</TH>
      <TD>
      <input type = "text" name="id" value='<%=c_id_val %>'>
      <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>   
         <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
       <% 
       }else{ %> 
         <input type='checkbox' name='c_id' value='Y' > ID 저장 
       <% 
       } 
       %> 
      </TD>
    </TR>
    
    <TR>
      <TH>비밀번호</TH>
      <TD><input type = "password" name = "passwd"></TD>
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' onclick="location.href='agreement.jsp'">
  </DIV>
</FORM>
 
 
</div>
</body>
<!-- *********************************************** -->
</html> 