<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "reg" scope = "request" class = "demo.Register"/>
<jsp:setProperty name = "reg" property = "*"/> <!-- 为属性自动赋值 -->
<body>
<%
	if(reg.isValidate()){//进行验证
%>
		<jsp:forward page = "success.jsp"/><!-- 跳转到成功页 -->
<%
	}else{//验证失败
%>
		<jsp:forward page = "index.jsp"/><!-- 跳转到注册页 -->
<%
	}
%>
</body>
</html>