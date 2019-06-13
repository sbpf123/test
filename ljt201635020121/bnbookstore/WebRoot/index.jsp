<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理系统</title>
    
	<link rel="stylesheet" type="text/css" href="css/all.css">
  </head>
  
  <body >
  	<jsp:include page="top.jsp"/>
    <jsp:include page="left.jsp"/>
    <div class="demo">
    <center>欢迎光临图书管理系统！</center>
    </div>
  </body>
</html>
