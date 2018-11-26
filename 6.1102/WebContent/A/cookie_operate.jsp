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
<%
	if(session.getAttribute("id") == null){//用户还没登录过
%>
<%!
	public static final String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1528/orcl";
	public static final String DBUSER = "system";
	public static final String DBPASSWORD = "123";
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	String mid = null;
	String password = null;
	Cookie c[] = request.getCookies();
	if(c != null){
		for(int x = 0; x < c.length; x++){
			if("mid".equals(c[x].getName())){
				mid = c[x].getValue();
			}
			if("password".equals(c[x].getName())){
				password = c[x].getValue();
			}
		}
	
	String sql = "SELECT name FROM menber WHERE mid = ? AND password = ?";
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
		//如果用户登录成功了，则进行保存Coolie的操作
		session.setAttribute("id", mid);//保存mid
		flag = true;
	}
	conn.close();//关闭数据库连接
		

%>
<%
	}
	}
	
%>
</center>
</body>
</html>