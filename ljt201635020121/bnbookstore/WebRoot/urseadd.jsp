<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
<center>
<br><br><font size="5" color="42870a"><b>
添加用户信息</b></font><br><br>
<form action="<%=basePath %>user?type=add" method="post" >
<table border="1" bordercolor="42870a">
<tr>
<td><font size="2" color="42870a">权限:</font></td>
<td>
	<select size="1" name="per"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">
		<option value="1"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">普通用户</option>
	  	<option value="0"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">超级管理</option>
	</select>
</td>
</tr>
<tr>
<td><font size="2" color="42870a">用户名:</font></td>
<td><input  type="text" name="username" size="80"></input></td>
</tr>
<tr>
<td><font size="2" color="42870a">密码:</font></td>
<td><input  type="text" id="pwd1" size="80"></input></td>
</tr>
<tr>
<td><font size="2" color="42870a">确认密码:</font></td>
<td><input  type="text" name="password" id="pwd2" onblur="show();" size="80"></input></td>
</tr>
</table>
<br>
<input type="submit" value="提交"   Style="height:20px; width:50px; border:solid 1px #cadcb2; font-size:12px; color:42870a;"></input>
<input type="button"   value="重  置"  Style="height:20px; width:50px; border:solid 1px #cadcb2; font-size:12px; color:42870a;"></input>
</form>

</center>
  </body>
  <script type="text/javascript">
  	function show(){
  		if(document.getElementById("pwd1").value!=document.getElementById("pwd2").value){
  			alert("两次输入的密码不一致");
  		}
  	}
  </script>
  
</html>
