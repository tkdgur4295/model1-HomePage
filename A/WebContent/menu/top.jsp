<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
%>

<html>
<head>
<style type="text/css">

li#admin{
float:right;
padding-right: 30px
}

ul#menu li {
	display: inline;
}

ul#menu li a {
	background-color: black;
	color: white;
	pading: 10px 20px;
	text-decoration: none;
	border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
	background-color: orange;
}
.toptable{
	width: 100%;
}
.toptable,.td{
	border-style: none;
}
.img{
width: 90%;
height: 50%;
}
</style>
</head>
<body>
	<!-- 상단 메뉴 -->
	<div style="background-color: #EEEEEE;">
		<table class="toptable">
			<tr>
				<td class ="td"><img class="img" src="<%=root%>/menu/images/Paris.jpg" ></td>
			</tr>

			<tr>
				<td class ="td">
					<ul id="menu">
						<li><a href="<%=root%>/index.jsp">홈</a></li>
						<%if(id==null){ %>
						<li><a href="<%=root%>/member/agreement.jsp">회원가입</a></li>
						<li><a href="<%=root%>/member/loginForm.jsp">로그인</a></li>
						
						<%}else if(id!=null && grade.equals("H")){ %>
						<li><a href="<%=root%>/member/read.jsp">나의정보</a></li>
						<li><a href="<%=root%>/member/updateForm.jsp">정보수정</a></li>
						<li><a href="<%=root%>/member/deleteForm.jsp">회원탈퇴</a></li>
						<li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
						<%}%>
						
						<li><a href="<%=root%>/bbs/list.jsp">게시판목록</a></li>
						<li><a href="<%=root%>/bbs/createForm.jsp">게시판생성</a></li>
						<li><a href="<%=root%>/team/list.jsp">팀목록</a></li>
						<li><a href="<%=root%>/team/createForm.jsp">팀생성</a></li>
						<li><a href="<%=root%>/memo/list.jsp">메모목록</a></li>
						<li><a href="<%=root%>/memo/createForm.jsp">메모생성</a></li>
						
						<%if(id!=null && grade.equals("A")){ %>
     					<li id="admin"><a href="<%=root %>/admin/list.jsp">회원목록</a></li>
						<li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
    					<%} %>
					</ul>
				</td>
			</tr>

		</table>
	</div>
	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 10px;">