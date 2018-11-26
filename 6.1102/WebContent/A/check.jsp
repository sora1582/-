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
<center>
<%
	//乱码解决
	request.setCharacterEncoding("utf-8");
%>
	<h1>登录程序</h1>
	<hr>
<%
	String rand = (String) session.getAttribute("rand");//从session中取出验证码
	String code = request.getParameter("code");
	if(!rand.equalsIgnoreCase(code)){
		request.setAttribute("info", "请输入正确的验证码！");
	
%>
	<jsp:forward page = "login.jsp"/>
<%
	}
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
	ResultSet rs = null;
%>

<%
	String mid = request.getParameter("mid");
	String password = request.getParameter("password");
	String sql = "SELECT name FROM member WHERE mid = ? AND password = ?";
%>

<%
	boolean flag = false;
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, mid);
	pstmt.setString(2, password);
	rs = pstmt.executeQuery();//进行查询
	if(rs.next()){//现在可以查找到内容
		//如果用户登录成功了，则进行保存Cookie的操作
		session.setAttribute("id", mid);//保存mid
		Cookie c1 = new Cookie("mid", mid);
		Cookie c2 = new Cookie("password", password);
		int saveTime = Integer.parseInt(request.getParameter("savetime"));
		
		c1.setMaxAge(saveTime);
		c2.setMaxAge(saveTime);
		response.addCookie(c1);
		response.addCookie(c2);
		flag = true;
	}
	conn.close();//关闭数据库
%>

<%
	if(flag){//现在已经登录成功
%>
		<jsp:forward page = "welcome.jsp"/>
<%
	}else{
		request.setAttribute("info", "错误的用户名和密码");
%>	
		<jsp:forward page = "login.jsp"/>
<%
	}
%>
</center>
</body>
</html>