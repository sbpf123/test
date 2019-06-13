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
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
	        <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">请先选择收货地址</span></td>
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
	            <td width="6%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">收件人</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">电话</div></td>
	            <td width="58%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">地址</div></td>
	          </tr>
	        <%
	       	if(listaddress.size()>0){
	       		for(int i=0;i<listaddress.size();i++){
	       			%>
	       			 <tr>
			            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><input name="radio" type="radio" checked="checked" value="<%=listaddress.get(i).getId() %>" /></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listaddress.get(i).getName() %></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listaddress.get(i).getTel() %></div></td>
			            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listaddress.get(i).getRegion() %></div></td>
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
	<!-- 下面是购物篮 -->
	<br><br>
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="15" height="30"><img src="images/tab_03.gif" width="15" height="30" /></td>
	        <td width="1101" background="images/tab_05.gif"><img src="images/311.gif" width="16" height="16" /> <span class="STYLE4">订单</span></td>
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
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">单价(本)</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">出版年份</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">购买数量(箱)</div></td>
	            <td width="8%" height="18" background="images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">操作</div></td>
	          </tr>
	        <%
	        if(listcart.size()>0){
	        	int u=0;
	        	for(int i=0;i<listcart.size();i++){
					if(listcart.get(i).getUserid()==user.getId() && listcart.get(i).getState()==0){
						for(int j=0;j<listbook.size();j++){
							if(listcart.get(i).getBookid()==listbook.get(j).getId()){
								u++;
								%>
									<tr>
							            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE1"><%=u %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getIsbn() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getName() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getAuthor() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getPrices() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listbook.get(j).getPublish() %></div></td>
							            <td height="18" bgcolor="#FFFFFF" class="STYLE2"><div align="center" class="STYLE2 STYLE1"><%=listcart.get(i).getNumber() %></div></td>
							          	<td height="18" bgcolor="#FFFFFF">
								          	<div align="center">
								          		<a href="javascript:void(0);" onclick="show(<%=listcart.get(i).getId() %>)"   >付款(总价:<%=df.format(Double.valueOf(listcart.get(i).getNumber()) *Double.valueOf(listbook.get(j).getPrices())*12) %>)</a><!-- cart?type=updatestate&id= -->
								          	</div>
							          	</td>
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
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
var basePath="<%=basePath%>";
function show(id){
	var intHot = $("input[name='radio']:checked").val();
	if(intHot==undefined){
		alert("请添加收货地址");
	}else{
		location.href=basePath+"cart?type=updatestate&id="+id+"&addressid="+intHot;
	}
}
</script>
</html>
