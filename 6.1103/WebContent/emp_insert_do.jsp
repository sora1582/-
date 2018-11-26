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
	int empno = Integer.parseInt(request.getParameter("empno")) ;	
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
	String msg = "雇员增加失败！";
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	String sql = "INSERT INTO emp (empno,ename,job,hiredate,sal,comm) VALUES (?,?,?,?,?,?) " ;
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, empno);
	pstmt.setString(2, ename);
	pstmt.setString(3, job);
	pstmt.setDate(4, new java.sql.Date(hiredate.getTime()));
	pstmt.setDouble(5, sal);
	pstmt.setDouble(6, comm);
	if(pstmt.executeUpdate() > 0){
		msg = "雇员增加成功！";
	}
%>
<script language = "javascript">
	alert("<%=msg%>");
	window.location = "emp_list.jsp?cp = <%=request.getParameter("cp")%>&ls=<%= request.getParameter("ls")%>";
</script>
</body>
</html>