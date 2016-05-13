<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016-05-13
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
</head>
<body>
<div id="login" style="top:50%; left:50%;  width: 50%; height: 50%; margin: auto; text-align: center; ">
  <form id="fmadminlogin" method="post" style="padding:5px;text-align:center;" action="${ctx}/admin/select/one.htm" onsubmit="return check()">
    <a href="${ctx}/index.jsp">返回首页</a>
    <div class="fitem" style="padding:5px;">
      <label>用 户 名:</label>
      <input name="adminname" class="easyui-validatebox" required="true" missingMessage="请输入用户名!">
    </div>
    <div class="fitem" style="padding:5px;">
      <label>密&nbsp&nbsp码:</label>
      <input name="password" type="password" class="easyui-validatebox" required="true" missingMessage="请输入密码!">
    </div>

    <div id="dlgadminlogin" style="padding:5px;text-align:center;" >
      <input type="submit" name="button" id="button" value="登录">
      <input type="submit" name="close" id="close" value="取消"  onclick=window.open("${ctx}/index.jsp")>
    </div>
  </form>
</div>
</body>
</html>
