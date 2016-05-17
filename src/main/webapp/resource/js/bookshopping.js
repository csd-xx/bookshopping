//var name=username;
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
function openUserLogin() {//打开用户登录框
    $('#userlogin').dialog('open').dialog('setTitle', '用户登录');
}

function register() {//打开用户注册框

    $('#register').dialog('open').dialog('setTitle', '用户注册');

}

function openAdminLogin() {//打开管理员登录框

    $('#dladminlogin').dialog('open').dialog('setTitle', '管理员登录');

}
//function userLogin(){
//    var jsonUrl = ctx + '/user/select/one.htm';
//    $('#fmuserlogin').form('submit', {
//        url: jsonUrl,
//    });
//}
//function adminLogin(){
//    var jsonUrl = ctx + '/admin/select/one.htm';
//    $('#fmadminlogin').form('submit', {
//        url: jsonUrl,
//    });
//}

function userRegister() {//用户注册
    var jsonUrl = ctx + '/user/register.htm';

    $('#registerform').form('submit', {
        url: jsonUrl,
        success: function () {
            alert("注册成功");
            $('#register').dialog('close'); // close the dialog

        }

    });
}

function selectUserEdit() {//查询用户信息并赋值
    var jsonUrl = ctx + '/select/user/edit.htm?username=' + name;
    $('#userEdit').dialog('open').dialog('setTitle', '用户编辑');
    $('#userform').form('load', jsonUrl);

}
function selectUserOrders() {//查询用户订单
    var jsonUrl = ctx + '/select/user/order.htm?username=' + name;
    $('#userOrders').dialog('open').dialog('setTitle', '用户订单');
    $('#dgUserOrders').datagrid('load', jsonUrl);
}
function shoppingCart() {//添加购物车

    var row = $('#bookdata').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/shoppingcart.htm?bookid=' + row.bookid;
        //$('#dlshoppingcart').dialog('open').dialog('setTitle', '购物车');
        $('#dgshoppingcart').datagrid({

            url: jsonUrl
        });
    } else {
        alert("请选择图书");
    }
}

//function addBook() {//打开图书信息框
//    var jsonUrl = ctx + '/book/select/all.htm';
//    $('#dlcartbook').dialog('open').dialog('setTitle', '图书列表');
//    $('#dgcartbook').datagrid({
//        pagination: true,
//        url: jsonUrl
//    });
//    var pager = $('#dgcartbook').datagrid('getPager');
//    pager.pagination({
//        pageList: [5, 10, 15, 20],
//        displayMsg: '当前显示 {from} 到  {to}, 共 {total} 条记录'
//    })
//}

function cartAddBook() {//购物车添加图书
    var row = $('#dgcartbook').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/shoppingcart.htm?bookid=' + row.bookid;
        $('#dgshoppingcart').datagrid({
            pagination: true,
            url: jsonUrl
        });
        $('#dlcartbook').dialog('close');
    } else {
        alert("请选择图书");
    }
}
function addOrders() {//添加订单
    var jsonUrl = ctx + '/add/orders.htm?username=' + name;
    $('#fmshoppingcart').form('submit', {
        url: jsonUrl,
        success: function (result) {
            var result = eval('(' + result + ')');
            if (result.errorMsg) {
                $.messager.show({
                    title: 'Error',
                    msg: result.errorMsg
                });
            } else {
                alert("下单成功");
                $('#dgshoppingcart').datagrid('reload');
                $('#dlshoppingcart').dialog('close'); // close the dialog
            }
        }
    });
}

function userSelectDetail() {//查询订单明细
    var row = $('#dgUserOrders').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/user/select/detail.htm?orderid=' + row.orderid;
        $('#userOrderdetail').dialog('open').dialog('setTitle', '订单明细');
        $('#dgUserOrderdetail').datagrid({
            pagination: true,
            url: jsonUrl
        });

    } else {
        alert("请选择订单信息");
    }

}

