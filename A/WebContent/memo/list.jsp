<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="/ssi/ssi.jsp"%>

<%
	String col = Utility.checknull(request.getParameter("col"));
	String word = Utility.checknull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}
	
	int nowPage = 1;//현재페이지
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;//한페이지당 보여줄 레코드 갯수
	
	int sno = ((nowPage - 1)* recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<MemoDTO> list = mdao.list(map);
	int total = mdao.total(col,word);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
/* * { */
/* 	font-family: gulim; */
/* 	font-size: 20px; */
/* } */

/* div { */
/* 	text-align: center; */
/* 	margin-top: 20px; */
/* } */

/* table { */
/* 	width: "60%"; */
/* 	margin: 0 auto; */
/* } */

/* table, th, td { */
/* 	border: 1px solid black; */
/* 	border-collapse: collapse; */
/* } */

/* th, td { */
/* 	padding: 10px; */
/* } */

a:LINK {
	color: #000000;
	text-decoration: none;
}

a:VISITED {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: #ff0000;
	text-decoration: none;
}

a:ACTIVE {
	color: #000000;
	text-decoration: none;
}

.search {
	width: 80%;
	text-align: center;
	margin: 10px auto;
}
</style>
<script type="text/javascript">
	function read(memono) {
		var url = "read.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/menu/nav.jsp"/>

<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Memo</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>

  
	<div class="container">
		<form method="post" action="./list.jsp">
			<select name="col">
				<!-- 검색할 컬럼 -->

				<option value="title"
					<%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>
				<option value="content"
					<%if (col.equals("content"))
				out.print("selected='selected'");%>>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<!-- 검색어 -->
			<input type="submit" value="검색"> <input type='button'
				value='등록' onclick="location.href='./createForm.jsp'">

		</form>

	
	
<h2><span class="glyphicon glyphicon-list-alt">메모목록</span></h2>
	<table class="table table-hover">
		<tr>
			<th>#</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="4" style="text-align: center;">등록된 메모가 없습니다</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					MemoDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getMemono()%></td>
			<td><a href="javascript:read('<%=dto.getMemono()%>')"><%=dto.getTitle()%></a></td>
			<td><%=dto.getWdate()%></td>
			<td><%=dto.getViewcnt()%></td>

		</tr>
		<%
			}
			}
		%>
	</table>
	</div>
	<div>
	<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
	</div>
	

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
</body>
</html>