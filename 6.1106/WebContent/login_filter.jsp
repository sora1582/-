<%@ page contentType="text/html" pageEncoding="GBK"%>
<%
	if(session.getAttribute("id") == null){	// 现在没有登陆
		request.setAttribute("info","请先登陆！") ;
%>
		<jsp:forward page="login.jsp"/>
<%
	}
%>