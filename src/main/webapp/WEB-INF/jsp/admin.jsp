<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>

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
  </script>
  <script type="text/javascript" src="${ctx}/resource/js/bookshopping.js" charset="UTF-8">
  </script>
</head>
<body onload="adminLoad()">
<div class="easyui-layout" style="width:1000px;height:500px; margin: auto;">
  <div data-options="region:'north',split:true" style="height: 50px; margin: auto;text-align: center;" >
    <a href="${ctx}/index.jsp">网上书店</a>
  </div>
  <div region="west" split="true" title="操作框" style="width:250px;">
    <%@ include file="admin-left.jsp"%>
  </div>
  <div id="content" data-options="region:'center'" title="管理员操作" style="padding:5px;width: 750px; height: 450px" >
  <%--加载图书--%>
  <div id="dlgadminbookshopping">
    请输入图书编号:<input id="bookid" name="bookid" >
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="adminSelectBook()">查询图书</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openAddBook()">增加图书</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openEditBook()">编辑图书</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="adminDeleteBook()">删除图书</a>
  </div>
  <table id="dgadminbookdata" title="" class="easyui-datagrid" style="width: 800px; height: 340px"
         toolbar="#dlgadminbookshopping" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
    <thead>
    <tr>
      <th field="bookid" width="30">图书编号</th>
      <th field="bookname" width="30">图书名称</th>
      <%--<th field="categoryid" width="30">类别id</th>--%>
      <th field="author" width="30">作者</th>
      <th field="publishing" width="35">出版社</th>
      <th field="publishtime" width="30">出版时间</th>
      <th field="bookprice" width="30">图书单价</th>
      <th field="amount" width="30">图书库存</th>
      <th field="remark" width="30">备注</th>

    </tr>
    </thead>
  </table>
  <%--添加图书--%>
  <div id="dladdbook" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
       closed="true" buttons="#dlg-buttons">
    <form id="fmaddbook" method="post">
      <div class="fitem" style="padding:5px;">
        <label>图书名:</label>
        <input name="bookname" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>作&nbsp&nbsp者:</label>
        <input name="author" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>出版社:</label>
        <input name="publishing" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>出厂时间:</label>
        <input name="publishtime" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>单&nbsp&nbsp价:</label>
        <input name="bookprice" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>库&nbsp&nbsp存:</label>
        <input name="amount" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>备&nbsp&nbsp注:</label>
        <input name="remark" class="easyui-validatebox" required="true">
      </div>
    </form>
  </div>
  <div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="adminAddBook()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dladdbook').dialog('close')">取消</a>
  </div>
  <%--编辑图书--%>
  <div id="dleditbook" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
       closed="true" buttons="#dlgeditbook">
    <form id="fmeditbook" method="post">
      <div class="fitem" style="padding:5px;">
        <label>图书ID:</label>
        <input name="bookid" class="easyui-validatebox" required="true" readonly>
      </div>
      <div class="fitem" style="padding:5px;">
        <label>图书名:</label>
        <input name="bookname" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>作&nbsp&nbsp者:</label>
        <input name="author" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>出版社:</label>
        <input name="publishing" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>出厂时间:</label>
        <input name="publishtime" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>单&nbsp&nbsp价:</label>
        <input name="bookprice" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>库&nbsp&nbsp存:</label>
        <input name="amount" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>备&nbsp&nbsp注:</label>
        <input name="remark" class="easyui-validatebox" required="true">
      </div>
    </form>
  </div>
  <div id="dlgeditbook">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="adminEditBook()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dladdbook').dialog('close')">取消</a>
  </div>
  <%--操作用户框--%>
  <div id="dlcontroluser" class="easyui-dialog" style="width:900px;height:500px;padding:10px 20px"
       closed="true" buttons="#dlgcontroluser">
    <div id="dlgadminuser">
      请输入用户编号:<input id="userid" name="userid" >
      <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="adminSelectUser()">查询用户</a>
      <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openAddUser()">添加用户</a>
      <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="openAdminEditUser()">编辑用户</a>
      <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="adminDeleteUser()">删除用户</a>
      <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="adminSelectOrders()">查询用户订单</a>
    </div>
    <table id="dgcontroluser" title="" class="easyui-datagrid" style="width: 800px; height: 340px"
           toolbar="#dlgadminuser" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
      <thead>
      <tr>
        <th field="userid" width="30">用户ID</th>
        <th field="username" width="30">用户名</th>
        <th field="password" width="30">密码</th>
        <th field="sex" width="30">性别</th>
        <th field="birthday" width="35">出生日期</th>
        <th field="email" width="30">邮箱</th>
        <th field="address" width="30">地址</th>
      </tr>
      </thead>
    </table>
  </div>
  <div id="dlgcontroluser">
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlcontroluser').dialog('close')">取消</a>
  </div>
  <%--添加用户--%>
  <div id="dladminadduser" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
       closed="true" buttons="#dlgadminadduser">
    <form id="fmadminadduser" method="post">
      <div class="fitem" style="padding:5px;">
        <label>用户名:</label>
        <input name="username" class="easyui-validatebox" required="true" missingMessage="请输入用户名!">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>密&nbsp&nbsp码:</label>
        <input name="password" class="easyui-validatebox" required="true" missingMessage="请输入密码!">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>性&nbsp&nbsp别:</label>
        <input name="sex" class="easyui-validatebox" required="true" missingMessage="请输入性别!">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>生&nbsp&nbsp日:</label>
        <input name="birthday" class="easyui-validatebox" required="true" missingMessage="请输入您的出生日期!">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>邮&nbsp&nbsp箱:</label>
        <input name="email" class="easyui-validatebox" required="true" missingMessage="请输入您的邮箱!">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>地&nbsp&nbsp址:</label>
        <input name="address" class="easyui-validatebox" required="true" missingMessage="请输入地址!">
      </div>
    </form>
  </div>
  <div id="dlgadminadduser">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="adminAddUser()">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dladminadduser').dialog('close')">取消</a>
  </div>
  <%--编辑用户--%>
  <div id="dladminedituser" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
       closed="true" buttons="#dlgadminedituser">
    <form id="fmadminedituser" method="post">
      <div class="fitem" style="padding:5px;">
        <label>用户ID:</label>
        <input name="userid" class="easyui-validatebox" required="true" readonly>
      </div>
      <div class="fitem" style="padding:5px;">
        <label>用户名:</label>
        <input name="username" class="easyui-validatebox" required="true" readonly>
      </div>
      <div class="fitem" style="padding:5px;">
        <label>密&nbsp&nbsp码:</label>
        <input name="password" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>性&nbsp&nbsp别:</label>
        <input name="sex" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>生&nbsp&nbsp日:</label>
        <input name="birthday" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>邮&nbsp&nbsp箱:</label>
        <input name="email" class="easyui-validatebox" required="true">
      </div>
      <div class="fitem" style="padding:5px;">
        <label>地&nbsp&nbsp址:</label>
        <input name="address" class="easyui-validatebox" required="true">
      </div>
    </form>
  </div>
  <div id="dlgadminedituser">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="adminEditUser()">确定</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dladminedituser').dialog('close')">取消</a>
  </div>
