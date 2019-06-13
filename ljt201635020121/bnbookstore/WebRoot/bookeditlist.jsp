<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

bookServlet ss=new bookServlet();
ss.doPost(request, response);
List<Book> listbook=(List)session.getAttribute("listbook");

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
<link rel="stylesheet" type="text/css" href="css/all.css">
<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<jsp:include page="top.jsp"/>
<jsp:include page="left.jsp"/>

<div class="demo">
	
	<br><br>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
	        <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">查看所有用户</span></td>
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
	            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
	            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">条形码</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">书名</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">作者</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">购入价格</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">购出价格</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">出版年份</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">数量/箱</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">操作</div></td>
	          </tr>
	          <form action="<%=basePath %>book?type=add" method="post">
       			 <tr>
		            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1">*</div></td>
		            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="isbn" type="text" value=""></div></td>
		            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="name" type="text" value=""></div></td>
		            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="author" type="text" value=""></div></td>
		            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="pricep" type="text" value=""></div></td>
		            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="prices" type="text" value=""></div></td>
		            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="publish" type="text" value="" onClick="WdatePicker()"></div></td>
		            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="number" type="text" value=""></div></td>
		          	<td height="18" bgcolor="#FFFFFF">
			          	<div align="center"><span class="STYLE1"></span>
			          	<a><input type="submit" value="添加" style="height:23px; width:40px; border:solid 1px #99cccc; font-size:12px; color:42870a;"></a>
			          	<span class="STYLE1"></span>
			          	</div>
		          	</td> 
		          </tr>
			  </form>
	        <%
	       	if(listbook.size()>0){
	       		for(int i=0;i<listbook.size();i++){
	       			%>
	       			 <form action="<%=basePath %>book?type=update" method="post">
	       			 <tr>
			            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><%=i+1 %><input type="hidden" name="id" value="<%=listbook.get(i).getId()%>" > </div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="isbn" type="text" value="<%=listbook.get(i).getIsbn() %>"></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="name" type="text" value="<%=listbook.get(i).getName() %>"></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="author" type="text" value="<%=listbook.get(i).getAuthor() %>"></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="pricep" type="text" value="<%=listbook.get(i).getPricep() %>"></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="prices" type="text" value="<%=listbook.get(i).getPrices() %>"></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="publish" type="text" value="<%=listbook.get(i).getPublish() %>" onClick="WdatePicker()"></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><input name="number" type="text" value="<%=listbook.get(i).getNumber() %>"></div></td>
			          	<td height="18" bgcolor="#FFFFFF">
				          	<div align="center"><span class="STYLE1"></span>
				          	<a><input type="submit" value="修改" style="height:23px; width:40px; border:solid 1px #99cccc; font-size:12px; color:42870a;"></a>
				          	<a href=<%=basePath %>book?type=del&url=bookeditlist.jsp&id=<%=listbook.get(i).getId()%>  onclick="return (confirm('你确定要删除么？'))"  >删除</a>
				          	<span class="STYLE1"></span>
				          	</div>
			          	</td> 
			          </tr>
			          </form>
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
