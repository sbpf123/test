<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书批发系统</title>
<style type="text/css">
body{margin: 0px;background-image:url(images/img0.gif);background-size:100% 100%}
</style>
 <script>
window.onload=function user(){
username=login.username.value;
password=login.password.value;
rights = login.rights.value;
if(username=="")
{
alert("用户名不能为空");
return false;
}else
if(password==""){
alert("密码不能为空");
return false;
}else
if(rights==""){
alert("请选择用户类型");
return false;
}
return true;
}
function reset(){
document.login.username.value="";
document.login.password.value="";
document.login.rights.value="";
}
</script>
</head>
<body >
<form action="<%=basePath %>user?type=login" method="post" name="login" onsubmit="return user()" >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="608" "><table width="862" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="266" >&nbsp;</td>
      </tr>
      <tr>
        <td height="95"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          
            <td width="183" " ><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="21%" height="15"><div align= "center"><span class="STYLE3">用户</span></div></td>
                <td width="79%" height="15"><input type="text" name="username"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
                <td height="20"><div align="center"><span class="STYLE3">密码</span></div></td>
                <td height="20"><input type="password" name="password"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
               <td height="20"><div align="center"><span class="STYLE3">用户类型</span></div></td>
               <td height="15"><select size="1" name="per"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">
                                                       <option value=""  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">=====请选择=====</option>
                                                         <option value="1"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">普通用户</option>
                                                           <option value="0"  style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">超级管理</option>
                                                         </select></td>
              </tr>
             <tr>
                <td height="30">&nbsp;</td>
                <td height="15"> 
                	<input type="submit" value="登录" style="height:20px; width:40px; border:solid 1px #cadcb2; font-size:12px; color:#81b432; ">
                	<input type="reset" style="height:20px; width:40px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">
                	<a href="register.jsp"><input type="button" value="注册"  style="height:20px; width:40px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"/>
                </td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="247" valign="top" "><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="22%" height="30">&nbsp;</td>
            <td width="56%">&nbsp;</td>
            <td width="22%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              
            </table></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
 
</table>
</form>
<map name="Map"><area shape="rect" coords="3,3,36,19" href="#"><area shape="rect" coords="40,3,78,18" href="#"></map>
</body>
</html>