function updateUser() {//修改用户信息
    var jsonUrl = ctx + '/update/user.htm?username=' + name;
    $('#userform').form('submit', {
        url: jsonUrl,
        success: function (result) {
            var result = eval('(' + result + ')');
            if (result.errorMsg) {
                $.messager.show({
                    title: 'Error',
                    msg: result.errorMsg
                });
            } else {
                alert("修改成功");
                $('#userEdit').dialog('close'); // close the dialog

            }
        }
    });

}
function cancelShoppingCart() {//取消购物车
    var jsonUrl = ctx + '/orders/cancel.htm'
    $('#dgshoppingcart').datagrid({url: jsonUrl});

}
function adminLoad() {//管理员登录时加载页面时加载出图书信息
    var jsonUrl = ctx + '/book/select/all.htm';

    $('#dgadminbookdata').datagrid({
        pagination: true,
        url: jsonUrl
    });
    var pager = $('#dgadminbookdata').datagrid('getPager');
    pager.pagination({
        pageList: [5, 10, 15, 20],
        displayMsg: '当前显示 {from} 到  {to}, 共 {total} 条记录'
    })
}
function adminSelectBook() {//管理员查找图书
    if ($("#bookid").val() == null || $("#bookid").val() == "") {
        alert("请输入图书编号");
    } else {
        var jsonUrl = ctx + '/admin/select/book.htm?bookid=' + $("#bookid").val();
        $('#dgadminbookdata').datagrid({
            url: jsonUrl
        });
    }
}
function openAddBook() {//打开添加图书框
    $('#dladdbook').dialog('open').dialog('setTitle', '添加图书');
}
function adminAddBook() {
    var jsonUrl = ctx + '/admin/add/book.htm';

    $('#fmaddbook').form('submit', {
        url: jsonUrl,
        success: function () {
            alert("添加成功");
            $('#dladdbook').dialog('close'); // close the dialog

        }

    });
}
function openEditBook() {//打开编辑图书框
    var row = $('#dgadminbookdata').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/admin/select/one/book.htm?bookid=' + row.bookid;
        $('#dleditbook').dialog('open').dialog('setTitle', '编辑图书');
        $('#fmeditbook').form('load', jsonUrl);
    } else {
        alert("请选择图书");
    }
}
function adminEditBook() {//修改图书信息
    var jsonUrl = ctx + '/admin/edit/book.htm';
    $('#fmeditbook').form('submit', {
        dataType: 'json',
        url: jsonUrl,
        success: function () {
            alert("修改成功");
            $('#dleditbook').dialog('close'); // close the dialog
        }
    });
}
function adminDeleteBook() {//删除图书信息
    var row = $('#dgadminbookdata').datagrid('getSelected');
    if (row) {
        $.messager.confirm('Confirm', '确定删除该图书吗?', function (r) {
            if (r) {
                $.post(ctx + '/admin/delete/book.htm', {
                    bookid: row.bookid
                }, function (result) {
                    if (result.success) {
                        $('#dgadminbookdata').datagrid('reload'); // reload the user data
                    } else {
                        $.messager.show({ // show error message
                            title: 'Error',
                            msg: result.errorMsg
                        });

                    }
                }, 'json');
            }
        });
    } else {
        alert("请选择图书");
    }
}
function adminUser() {//打开管理用户框
    $('#dlcontroluser').dialog('open').dialog('setTitle', '用户管理');
    var jsonUrl = ctx + '/admin/select/user.htm';
    $('#dgcontroluser').datagrid({
        pagination: true,
        url: jsonUrl
    });
    var pager = $('#dgcontroluser').datagrid('getPager');
    pager.pagination({
        pageList: [5, 10, 15, 20],
        displayMsg: '当前显示 {from} 到  {to}, 共 {total} 条记录'
    })
}
function adminSelectUser() {//查询用户信息
    if ($("#userid").val() == null || $("#userid").val() == "") {
        alert("请输入用户编号");
    } else {
        var jsonUrl = ctx + '/admin/select/one/user.htm?userid=' + $("#userid").val();
        $('#dgcontroluser').datagrid({url: jsonUrl});

    }
}

function openAddUser() {//打开添加用户框
    $('#dladminadduser').dialog('open').dialog('setTitle', '添加用户');
}
function adminAddUser() {//添加用户
    var jsonUrl = ctx + '/user/register.htm';

    $('#fmadminadduser').form('submit', {
        url: jsonUrl,
        success: function () {
            alert("添加成功");
            $('#dladminadduser').dialog('close'); // close the dialog

        }

    });
}
function openAdminEditUser() {//打开用户编辑框并赋值
    var row = $('#dgcontroluser').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/open/admin/edit/user.htm?userid=' + row.userid;
        $('#dladminedituser').dialog('open').dialog('setTitle', '编辑用户');
        $('#fmadminedituser').form('load', jsonUrl);
    } else {
        alert("请选择用户");
    }
}
function adminEditUser() {//修改用户信息
    var jsonUrl = ctx + '/admin/edit/user.htm';
    $('#fmadminedituser').form('submit', {
        dataType: 'json',
        url: jsonUrl,
        success: function () {
            alert("修改成功");
            //$('#dladminedituser').dialog('');
            $('#dladminedituser').dialog('close'); // close the dialog
        }
    });
}
function adminDeleteUser() {//删除用户
    var row = $('#dgcontroluser').datagrid('getSelected');
    if (row) {
        $.messager.confirm('Confirm', '确定删除该用户吗?', function (r) {
            if (r) {
                $.post(ctx + '/admin/delete/user.htm', {
                    userid: row.userid
                }, function (result) {
                    if (result.success) {
                        $('#dgcontroluser').datagrid('reload'); // reload the user data
                    } else {
                        $.messager.show({ // show error message
                            title: 'Error',
                            msg: result.errorMsg
                        });

                    }
                }, 'json');
            }
        });
    }
    else {
        alert("请选择用户");
    }
}
function adminSelectOrders() {//查找订单
    var row = $('#dgcontroluser').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/admin/select/orders.htm?userid=' + row.userid;
        $('#userOrders').dialog('open').dialog('setTitle', '用户订单');
        $('#dgUserOrders').datagrid({url: jsonUrl});
    }
    else {
        alert("请选择用户");
    }
}
function detailSelectBook() {//查询图书
    var row = $('#dgUserOrderdetail').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/detail/select/book.htm?bookid=' + row.bookid;
        $('#dlselectbook').dialog('open').dialog('setTitle', '图书信息');
        $('#dgselectbook').datagrid({
            pagination: true,
            url: jsonUrl
        });
    } else {
        alert("请选择订单明细");
    }
}
//function selectShoppingCart() {//用户查询自己的购物车
//    var jsonUrl = ctx + '/look/shopping/cart.htm';
//    $('#dlshoppingcart').dialog('open').dialog('setTitle', '购物车信息');
//    $('#dgshoppingcart').datagrid({
//        url: jsonUrl
//    });
//}
function removeBook() {//移除购物车中的图书

    var row = $('#dgshoppingcart').datagrid('getSelected');
    if (row) {
        var jsonUrl = ctx + '/remove/book.htm?bookid=' + row.bookid;
        $('#dgshoppingcart').datagrid({
            url: jsonUrl
        });
    } else {
        alert("请选择图书");
    }
}
