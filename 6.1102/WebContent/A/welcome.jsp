<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<center>
	<h1>登录程序</h1>
	<jsp:include page = "cookie_operate.jsp"/>
	<br>
<%
	if(session.getAttribute("id") != null){
%>
		<h2>欢迎<font color = "red"><%= session.getAttribute("id") %></font></h2>
		<h3><a href = "logout.jsp">登录注销</a></h3>
<%
	}else{
		request.setAttribute("info", "请先登录");
%>
		<jsp:forward page = "login.jsp"/>
<%
	}
%>
</center>
</body>
</html>