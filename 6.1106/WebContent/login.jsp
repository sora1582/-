<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<%
	request.setCharacterEncoding("GBK");
%>
<h1>登陆程序</h1>
<hr>
<%=request.getAttribute("info") != null ? request.getAttribute("info"):"" %>
<form action = "check.jsp" method = "post">
	用户ID:<input type = "text" name = "mid"><br>
	密&nbsp;码:<input type = "password" name = "password"><br>
	验证码:<input type = "text" name = "code" maxlength = "4" size = "4"><img src = "image.jsp"><br>
	<input type = "submit" value = "登录">
	<input type = "reset" value = "重置">	
</form>
</center>
</body>
</html>