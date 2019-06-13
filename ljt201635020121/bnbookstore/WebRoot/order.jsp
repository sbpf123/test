<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*,java.text.DecimalFormat" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

DecimalFormat df = new DecimalFormat("######0.00");

bookServlet ss=new bookServlet();
ss.doPost(request, response);
List<Book> listbook=(List)session.getAttribute("listbook");

cartServlet ss2=new cartServlet();
ss2.doPost(request, response);
List<Cart> listcart=(List)session.getAttribute("listcart");

addressServlet ss3=new addressServlet();
ss3.doPost(request, response);
List<Address> listaddress=(List)session.getAttribute("listaddress");

userServlet ss4=new userServlet();
ss4.doPost(request, response);
List<User> listuser=(List)session.getAttribute("listuser");

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
<link rel="stylesheet" type="text/css" href="css/all.css">
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
	        <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">订单管理</span></td>
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
	            <td width="2%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
	            <td width="4%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">会员帐号</div></td>
	            <td width="9%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">下单时间</div></td>
	            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">条形码</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">书名</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">作者</div></td>
	            <td width="5%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">单价</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">出版年份</div></td>
	            <td width="5%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">购买数量(12本/箱)</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">总价</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">收货人姓名</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">收货人电话</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">收货人地址</div></td>
	          </tr>
	        <%
	        if(listcart.size()>0){
	        	int u=0;
	        	for(int i=0;i<listcart.size();i++){
	        		if(listcart.get(i).getAddressid()>0){
						for(int j=0;j<listbook.size();j++){
							if(listcart.get(i).getBookid()==listbook.get(j).getId()){
								u++;
								%>
									<tr>
							            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><%=u %></div></td>
							            <%
							            for(int k=0;k<listuser.size();k++){
							            	if(listcart.get(i).getUserid()==listuser.get(k).getId()){
							            		%>
							            		  <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listuser.get(k).getUsername() %></div></td>
							            		<%
							            	}
							            }
							            %>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listcart.get(i).getTime() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getIsbn() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getName() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getAuthor() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getPrices() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getPublish() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listcart.get(i).getNumber() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=df.format(Double.valueOf(listcart.get(i).getNumber()) *Double.valueOf(listbook.get(j).getPrices())*12) %></div></td>
							            <%
							            for(int k=0;k<listaddress.size();k++){
							            	if(listcart.get(i).getAddressid()==listaddress.get(k).getId()){
							            		%>
							            		  <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listaddress.get(k).getName() %></div></td>
									              <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listaddress.get(k).getTel() %></div></td>
									              <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listaddress.get(k).getRegion() %></div></td>
							            		<%
							            	}
							            }
							            %>
							        </tr>
								<%
							}
						}
	        		}
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
<script type="text/javascript">
var basePath="<%=basePath%>";
function show(){
	location.href=basePath+"booklist.jsp?isbn="+document.getElementById('isbn').value
			+"&name="+document.getElementById('name').value+"&author="+document.getElementById('author').value
			+"&pricep="+document.getElementById('pricep').value+"&prices="+document.getElementById('prices').value
			+"&publish="+document.getElementById('publish').value+"&number="+document.getElementById('number').value;
}
</script>
</html>