<%--用户订单--%>
  <div id="userOrders" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
       closed="true" buttons="#">
    <table id="dgUserOrders" title="订单信息" class="easyui-datagrid" style="width: 800px; height: 340px"
           toolbar="#dlguserorders" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">

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
    <div id="dlguserorders">
      <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="userSelectDetail()">查询明细</a>
    </div>
  </div>


  <%--订单明细信息--%>
  <div id="userOrderdetail" class="easyui-dialog" style="width:600px;height:300px;padding:10px 20px"
       closed="true" buttons="">
    <div id="dlgbook">
      <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="detailSelectBook()">查询图书</a>
    </div>
    <table id="dgUserOrderdetail" title="订单信息" class="easyui-datagrid" style="width: 600px; height: 270px"
           toolbar="#dlgbook" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
      <thead>
      <tr>
        <th field="orderdetailid" width="60">订单明细ID</th>
        <th field="orderid" width="60">订单ID</th>
        <th field="bookid" width="60">图书ID</th>
        <th field="booknum" width="60">购买数量</th>
      </tr>
      </thead>
    </table>
  </div>
  <%--图书信息--%>
  <div id="dlselectbook" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
       closed="true" buttons="">
    <table id="dgselectbook" title="" class="easyui-datagrid" style="width: 800px; height: 340px"
           toolbar="#" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
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
  </div>
</div>

</body>
</html>