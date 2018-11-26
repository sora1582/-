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

	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	java.util.Date hiredate = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("hiredate"));
	double sal = Double.parseDouble(request.getParameter("sal"));
	double comm = Double.parseDouble(request.getParameter("comm"));
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
	String msg = "雇员修改失败";
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	String sql = "UPDATE emp SET ename = ?, job = ?, hiredate = ?, sal = ?, comm = ? WHERE empno = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ename);
	pstmt.setString(2, job);
	pstmt.setDate(3, new java.sql.Date(hiredate.getTime()));
	pstmt.setDouble(4, sal);
	pstmt.setDouble(5, comm);
	pstmt.setInt(5, empno);
	if(pstmt.executeUpdate() > 0){
		msg = "雇员修改成功";
	}
%>
<script type="text/javascript">
	alert("<%= msg%>");
	window.location = "emp_list.jsp?cp=<%=request.getParameter("cp")%>&ls = <%= request.getParameter("ls")%>";
</script>
</body>
</html>