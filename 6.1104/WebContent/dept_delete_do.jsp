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
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	int deptno = Integer.parseInt(request.getParameter("deptno"));
%>
<%!
	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver" ; 
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521/orcl" ; 
	public static final String DBUSER = "system" ; 
	public static final String DBPASSWORD = "123" ; 
%>
<%
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
%>
<%
	String msg = "部门删除失败";
	String sql = "DELETE FROM dept WHERE deptno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	if(pstmt.executeUpdate() > 0){
		msg = "部门删除成功";
	}
%>
<%
	conn.close();
%>
<script type="text/javascript">
	alert("<%= msg%>");
	window.location = "dept_list.jsp";
</script>
</body>
</html>