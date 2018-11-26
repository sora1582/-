<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="login_filter.jsp"/>
<%
	request.setCharacterEncoding("GBK") ;
%>
<%!
	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver" ;
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:orcl" ;
	public static final String DBUSER = "system" ;
	public static final String DBPASSWORD = "123" ;
%>
<%
	Connection conn = null ;
	PreparedStatement pstmt = null ;
%>
<%
	String msg = "用户信息更新失败！" ;
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	String sql = "UPDATE member SET name=?,address=?,telephone=?,zipcode=? WHERE mid=?" ;
	pstmt = conn.prepareStatement(sql) ;
	pstmt.setString(1,request.getParameter("name")) ;
	pstmt.setString(2,request.getParameter("address")) ;
	pstmt.setString(3,request.getParameter("telephone")) ;
	pstmt.setString(4,request.getParameter("zipcode")) ;
	pstmt.setString(5,(String)session.getAttribute("id")) ;
	if(pstmt.executeUpdate() > 0){
		msg = "用户信息更新成功！" ;
	}
%>
<%
	conn.close() ;
%>
<script language="javascript">
	alert("<%=msg%>") ;
	window.location = "product_order_list.jsp" ;
</script>
</body>
</html>