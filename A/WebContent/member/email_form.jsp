<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title">이메일 중복확인</DIV>

	<div class="content">
		<FORM name='frm' method='POST' action='./email_proc.jsp'>
			이메일을 입력해주세요.<br> <br>
			<TABLE>
				<TR>
					<TH>이메일</TH>
					<TD><input type="text" name="email" size="20"></TD>
					<td><input type='submit' value='중복확인'></td>
				</TR>
			</TABLE>

			<DIV class='bottom'>
				<input type='button' value='취소' onclick="window.close()">
			</DIV>
		</FORM>
	</div>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
