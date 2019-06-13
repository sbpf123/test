<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

userServlet ss=new userServlet();
ss.doPost(request, response);
List<User> listuser=(List)session.getAttribute("listuser");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书管理系统</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size: 12px;
	color: #1F4A65;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}
</style>
<link rel="stylesheet" type="text/css" href="css/all.css">
</head>

<body>
<jsp:include page="top.jsp"/>
<jsp:include page="left.jsp"/>

<div class="demo">
	
	<br><br>
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
	        <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">查看所有用户</span></td>
	        <td width="281" background="images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
	          <tr>
	                    <td class="STYLE1"><div align="center"></div></td>
	                    <td class="STYLE1"><div align="center"><a href="urseadd.jsp">添加</a></div></td>
	                  </tr>
	        </table></td>
	        <td width="14"><img src="images/tab_07.gif" width="14" height="30" /></td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="9" background="images/tab_12.gif">&nbsp;</td>
	        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
	          <tr>
	            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
	            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">用户名</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">密码</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">权限</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">操作</div></td>
	            
	          </tr>
	     
	          <tr>
	        </tr>
	        <%
	       	if(listuser.size()>0){
	       		for(int i=0;i<listuser.size();i++){
	       			%>
	       			
	       			 <tr><form action="<%=basePath %>user?type=update" method="post">
			            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><%=i+1 %><input type="hidden" name="id" value="<%=listuser.get(i).getId()%>" ><input type="hidden" name="per" value="<%=listuser.get(i).getPer()%>" > </div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input  name="username" type="text" value="<%=listuser.get(i).getUsername() %>"> </div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input  name="password" type="text" value="<%=listuser.get(i).getPassword() %>"></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2">
				            <div align="center" class="STYLE2 STYLE1">
					            <input  type="hidden" value="<%=listuser.get(i).getPer() %>">
					            <%
					            if(listuser.get(i).getPer().equals("0")){
					            	%>
					            	管理员
					            	<%
					            }
								if(listuser.get(i).getPer().equals("1")){
									%>
									客户
					            	<%			            	
								}
								if(listuser.get(i).getPer().equals("2")){
									%>
									超级会员
					            	<%
								}
					            %> 
				            </div>
				        </td>
			          	<td height="18" bgcolor="#FFFFFF">
				          	<div align="center"><span class="STYLE1"></span>
				          	<a><input type="submit" value="修改" style="height:23px; width:40px; border:solid 1px #99cccc; font-size:12px; color:42870a;"></a>
				          	<a href=<%=basePath %>user?type=del&id=<%=listuser.get(i).getId()%>  onclick="return (confirm('你确定要删除么？'))"  >删除</a>
				          	<span class="STYLE1"></span>
				          	</div>
			          	</td> </form>
			          </tr>
	       			<%
	       		}
	       	}
		   %>
	        </table></td>
	        <td width="9" background="images/tab_16.gif">&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
	  <tr>
	    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="15" height="29"><img src="images/tab_20.gif" width="15" height="29" /></td>
	        <td background="images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1"></span></td>
	            
	          </tr>
	        </table></td>
	        <td width="14"><img src="images/tab_22.gif" width="14" height="29" /></td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
</div>
</body>
</html>
