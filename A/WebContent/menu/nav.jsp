<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<% 	
String id = (String)session.getAttribute("id");
String grade = (String)session.getAttribute("grade");
String fname = (String)session.getAttribute("fname");

MemberDTO dto =  dao.read(id);

%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.img{
width: 50px;
height: 50px;
}
</style>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<!-- *********************************************** -->
<body>

	<!-- *********************************************** -->
	<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidenav"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding" title="close menu">
      <i class="fa fa-remove"></i>	
    </a>
    <h4 class="w3-padding-0"><a href="<%=root%>/index.jsp"><b>HomePage</b></a></h4>
  </div>
  
  <a href="<%=root %>/memo/list.jsp" onclick="w3_close()" class="w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>Memo</a> 
  <a href="<%=root %>/bbs/list.jsp" onclick="w3_close()" class="w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>Bbs</a> 
  <a href="<%=root%>/teamimage/list.jsp" onclick="w3_close()" class="w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>Img</a>
  
  						<%if(id!=null && grade.equals("A")){ %>
     					<div class="w3-section w3-padding-top w3-large">
     					
						 <hr>

						<li class="w3-dropdown-hover">
						<a href="javascript:void(0);" title="Notifications"  onclick="w3_close()"><i class="fa fa-th-large fa-fw w3-margin-right "></i>Admin <i class="fa fa-caret-down"></i></a>
    					<div class="w3-dropdown-content w3-white w3-card-4">
      					<a href="<%=root%>/admin/list.jsp">MemberList</a>
      					<a href="<%=root %>/member/logout.jsp">logout</a>
    					</div>
    					</li>
									</div>
    					<%} %>						

     					<br><br><br><br><br><br><br><br><br>
     					

 
    					<%if(id==null){ %>
    					<div class="w3-section w3-padding-top w3-large" style="width: 100%; ">
     					
						 <hr>
						 	<a href="<%=root%>/member/loginForm.jsp" class="w3-hover-white w3-hover-text-purple w3-show-inline-block"><i class="glyphicon glyphicon-user"><b>Login</b></i></a>
							</div>
						<%} %>
						
						
						
						
						
						
						
						
					
						<div class="w3-section w3-padding-top w3-large">
						
						<%if(id!=null && grade.equals("H")){ %>
						<hr>
						
						<div class="w3-row">
						
						<div class="w3-quarter">
						
						<table style="width: 350%; text-align: center;">
						

<tr>
<td >
		<a><img src = "<%=root %>/member/storage/<%=dto.getFname()%>" style="width: 80px;height:80px;" class="w3-circle w3-hover-opacity"></a>
		<br><br>
</td>
</tr>


<tr>
<td>ID : <%=id %><td>
</tr>

<td>
		<br>
<a href="<%=root %>/member/updateForm.jsp" class="w3-hover-white w3-hover-text-purple w3-show-inline-block"><b><i class="glyphicon glyphicon-edit"></i></b></a>
<a href="<%=root %>/member/logout.jsp" class="w3-hover-white w3-hover-text-purple w3-show-inline-block"><b><i class="glyphicon glyphicon-log-in"></i></b></a>
</td>
									</table>			
						</div>
						
						</div>


			
						
						<%} %>

						
						</div>
						









</nav>

	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>