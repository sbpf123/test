<%@ page language="java" import="java.util.*,com.bean.*,com.servlet.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>图书管理系统注册界面</title>
<style type="text/css">
body{margin: 0px;background-image:url(images/img0.gif);background-size:100% 100%}
</style>
</head>
<body>
<form action="<%=basePath %>user?type=add&url=login.jsp" method="post"  >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>

      <tr>
        <td height="95" style="width: 458px; "><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            
          </tr>
        </table><td width="183" style="width: 780px; height: 272px; "><table width="100%" border="0" cellspacing="0" cellpadding="0">          
              <tr>
                <td width="21%" height="15"><div align="right"><span class="STYLE3">请注册:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户</span></div></td>
                <td width="79%" height="15"><input type="text" name="username" style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
                <td height="20"><div align="right"><span class="STYLE3">密码</span></div></td>
                <td height="20"><input type="password" name="password" style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
               <td height="20"><div align="right"><span class="STYLE3">用户类型</span></div></td>
               <td height="15"><select size="1" name="per" style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">
                                                         <option value="1" style="height:18px; width:150px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;">普通用户</option>
                                                         </select></td>
              </tr>
             <tr>
                <td height="30"></td>
                <td height="15">
                	<input type="submit" value="注册" style="height:20px; width:40px; border:solid 1px #cadcb2; font-size:12px; color:#81b432; cursor: pointer;">
                	&nbsp;&nbsp;<input type="reset" style="height:20px; width:40px; border:solid 1px #cadcb2; font-size:12px; color:#81b432; cursor: pointer;">
                	&nbsp;&nbsp;<a href="login.jsp"><input type="button" value="登录" style="height:20px; width:40px; border:solid 1px #cadcb2; font-size:12px; color:#81b432; cursor: pointer;"></a>
                </td>
              </tr>
            </table></td></td>
      </tr>
      <tr>
       
          <tr>
            <td width="22%" height="30">&nbsp;</td>
            <td width="56%">&nbsp;</td>
            <td width="22%">&nbsp;</td>
          </tr>
         
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#a2d962">&nbsp;</td>
  </tr>
</table>
</form>
<map name="Map"><area shape="rect" coords="3,3,36,19" href="#"><area shape="rect" coords="40,3,78,18" href="#"></map></body>
</html>
<script>
function user(){
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
alert("权限不能为空");
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


