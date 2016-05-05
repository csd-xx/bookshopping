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
function userRegister() {
	 var jsonUrl = ctx + '/user/register.htm';

	 $('#registerform').form('submit', {
			url : jsonUrl,
			success : function() {
                alert("登录成功");
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