<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

User user=(User)session.getAttribute("user");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body onload="MM_preloadImages('images/main_26_1.gif','images/main_29_1.gif','images/main_31_1.gif')">
<table width="177" height="85%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="26" background="images/main_21.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="80" style="background-image:url(images/main_23.gif); background-repeat:repeat-x;">
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
              <td height="36">&nbsp;</td>
          </tr>
          <%
          if(user.getPer().equals("1")){
          %>
        	  <tr>
              	<td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="urseedit.jsp" ><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />用户信息</a></td>
         	  </tr>
        	  <tr>
              	<td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="addresslist.jsp" ><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />收货地址</a></td>
         	  </tr>
         	  <tr>
                  <td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="booklist.jsp"  ><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />书籍订购</a></td>
              </tr>
              <tr>
                <td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="cartlist.jsp"  ><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />购物篮书籍</a></td>
              </tr>              
              <tr>
                <td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="feedback.jsp"  ><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />给商家反馈</a></td>
              </tr>
          <%
          	}
          %>
          
          <%
          if(user.getPer().equals("0")){
        	  %>
	          <tr>
	              <td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="urseeditlist.jsp" ><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />用户管理</a></td>
	          </tr>
	          <tr>
              	<td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="booklist.jsp"><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />书籍查询</a></td>
              </tr>
	          <tr>
              	<td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="bookeditlist.jsp"><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />书籍编辑</a></td>
              </tr>
	          <tr>
              	<td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="order.jsp"><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />订单管理</a></td>
              </tr>
              <tr>
                <td height="36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="feedbacklist.jsp"  ><img src="images/main_31.gif" name="Image3" width="10" height="10" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_31_1.gif',1)" onmouseout="MM_swapImgRestore()" />收到反馈</a></td>
              </tr>
        	  <%
          }
          %>                
        </table>
        </td>
      </tr>
     </table></td>
  </tr> 
</table>
</body>
</html>