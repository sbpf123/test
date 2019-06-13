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
反馈</b></font><br><br>
<form action="<%=basePath %>feedback?type=add" method="post" >
<table border="1" bordercolor="42870a">
<tr>
<td><font size="2" color="42870a">书名:</font></td>
<td>
	<select size="1" name="tite"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">
		<option value="其他"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">其他</option>
	  	
	</select>
</td>
</tr>
<tr>
<td><font size="2" color="42870a">反馈内容:</font></td>
<td><textarea rows="" cols="" name="content" style="width: 500px; height: 400px;"></textarea></td>
</tr>
</table>
<br>
<input type="submit" value="提交"   Style="height:20px; width:50px; border:solid 1px #cadcb2; font-size:12px; color:42870a;"></input>
<input type="button"   value="重  置"  Style="height:20px; width:50px; border:solid 1px #cadcb2; font-size:12px; color:42870a;"></input>
</form>

</center>
  </body>
  
</html>
