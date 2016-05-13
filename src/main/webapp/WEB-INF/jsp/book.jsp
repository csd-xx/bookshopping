<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        .title {
            position: relative;
        }

        .name {
            height: 8px;
            vertical-align: bottom;
            bottom: 10px;
            position: absolute;
            right: 10px;
        }
    </style>

    <%@ include file="/WEB-INF/jsp/inc-easyui.jsp"%>
    <script type="text/javascript">
        var ctx = "${ctx}";
        var name ="<%=session.getAttribute("user")%>";//用户登录是获取登录名

    </script>
    <script type="text/javascript" src="${ctx}/resource/js/bookshopping.js" charset="UTF-8">
    </script>
</head>
<body onload="loginLoad()">
<div class="easyui-layout" style="width:1000px;height:500px; margin: auto;">
    <%--开头--%>
    <div class="title" data-options="region:'north',split:true" style="height: 50px; margin: auto;text-align: center;">
        <a href="${ctx}/index.jsp">网上书店</a>

        <div class="name" style="width:100px; margin: auto;"><%=session.getAttribute("user")%>,欢迎光临</div>
    </div>
    <%--购物车--%>
    <div region="east" iconCls="icon-reload" title="购物车" split="true" style="width:230px; ">

            <form id="fmshoppingcart" method="post" style="padding:5px;text-align:center;">
                <table id="dgshoppingcart" title="购物车信息" class="easyui-datagrid" style="width: 220px; height: 370px"
                       toolbar="#edlgbookshopping" rownumbers="true" fitColumns="true" singleSelect="true">
                    <thead>
                    <tr>
                        <th field="bookname" width="70x">图书名称</th>
                        <th field="bookprice" width="70px">图书单价</th>
                        <th field="total" width="70px">购买总数</th>
                    </tr>
                    </thead>
                </table>
                <a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="addOrders()">确认下单</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="cancelShoppingCart()">取消购物车</a>
            </form>
            <div id="edlgbookshopping">
                <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBook()">添加图书</a>--%>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeBook()">移除图书</a>
            </div>

    </div>
    <div region="west" split="true" title="操作框" style="width:250px; margin: auto;">
        <%@ include file="/WEB-INF/jsp/user-left.jsp" %>
    </div>
    <div id="content" data-options="region:'center'" title="书架" style="padding:5px;width: 750px; height: 450px">
        <%--加载图书--%>
        <div id="bookshopping">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="shoppingCart()">加入购物车</a>

        </div>


        <table id="bookdata" title="" class="easyui-datagrid" style="width: 800px; height: 340px"
               toolbar="#bookshopping" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
            <thead>
            <tr>
                <th field="bookid" width="30">图书编号</th>
                <th field="bookname" width="30">图书名称</th>
                <th field="bookprice" width="30">图书单价</th>
                <th field="author" width="30">作者</th>
                <th field="publishing" width="35">出版社</th>
                <th field="publishtime" width="30">出版时间</th>
                <%--<th field="categoryid" width="30">类别id</th>--%>
                <th field="amount" width="30">图书库存</th>
                <th field="remark" width="30">备注</th>
            </tr>
            </thead>
        </table>
        <%--编辑用户信息--%>
        <div id="userEdit" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
             closed="true" buttons="#dlg-userEdit">
            <form id="userform" method="post" style="padding:5px;text-align:center;">

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
        <div id="dlg-userEdit">
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateUser()">确定</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
               onclick="javascript:$('#userEdit').dialog('close')">取消</a>
        </div>

        <%--用户订单信息--%>
        <div id="userOrders" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
             closed="true" buttons="#">
            <table id="dgUserOrders" title="订单信息" class="easyui-datagrid" style="width: 700px; height: 340px"
                   toolbar="#dlguserorders" rownumbers="true" fitColumns="true" singleSelect="true">

                <thead>
                <tr>
                    <th field="orderid" width="120">订单ID</th>
                    <th field="userid" width="120">用户ID</th>
                    <th field="ordertime" width="120">下单时间</th>
                    <th field="orderprice" width="120">订单总价</th>
                    <th field="orderremark" width="120">订单备注</th>
                </tr>
                </thead>
            </table>
            <div id="dlguserorders">
                <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="userSelectDetail()">查询明细</a>
            </div>
        </div>


        <%--订单明细信息--%>
        <div id="userOrderdetail" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
             closed="true" buttons="">

            <table id="dgUserOrderdetail" title="订单信息" class="easyui-datagrid" style="width: 600px; height: 270px"
                   toolbar="#dlg-orders" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
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
        <%--购物车--%>
        <%--<div id="dlshoppingcart" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"--%>
        <%--closed="true" buttons="#dlgcancelshoppingcart">--%>
        <%--<form id="fmshoppingcart" method="post" style="padding:5px;text-align:center;">--%>
        <%--<table id="dgshoppingcart" title="购物车信息" class="easyui-datagrid" style="width: 600px; height: 270px"--%>
        <%--toolbar="#dlgbookshopping" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">--%>
        <%--<thead>--%>
        <%--<tr>--%>
        <%--<th field="bookid" width="60">图书ID</th>--%>
        <%--<th field="bookname" width="60">图书名称</th>--%>
        <%--<th field="publishing" width="60">出版社</th>--%>
        <%--<th field="bookprice" width="60">图书单价</th>--%>
        <%--<th field="total" width="60">购买总数</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--</table>--%>
        <%--</form>--%>
        <%--<div id="dlgbookshopping">--%>
        <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBook()">添加图书</a>--%>
        <%--<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeBook()">移除图书</a>--%>
        <%--<a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="addOrders()">确认下单</a>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div id="dlgcancelshoppingcart">--%>
        <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="cancelShoppingCart()">取消购物车</a>--%>
        <%--</div>--%>

        <%--图书列表--%>
        <div id="dlcartbook" class="easyui-dialog" style="width:800px;height:400px;padding:10px 20px"
             closed="true" buttons="">

            <table id="dgcartbook" title="图书信息" class="easyui-datagrid" style="width: 800px; height: 340px"
                   toolbar="#dlgcartbook" rownumbers="true" fitColumns="true" singleSelect="true" pagination="true">
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
            <div id="dlgcartbook">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="cartAddBook()">加入购物车</a>
            </div>
        </div>

    </div>


</body>
</html>
