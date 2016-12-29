<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%    
	//검색관련
	String col = Utility.checknull(request.getParameter("col"));
	String word = Utility.checknull(request.getParameter("word"));
	if(col.equals("total")){
		word = "";
	}
	
	//페이징관련
	int nowPage = 1;
	int recordPerPage = 5;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	//DB에서 가져올 순번
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int total = dao.total(col,word);
	List<MemberDTO> list = dao.list(map);
	Iterator<MemberDTO> iter = list.iterator();
	
	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
	
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script>
function read(id) {
	var url = "<%=root%>/member/read.jsp";
	url += "?id="+id;
	url += "&nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
}
function mlist() {
	var url = "<%=root%>/admin/list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}

</script>
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
 

<div class = "search"> 
<FORM name='frm' method='POST' action='./list.jsp'>
</FORM>
<select name = "col">
<option value ="mname"
<% if(col.equals("mname")) out.print("selected='selected'"); %>
 >이름</option>

<option value ="email"
<% if(col.equals("email")) out.print("selected='selected'"); %>
>이메일</option>

<option value ="id"
<% if(col.equals("id")) out.print("selected='selected'"); %>
>아이디</option>

<option value ="total">전체출력</option>

</select>
<input type = "text" name = "word" value='<%=word %>'>
<input type = "submit" value = "검색">
<input type = "button" value = "회원가입" onclick="location.href='./createForm.jsp'">
</div>
<% 
while(iter.hasNext()) {
	MemberDTO dto = iter.next();
%>
  <TABLE>
  
    <TR>
      <TD rowspan = '5' width="30%">
      <img src ='<%=root %>/member/storage/<%=dto.getFname() %>'>
      </TD>
      <TH width="20%">아이디</TH>
      <TD width="50%"><a href = "javascript:read('<%=dto.getId()%>')"><%=dto.getId()%></a></TD>
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
      <TH>주소</TH>
      <TD>
      <%=dto.getAddress1() %>
      <%=Utility.checknull(dto.getAddress2()) %>
      
      </TD>
    </TR>

    
  </TABLE>
  <%} %>
  
  <DIV class='bottom'>
	<%=paging%>
	
  </DIV>
 
 
<!-- *********************************************** -->
</div>
</body>
<!-- *********************************************** -->
</html> 