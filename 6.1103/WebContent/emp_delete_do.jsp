<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.text.*" %>
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
<%
	int empno = Integer.parseInt(request.getParameter("empno"));
%>
<%!
	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521/orcl";
	public static final String DBUSER = "system";
	public static final String DBPASSWORD = "123";
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
%>
<%
	String msg = "雇员删除失败!";
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	String sql = "DELETE FROM emp WHERE empno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, empno);
	if(pstmt.executeUpdate() > 0){
		msg = "雇员删除成功！";
	}
%>
<script language = "javascript">
	alert("<%=msg%>");
	window.location = "emp_list.jsp?<%=request.getParameter("cp")%>&ls=<%=request.getParameter("ls")%>";
</script>
</body>
</html>