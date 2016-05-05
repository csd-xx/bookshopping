<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016-05-04
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>login</title>

  <style type="text/css">
    li {
      list-style-type: none;
      height: 30px;
      margin-top: 30px;
    }
  </style>
  <%@ include file="/WEB-INF/jsp/inc-easyui.jsp"%>
  <script type="text/javascript">
    var ctx = "${ctx}";
    var name=<%=session.getAttribute("user")%>;

  </script>
  <script type="text/javascript" src="${ctx}/resource/js/bookshopping.js" charset="UTF-8">
  </script>
<body onload="loginLoad()">
<div class="easyui-layout" style="width:1000px;height:500px; margin: auto;">
  <div data-options="region:'north',split:true" style="height: 50px; margin: auto;text-align: center;" >网上书店</div>
  <div region="west" split="true" title="操作框" style="width:250px;">
    <%@ include file="/WEB-INF/jsp/user-left.jsp"%>
  </div>
  <div id="content" data-options="region:'center'" title="书架" style="padding:5px;style="width: 750px; height: 450px"" >
  <%--加载图书--%>
  <div id="bookshopping">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()" >新建</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
  </div>

  <table id="bookdata" title="" class="easyui-datagrid" style="width: 800px; height: 340px"
         toolbar="#bookshopping" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
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
<%--编辑用户信息--%>
  <div id="userEdit" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
       closed="true" buttons="#dlg-userEdit">
    <form id="userform" method="post">
      <div class="fitem">
        <label>用户名:</label>
        <input name="username" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem">
        <label>密&nbsp&nbsp码:</label>
        <input name="password" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem">
        <label>性&nbsp&nbsp别:</label>
        <input name="sex" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem">
        <label>生&nbsp&nbsp日:</label>
        <input name="birthday" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem">
        <label>邮&nbsp&nbsp箱:</label>
        <input name="email" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem">
        <label>地&nbsp&nbsp址:</label>
        <input name="address" class="easyui-validatebox" required="true">
      </div>

    </form>
  </div>
  <div id="dlg-userEdit">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#userEdit').dialog('close')">取消</a>
  </div>

  <%--用户订单信息--%>
  <div id="userOrders" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
       closed="true" buttons="#dlg-buttons">
    <table id="dgUserOrders" title="商品信息" class="easyui-datagrid" style="width: 600px; height: 270px" >
      <thead>
      <tr>
        <th field="orderid" width="60">订单ID</th>
        <th field="userid" width="60">用户ID</th>
        <th field="ordertime" width="60">下单时间</th>
        <th field="orderprice" width="60">订单总价</th>
        <th field="orderremark" width="60">订单备注</th>
      </tr>
      </thead>
    </table>
  </div>
</div>

</body>
</html>
