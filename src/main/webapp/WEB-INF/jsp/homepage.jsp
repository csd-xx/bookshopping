<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016-05-04
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--加载图书--%>
<table id="homepagedata" title="" class="easyui-datagrid" style="width: 800px; height: 340px"
       toolbar="#toolbar4" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
    <thead>
    <tr>
        <th field="bookid" width="30">图书编号</th>
        <th field="bookname" width="30">图书名称</th>
        <th field="categoryid" width="30">类别id</th>
        <th field="author" width="30">作者</th>
        <th field="publishing" width="35">出版社</th>
        <th field="publishtime" width="30">出版时间</th>
        <th field="bookprice" width="30">图书单价</th>
        <th field="amount" width="30">图书库存</th>
        <th field="remark" width="30">备注</th>

    </tr>
    </thead>
</table>
<%--用户登录--%>
<div id="userlogin" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
     closed="true" buttons="#userlogin">
    <form id="userlogin" method="post" action="${ctx}/user/select/one.htm" onsubmit="return check()">
        <div class="fitem">
            <label>用户名:</label>
            <input name="username" class="easyui-validatebox" required="true" missingMessage="请输入用户名!">
        </div>
        <div class="fitem">
            <label>密&nbsp&nbsp码:</label>
            <input name="password" type="password" class="easyui-validatebox" required="true" missingMessage="请输入密码!">
        </div>
        <input type="submit"  name="button" id="button" value="登陆" >

    </form>
</div>
<div id="userlogin">
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#userlogin').dialog('close')">取消</a>
</div>
<%--管理员登录--%>
<div id="dladminlogin" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
     closed="true" buttons="#dlgadminlogin">
    <form id="fmadminlogin" method="post" action="${ctx}/admin/select/one.htm" onsubmit="return check()">
        <div class="fitem">
            <label>用户名:</label>
            <input name="adminname" class="easyui-validatebox" required="true" missingMessage="请输入用户名!">
        </div>
        <div class="fitem">
            <label>密&nbsp&nbsp码:</label>
            <input name="password" type="password" class="easyui-validatebox" required="true" missingMessage="请输入密码!">
        </div>
        <input type="submit"  name="button" id="button" value="登陆" >

    </form>
</div>
<div id="dlgadminlogin">
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#adminlogin').dialog('close')">取消</a>
</div>

<%--用户注册--%>
<div id="register" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="registerform" method="post">
        <div class="fitem">
            <label>用户名:</label>
            <input name="username" class="easyui-validatebox" required="true" missingMessage="请输入用户名!">
        </div>
        <div class="fitem">
            <label>密&nbsp&nbsp码:</label>
            <input name="password" class="easyui-validatebox" required="true" missingMessage="请输入密码!">
        </div>
        <div class="fitem">
            <label>性&nbsp&nbsp别:</label>
            <input name="sex" class="easyui-validatebox" required="true" missingMessage="请输入性别!">
        </div>
        <div class="fitem">
            <label>生&nbsp&nbsp日:</label>
            <input name="birthday" class="easyui-validatebox" required="true" missingMessage="请输入您的出生日期!">
        </div>
        <div class="fitem">
            <label>邮&nbsp&nbsp箱:</label>
            <input name="email" class="easyui-validatebox" required="true" missingMessage="请输入您的邮箱!" >
        </div>
        <div class="fitem">
            <label>地&nbsp&nbsp址:</label>
            <input name="address" class="easyui-validatebox" required="true" missingMessage="请输入您的地址!">
        </div>



    </form>
</div>
<div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="userRegister()">注册</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#register').dialog('close')">取消</a>
</div>