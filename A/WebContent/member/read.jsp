<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String grade = (String)session.getAttribute("grade");

	
if(id==null){
	id = (String)session.getAttribute("id");
}
	MemberDTO dto = dao.read(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
function mlist() {
	var url = "<%=root%>/admin/list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function update() {
	var url = "updateForm.jsp";
	url += "?id=<%=id%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}
function updateFile() {
	var url = "updateFileForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href = url;
}
function updatePw() {
	var url = "updatePwForm.jsp";
	url += "?id=<%=id%>";
	location.href=url;
}
</script>
<style type="text/css">
.img{
text-align: center;
width: 400px;
height: 400px;
}

</style>
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

	<DIV class="title"><%=dto.getMname()%>의 회원정보
	</DIV>

	<TABLE>
		<tr>
		<td colspan="2">
		<img src = "./storage/<%=dto.getFname() %>">
		</td>
		</tr>
	
		<TR>
			<TH>아이디</TH>
			<TD><%=dto.getId() %></TD>
		</TR>
		
		<TR>
			<TH>이름</TH>
			<TD><%=dto.getMname() %></TD>
		</TR>
		
		<TR>
			<TH>전화번호</TH>
			<TD><%=dto.getTel() %></TD>
		</TR>
		
		<TR>
			<TH>이메일</TH>
			<TD><%=dto.getEmail() %></TD>
		</TR>
		
		<TR>
			<TH>우편번호</TH>
			<TD><%=dto.getZipcode() %></TD>
		</TR>
		
		<TR>
			<TH>주소</TH>
			<TD>
			<%=dto.getAddress1() %>
			<%=Utility.checknull(dto.getAddress2()) %>
			
			</TD>
		</TR>
		
		<TR>
			<TH>직업</TH>
			<TD>
			직업코드 : <%=dto.getJob()%>
			(<%=Utility.getCodeValue(dto.getJob()) %>)
			</TD>
		</TR>
		
		<TR>
			<TH>가입날짜</TH>
			<TD><%=dto.getMdate() %></TD>
		</TR>
		
		
	</TABLE>

	<DIV class='bottom'>
	<input type='button' value='정보수정' onclick="update()">
	<%if(id!=null && grade.equals("A")){//관리자 %>
		<input type='button' value='회원목록' onclick="mlist()">
	<%}else{ %>
	<input type='button' value='사진수정' onclick="updateFile()">
	<input type='button' value='비밀번호수정' onclick="updatePw()">
	<input type='button' value='다운로드' onclick="location.href='<%=root%>/download?dir=/member/storage&filename=<%=dto.getFname()%>'">
	<%} %> 
	</DIV>


	<!-- *********************************************** -->
</div>
</body>
<!-- *********************************************** -->
</html>
