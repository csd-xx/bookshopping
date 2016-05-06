function load() {//加载页面时加载出图书信息

    var jsonUrl = ctx + '/book/select/all.htm';
    var htmlUrl = ctx + '/select/homepage.htm';
    $.get(htmlUrl, function (data, status) {
        if (status == "success") {
            $("#content").html(data);
            /* 解析器重新解析动态加载的easyui组件(必须是加载内容的父容器) */
            $.parser.parse("#content");

            $('#homepagedata').datagrid({
                pagination: true,
                url: jsonUrl
            });
            var pager = $('#homepagedata').datagrid('getPager');
            pager.pagination({
                pageList: [5, 10, 15, 20],
                displayMsg: '当前显示 {from} 到  {to}, 共 {total} 条记录'
            })
        }
    });

}
function loginLoad() {//用户登录时加载页面时加载出图书信息
	var jsonUrl = ctx + '/book/select/all.htm';
	  $('#bookdata').datagrid({
          pagination: true,
          url: jsonUrl
      });
	  var pager = $('#bookdata').datagrid('getPager');
	  pager.pagination({
          pageList: [5, 10, 15, 20],
          displayMsg: '当前显示 {from} 到  {to}, 共 {total} 条记录'
      })
}
function userLogin() {//打开用户登录框
    $('#userlogin').dialog('open').dialog('setTitle', '用户登录');
}

function register() {//打开用户注册框

    $('#register').dialog('open').dialog('setTitle', '用户注册');

}

function adminLogin() {//打开管理员登录框

    $('#adminlogin').dialog('open').dialog('setTitle', '管理员登录');

}

//function userLoginSelect() {//用户登录判断
//    var jsonUrl1 = ctx + '/book/select/all.htm';
//    var jsonUrl = ctx + '/user/select/one.htm';
//    var htmlUrl = ctx + '/select/book.htm';
//    $('#userlogin').form('submit', {
//        url : jsonUrl,
//        success : function(result) {
//            var result = eval('(' + result + ')');
//            if (result.errorMsg) {
//                $.messager.show({
//                    title : 'Error',
//                    msg : result.errorMsg
//                });
//            } else {
//                $('#userlogin').dialog('close'); // close the dialog
//                $.get(htmlUrl, function (data, status) {
//                    if (status == "success") {
//                        $("#content").html(data);
//                        /* 解析器重新解析动态加载的easyui组件(必须是加载内容的父容器) */
//                        $.parser.parse("#content");
//
//                        $('#bookdata').datagrid({
//                            pagination: true,
//                            url: jsonUrl1
//                        });
//                        var pager = $('#homepagedata').datagrid('getPager');
//                        pager.pagination({
//                            pageList: [5, 10, 15, 20],
//                            displayMsg: '当前显示 {from} 到  {to}, 共 {total} 条记录'
//                        })
//                    }
//                });
//            }
//        }
//    });
//}
function userRegister() {//用户注册
	 var jsonUrl = ctx + '/user/register.htm';

	 $('#registerform').form('submit', {
			url : jsonUrl,
			success : function() {
                alert("注册成功");
					$('#register').dialog('close'); // close the dialog
					
				}
			
		});
}

function selectUserEdit(){//查询用户信息并赋值
    var jsonUrl=ctx+'/select/user/edit.htm?username='+name;
    $('#userEdit').dialog('open').dialog('setTitle', '用户编辑');
    $('#userform').form('load', jsonUrl);

}
function selectUserOrders(){//查询用户订单
    var jsonUrl=ctx+'/select/user/order.htm?username='+name;
    $('#userOrders').dialog('open').dialog('setTitle', '用户订单');
    $('#dgUserOrders').datagrid('load',jsonUrl);
}
function shoppingCart(){//添加购物车

    var row = $('#bookdata').datagrid('getSelected');
    if(row){
        var jsonUrl=ctx+'/shoppingcart.htm?bookid='+row.bookid;
        $('#dlshoppingcart').dialog('open').dialog('setTitle', '购物车');
        $('#dgshoppingcart').datagrid({url:jsonUrl});
    }else{
        alert("请选择图书");
    }
}

function addBook(){//打开图书信息框
    var jsonUrl=ctx+'/book/select/all.htm';
    $('#dlcartbook').dialog('open').dialog('setTitle', '图书列表');
    $('#dgcartbook').datagrid({
        pagination : true,
        url:jsonUrl});
    var pager = $('#dgcartbook').datagrid('getPager');
    pager.pagination({
        pageList: [5, 10, 15, 20],
        displayMsg: '当前显示 {from} 到  {to}, 共 {total} 条记录'
    })
}

function cartAddBook(){//购物车添加图书
    var row = $('#dgcartbook').datagrid('getSelected');
    if(row){
        var jsonUrl=ctx+'/shoppingcart.htm?bookid='+row.bookid;
        $('#dgshoppingcart').datagrid({
            pagination : true,
            url:jsonUrl});
        $('#dlcartbook').dialog('close');
    }
}
function addOrders(){//添加订单
    var jsonUrl=ctx+'/add/orders.htm?username='+name;

    $('#fmshoppingcart').form('submit', {
        url : jsonUrl,
        success : function(result) {
            var result = eval('(' + result + ')');
            if (result.errorMsg) {
                $.messager.show({
                    title : 'Error',
                    msg : result.errorMsg
                });
            } else {
                alert("下单成功");
                $('#dlshoppingcart').dialog('close'); // close the dialog
            }
        }
    });
}

function userSelectDetail(){//查询订单明细
    var row = $('#dgUserOrders').datagrid('getSelected');
    if(row){
        var jsonUrl=ctx+'/user/select/detail.htm?orderid='+row.orderid;
        $('#userOrderdetail').dialog('open').dialog('setTitle', '购物车');
        $('#dgUserOrderdetail').datagrid({
            pagination : true,
            url:jsonUrl});

    }

}

function updateUser(){//修改用户信息
    var jsonUrl=ctx+'/update/user.htm?username='+name;
    $('#userform').form('submit', {
        url : jsonUrl,
        success : function(result) {
            var result = eval('(' + result + ')');
            if (result.errorMsg) {
                $.messager.show({
                    title : 'Error',
                    msg : result.errorMsg
                });
            } else {
                alert("修改成功");
                $('#userEdit').dialog('close'); // close the dialog

            }
        }
    });

}
function cancelShoppingCart(){//取消购物车
    var jsonUrl=ctx + '/orders/cancel.htm'
    $('#dgshoppingcart').datagrid({url:jsonUrl});

}
