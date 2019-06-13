<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

User user=(User)session.getAttribute("user");
if(user==null){
	user=new User();
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>图书管理系统</title>
<link href="css/edu.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>

<body>
<jsp:include page="top.jsp"/>
<jsp:include page="left.jsp"/>
<div class="demo">
	<br><br><br><br><br><br>
	<center>
	              <form method="post" action="<%=basePath %>user?type=update" >
	                       
	                          <input type="hidden" name="username" value="<%=user.getUsername() %>" >
	                          <input type="hidden" name="id" value="<%=user.getId() %>" >
	                          <input type="hidden" name="per" value="<%=user.getPer() %>" >
	                        <TABLE cellSpacing=0 cellPadding=5 width=400 border=1 bordercolor="42870a" class="black_text">
	                          <TBODY>
	                          <TR>
	                            <TD width=100 align="left"><FONT 
	                              color=42870a>用户名:</FONT></TD>
	                            <TD align="left" width="100"><%=user.getUsername() %></TD>
	                          </TR>
	                          <TR>
	                            <TD ><FONT color=42870a>密码:</FONT></TD>
	                            <TD align="left"> <input style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;" size=17  type="text" name="password" value="<%=user.getPassword()%>">
								</TD>
							</TR>
	                         
	                          </TBODY></TABLE>
	                        <TABLE cellSpacing=0 cellPadding=0 width=430 border=0>
	                          <TBODY>
	                          <TR height=30>
	                            <TD height="50" class="green_btn_small">
	                            <input type="submit" value="修  改 " style="height:20px; width:50px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"/> 
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <input type="reset" value=" 重  置 " style="height:20px; width:50px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"/>
	                            </TD>
	                          </TR>
	 					</table>
				</form>
	</center>
</div>

</body>
</html>

