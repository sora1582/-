<%@ page contentType="text/html" pageEncoding="GBK"%>
<%
	if(session.getAttribute("id") == null){	// ����û�е�½
		request.setAttribute("info","���ȵ�½��") ;
%>
		<jsp:forward page="login.jsp"/>
<%
	}
%>