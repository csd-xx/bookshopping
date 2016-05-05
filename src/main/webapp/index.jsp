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


    </script>
    <script type="text/javascript" src="${ctx}/resource/js/bookshopping.js" charset="UTF-8">
    </script>
<body onload="load()">
<div class="easyui-layout" style="width:1000px;height:500px; margin: auto;">
    <div data-options="region:'north',split:true" style="height: 50px; margin: auto;text-align: center;" >网上书店</div>
    <div region="west" split="true" title="操作框" style="width:250px;">
        <%@ include file="/WEB-INF/jsp/inc-left.jsp"%>
    </div>
    <div id="content" data-options="region:'center'" title="书架" style="padding:5px;style="width: 750px; height: 450px"" >
</div>

</body>
</html>
