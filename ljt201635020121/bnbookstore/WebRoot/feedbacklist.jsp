<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

feedbackServlet ss=new feedbackServlet();
ss.doPost(request, response);
List<Feedback> listfeedback=(List)session.getAttribute("listfeedback");

User user=(User)session.getAttribute("user");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书管理系统</title>
<style type="text/css">
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
<link rel="stylesheet" type="text/css" href="css/all.css" />
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
	        <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">查看所有反馈</span></td>
	        <td width="281" background="images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
	          <tr>
	                    <td class="STYLE1"><div align="center"></div></td>
	                    <td class="STYLE1"><div align="center"></div></td>
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
	            <td width="1%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
	            <td width="3%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">反馈时间</div></td>
	            <td width="3%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">反馈人</div></td>
	            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">反馈问题</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">反馈内容</div></td>
	          </tr>
	         
	        <%
	       	if(listfeedback.size()>0){
	       		for(int i=0;i<listfeedback.size();i++){
	       			%>
	       			 <tr>
			            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><%=i+1 %> </div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listfeedback.get(i).getTime() %></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listfeedback.get(i).getUsername() %></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listfeedback.get(i).getTite() %></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listfeedback.get(i).getContent() %></div></td>
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
