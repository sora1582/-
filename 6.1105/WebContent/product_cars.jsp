<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
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
	Map<Integer, Integer> cars = (Map<Integer, Integer>)session.getAttribute("allpid");
	if(cars != null){
		Set<Integer> key = cars.keySet();//取得全部的Key
%>
<%
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	StringBuffer sql = new StringBuffer();//循环修改内容的时候使用StringBuffer
%>
<center>
	<h1>商品列表</h1>
	<form action = "update_car.jsp" method = "post">
		<table border = "1" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2" width = "100%">
			<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
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
					<span class = "STYLE10">数量</span>
				</td>
				
			</tr>
			<%
				sql.append("SELECT pid, name, note, price, amount FROM product WHERE pid IN (");
				int count = 0;
				Iterator<Integer> iter = key.iterator();
				while(iter.hasNext()){
					count++;
					sql.append(iter.next());
					if(count <= key.size() - 1){
						sql.append(",");
					}
				}
				sql.append(")");
				pstmt = conn.prepareStatement(sql.toString());
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
						<input type = "text" name = "<%=pid%>" value = "<%=cars.get(pid)%>" size = "3" maxlength = "3">
					</span>
				</td>
			</tr>
			
			
			<%
				}			
			%>
			<%
				if(count == 0){
			%>
				<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
					<td align = "center" valign = "middle" colspan = "6">
						<span class = "STYLE6">暂时没有购买任何商品</span>
					</td>
				</tr>
			<%
				}else{
			%>
				
				<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
					<td align = "center" valign = "middle" colspan = "6">
						<span class = "STYLE6">
							<input type = "submit" value = "修改数量">
						</span>
					</td>
				</tr>
			<%
				}
			%>
		</table>
	</form>
	<%
		conn.close();
	}else{
	%>
	<table border = "1" cellpadding = "5" cellspacing = "0" bgcolor = "F2F2F2" width = "100%">
		<tr onMouseOver = "changeColor(this, 'white')" onMouseOut = "changeColor(this, 'F2F2F2')">
			<td align = "center" valign = "middle" colspan = "6">
				<span class = "STYLE6">
					暂时没有购买任何商品
				</span>
			</td>
		</tr>
	</table>
	<%
	}
	%>
</center>
</body>
</html>