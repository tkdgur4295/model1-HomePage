<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%    

	String col = Utility.checknull(request.getParameter("col"));
	String word = Utility.checknull(request.getParameter("word"));
	if(col.equals("total")){
		word="";
	}
	
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	int recordPerPage = 5;
	
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int totalRecord = idao.total(col, word);
	List<ImageDTO> list = idao.list(map);
	Iterator<ImageDTO> iter = list.iterator();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Img</title> 

<script type="text/javascript">
function read(no){
	var url = "read.jsp";
	url += "?no="+no;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function down(filename){
	var url ="<%=root%>/download";
	url += "?dir=/image/storage";
	url += "&filename="+filename;
	location.href = url;
}

</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 	<jsp:include page="/menu/nav.jsp" flush="false" />
<div class="w3-main" style="margin-left:300px">

<header class="w3-container" id="portfolio">
    <a href="#"><img src="<%=root %>/bigben.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>Img</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16">
    </div>
  </header>
 
<div class="container">
<FORM name='frm' method='POST' action='./list.jsp'>
	<select name="col">
		<option value="name"
		<%if(col.equals("name")) out.print("selected='selected'"); %>
		>이름</option>
		<option value="title"
		<%if(col.equals("title")) out.print("selected='selected'"); %>
		>제목</option>
		<option value="total">전체출력</option>
	</select>
	<input type="text" name="word" value="<%=word%>">
	<input type="submit" value="검색">
	  	<input type="button" value="등록" onclick="location.href='createForm.jsp'">
</FORM>

<h2><span class="glyphicon glyphicon-list-alt">이미지갤러리</span></h2>
<table class="table table-hover">
    <TR>
      <TH>#</TH>
      <TH>이름</TH>
      <TH>제목</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>파일</TH>
      
    </TR>
    <%if(list.size()==0) {%>
    <tr>
    	<td colspan='6' style="text-align: center;">등록된 글이 없습니다.</td>
    </tr>
    <%}else{ %>
    	<%while(iter.hasNext()) {
    	ImageDTO dto = iter.next();%>
	    <tr>
	    	<td><%=dto.getNo() %></td>
	    	<td><%=dto.getName() %></td>
	    	<td><%
	for(int i=0;i<dto.getIno();i++){
		out.print("&nbsp;&nbsp;");
	}
	if(dto.getIno()>0){%>  
	<img src="./jpg/1.jpg"; width="30px"; height="30px"> 
	<%} %>
    	<a href="javascript:read('<%=dto.getNo() %>')">
    	<%=dto.getTitle() %>
    	</a>
    	<%if(Utility.compareDay(dto.getWdate())){%>
    	<img src="./jpg/new1.gif">
    	<%} %></td>
	    	<td><%=dto.getViewcnt() %></td>
	    	<td><%=dto.getWdate() %></td>
	    	<td><% if(dto.getFilename()==null){ 
    			out.print("-");
    	}else{%>
    		<a href="javascript:down('<%=dto.getFilename() %>')">
    		<span class='glyphicon glyphicon-download-alt'></span>
    		</a>
    	<%}
    	%></td>
	    </tr>
    <%} 
    }%>
  </TABLE>
  
  <DIV class='bottom'>

    <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>

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