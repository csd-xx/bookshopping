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
  <script type="text/javascript" src="${ctx}/resource/js/member.js" charset="UTF-8">
  </script>
</head>
<body onload="aaa()">

<div class="easyui-layout" style="width:1000px;height:500px; margin: auto;">
  <div data-options="region:'north',split:true" style="height: 50px">网上书店</div>
  <div region="west" split="true" title="操作框" style="width:250px;">
    <%@ include file="admin-left.jsp"%>
  </div>
  <div id="content" data-options="region:'center'" title="管理员管理页面" style="padding:5px;style="width: 750px; height: 450px"" >管理员管理页面
  <%--加载图书--%>
  <div id="adminbookshopping">
    请输入图书编号:<input id="bookid" name="bookid" >
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="">查询图书</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="">增加图书</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="">编辑图书</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="">删除图书</a>
  </div>
  <table id="adminbookdata" title="" class="easyui-datagrid" style="width: 800px; height: 340px"
         toolbar="#adminbookshopping" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
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

</body>
</html>