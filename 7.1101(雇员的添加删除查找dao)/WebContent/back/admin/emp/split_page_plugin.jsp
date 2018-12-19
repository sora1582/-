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
	/* 定义一些变量还有接收参数的变量 */
	int currentPage = 1;//当前所在页
	int lineSize = 3;//每次显示的记录数
	long allRecorders = 0;//全部的记录数
	long pageSize = 1;//全部的页数
	int lsData[] = {1, 3, 5, 7, 9, 10, 15, 20, 25, 30, 50, 100};
	String keyWord = request.getParameter("kw");//接收关键字
	String url = request.getParameter("url");
%>
<%
	/* 刚刚定义的变量也取参数，也许会有异常，放到try里面 */
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
		keyWord = "";//没有关键字就表示查询全部
	}
%>
<%
	/* 取得全部页数 */
	pageSize = (allRecorders + lineSize - 1) / lineSize;
	if(pageSize == 0){
		pageSize = 1;
	}
%>
<script language = "javascript">
	function go(num){
		document.getElementById("cp").value = num;
		document.spform.submit();//表单提交
	}
</script>
<form name ="spform" action="<%=url%>" method = "post">
	输入查询关键字:<input type = "text" name = "kw" value = "<%=keyWord%>">
	<input type = "submit" value = "查询"><br>
	<input type = "button" value = "首页" onclick = "go(1)" <%= currentPage == 1 ? "DISABLE":"" %>>
	<input type = "button" value = "上一页" onclick = "go(<%=currentPage - 1%>)" <%= currentPage == 1 ? "DISABLE" : "" %>>
	<input type = "button" value = "下一页" onclick = "go(<%=currentPage + 1%>)" <%= currentPage == pageSize ? "DISABLE" : "" %>>
	<input type = "button" value = "尾页" onclick = "go(<%=pageSize%>)" <%= currentPage == pageSize ? "DISABLE" : ""%>>
	跳转到第<select name = "selcp" onchange = "go(this.value)">
	<%
		for(int x = 1; x <= pageSize; x++){
	%>
			<option value = "<%=x%>" <%= x == currentPage ? "SELECTED" : "" %>><%= x %></option>
	<%
		}
	%>
	</select>页
	每页显示<select name = "ls" onchange = "go(1)">
	<%
		for(int x = 0; x < lsData.length; x++){
	%>
			<option value = "<%=lsData[x]%>" <%= lsData[x] == lineSize ? "SELECTED" : ""%>><%= lsData[x] %></option>
	<%
		}
	%>
	</select>条
	<input type = "hidden" name = "cp" value = "1">
</form>
</body>
</html>