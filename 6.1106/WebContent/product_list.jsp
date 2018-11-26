<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function changeColor(obj, color){
		obj.bgColor = color;
	}
</script>
<body>
<%!
	public static final String URL = "product_list.jsp";
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
	int currentPage = 1;//当前所在页，默认1
	int lineSize = 15;//每次显示的记录数
	int allRecorders = 0;//表示全部的记录数
	String keyWord = request.getParameter("kw");//接收关键字查询
%>
<%
	try{
		currentPage = Integer.parseInt(request.getParameter("cp"));
	}catch(Exception e){}

	try{
		lineSize = Integer.parseInt(request.getParameter("ls"));
	}catch(Exception e){}
	
	if(keyWord == null){
		keyWord = "";//如果模糊查询没有关键字，则表示查询全部
	}
%>
<%
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	String sql = 	"SELECT COUNT(pid) FROM product " + 
			" WHERE name LIKE ? OR note LIKE ? OR price LIKE ? OR amount LIKE ? " ;
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%" + keyWord + "%");
	pstmt.setString(2, "%" + keyWord + "%");
	pstmt.setString(3, "%" + keyWord + "%");
	pstmt.setString(4, "%" + keyWord + "%");
	rs = pstmt.executeQuery();
	if(rs.next()){
		//取得全部的记录数
		allRecorders = rs.getInt(1);
	}
%>
<center>
	<h1>商品列表</h1>
	<jsp:include page = "split_page_plugin.jsp">
	<jsp:param name = "allRecorders" value = "<%=allRecorders %>"/>
	<jsp:param name = "url" value = "<%= URL %>"/>
	<jsp:param name = "currentPage" value = "<%= currentPage %>"/>
	<jsp:param name = "lineSize" value = "<%= lineSize %>"/>
	</jsp:include>
	<table border = "1" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2" width = "100%">
		<tr onMouseOver = "changeColor(this, 'white')" onMuseOut = "changeColor(this, 'F2F2F2')">
			<td align = "center" valign = "middle">
				<span class = "STYLE10">编号</span>
			</td>
			<td align = "center" valign = "middle">
				<span class = "STYLE10">名称</span>
			</td>
			<td align = "center" valign = "middle">
				<span class = "STYLE10">价格</span>
			</td>
			<td align = "center" valign = "middle">
				<span class = "STYLE10">数量</span>
			</td>
			<td align = "center" valign = "middle">
				<span class = "STYLE10">简介</span>
			</td>
			<td align = "center" valign = "middle">
				<span class = "STYLE10">购买</span>
			</td>
		</tr>
<%
sql = 	"SELECT * FROM (	" + 
		" SELECT pid,name,note,price,amount,ROWNUM rn " +
		" FROM product WHERE (name LIKE ? OR note LIKE ? OR price LIKE ? OR amount LIKE ? ) AND " + 
		" ROWNUM<=? ORDER BY pid) temp " + 
		" WHERE temp.rn>? " ;
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%" + keyWord + "%");
	pstmt.setString(2, "%" + keyWord + "%");
	pstmt.setString(3, "%" + keyWord + "%");
	pstmt.setString(4, "%" + keyWord + "%");
	pstmt.setInt(5, currentPage *lineSize);
	pstmt.setInt(6, (currentPage - 1) * lineSize);
	rs = pstmt.executeQuery();
%>
<%
	while(rs.next()){
		int pid = rs.getInt(1);
		String name = rs.getString(2);
		String note = rs.getString(3);
		double price = rs.getDouble(4);
		int amount = rs.getInt(5);
%>
	<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
		<td align = "center" valign = "middle">
			<span class = "STYLE6">
				<%= pid %>
			</span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6">
				<%= name %>
			</span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6">
				<%= price %>
			</span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6">
				<%= amount %>
			</span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6">
				<%= note %>
			</span>
		</td>
		<td align = "center" valign = "middle">
			<span class = "STYLE6">
				<a href = "add_car.jsp?pid=<%=pid%>" target = "_ablank">增加到购物车</a>
			</span>
		</td>
	</tr>
<%
	}
%>
	</table>
<%
	conn.close();
%>
</center>
</body>
</html>