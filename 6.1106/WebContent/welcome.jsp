<%@ page contentType="text/html" pageEncoding="GBK"%>
<html>
<head><title>www.mldnjava.cn��MLDN�߶�Java��ѵ</title></head>
<body>
<%	// ������
	request.setCharacterEncoding("GBK") ;
%>
<center>
	<h1>��½����</h1>
	<br>
	<%
		if(session.getAttribute("id") != null){
	%>
			<h2>��ӭ<font color="RED"><%=session.getAttribute("id")%></font>���٣�</h2>
			<h3><a href="product_list.jsp">������Ʒ�б�</a></h3>
			<h3><a href="logout.jsp">��½ע��</a></h3>
	<%			
		} else {
			request.setAttribute("info","���ȵ�½��") ;
	%>
			<jsp:forward page="login.jsp"/>
	<%
		}
	%>
</center>
</body>
</html>