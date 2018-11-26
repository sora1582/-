<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int currentPage = 1;//位当前所在的页，默认在第1页
	int lineSize = 3;//每次显示的记录数
	long allRecorders = 0;//表示全部的记录数
	long pageSize = 1;//表示全部的页数（尾页）
	int IsData[] = {1, 3, 5, 7, 9, 10, 15, 20, 25, 30, 50, 100};
	String keyWord = request.getParameter("kw");//接收查询关键字
	String url = request.getParameter("url");
%>
<%
	try{
		currentPage = Integer.parseInt(request.getParameter("cp"));
	}catch(Exception e){}
	try{
		lineSize = Integer.parseInt(request.getParameter("ls"));
	}catch(Exception e){}
	try{
		allRecorders = Long.parseLong(request.getParameter("allRecorders"));
	}catch(Exception e){}
	if(keyWord == null){
		keyWord = "";//如果模糊查询 没有关键字，则表示查询全部
	}
%>
<%
	pageSize = (allRecorders + lineSize - 1) / lineSize;
	if(pageSize == 0){
		pageSize = 1;
	}
%>
<script type="text/javascript">
	function go(num){
		document.getElementById("cp").value = num;
		document.spform.submit();//表单提交
	}
</script>
<form name = "spform" action = "<%=url%>" method = "post">
	输入查询关键字:<input type = "text" name = "kw" value = "<%=keyWord%>">
	<input type = "submit" value = "查询"><br>
	<input type = "button" value = "首页" onClick = "go(1)"<%= currentPage == 1?"DISABLED":""%>>
	<input type = "button" value = "上一页" onClick = "go(<%= currentPage - 1%>)" <%= currentPage == 1?"DISABLED":""%>>
	<input type = "button" value = "下一页" onClick = "go(<%= currentPage + 1%>)" <%= currentPage == pageSize?"DISABLED":"" %>>
	<input type = "button" value = "尾页" onClick = "go(<%=pageSize%>)"<%= currentPage == pageSize?"DISABLED":"" %>>
	跳转到第<select name = "selcp" onchange = "go(this.value)">
	<%
		for(int x = 1;x <= pageSize; x++){
	%>
		<option value = "<%= x %>"<%= x == currentPage?"SELECTED":""%>>
			<%= x %>
		</option>
	<%
		}
	%>
	</select>页
	每页显示
	<select name = "ls" onchange = "go(1)">
	<%
		for(int x = 0; x < IsData.length; x++){
	%>
			<option value = "<%=IsData[x] %>"<%= IsData[x] == lineSize?"SELECTED":"" %>>
				<%= IsData[x] %>
			</option>
	<%
		}
	%>
	</select>
	条
	<input type = "hidden" name = "cp" value = "1">
	
</form>
</body>
</html>