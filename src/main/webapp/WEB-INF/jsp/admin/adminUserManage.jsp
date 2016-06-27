<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/3
  Time: 3:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>后台管理</title>
    <base href="<%=basePath %>"/>
    <meta charset="UTF-8">
    <jsp:include page="../includeEasyui.jsp"/>
    <script type="text/javascript" src="<%=basePath %>js/adminLayout.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/common.css">
    <script type="text/javascript" src="<%=basePath %>js/adminUserManage.js?randomId=<%=Math.random()%>"></script>

    <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
        .fitem input{
            width:160px;
        }
    </style>

    <script>
        function newUser() {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加用户');
            $('#fm').form('clear');
        }

        function editUser() {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改用户');
            $('#fm').form('clear');
        }
    </script>
</head>
<body class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',border:false">
        <table class="form-table">
            <tr>
                <td>
                    <label class="form-label" for="user-name-label">用户名:</label>
                    <input class="easyui-textbox" id="user-name-label" name="username"/>
                </td>
                <td>
                    <label class="form-label" for="nike-name-label">昵称:</label>
                    <input class="easyui-textbox" id="nike-name-label" name="nikeName">
                </td>
                <td>
                    <label class="form-label" for="emial-label">邮箱:</label>
                    <input class="easyui-textbox" id="emial-label" name="email">
                </td>
                <td>
                    <a id="btn_search" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
                </td>
                <td>
                    <a id="btn_refresh" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">刷新</a>
                </td>
            </tr>
        </table>
    </div>
    <div data-options="region:'center',border:false" style="padding: 2px 2px 2px 2px">
        <table class="easyui-datagrid" title="用户列表"
               data-options="singleSelect:true,url:'datagrid_data1.json',method:'get',fit:true,border:true,pagination:true,toolbar:'#toolbar'">
            <thead>
            <tr>
                <th data-options="field:'id',checkbox:true,sortable:true"></th>
                <th data-options="field:'username',width:'15%',sortable:true">登录名</th>
                <th data-options="field:'nikeName',width:'15%',sortable:true">昵称</th>
                <th data-options="field:'email',width:'20%',sortable:true">邮箱</th>
                <th data-options="field:'updateTime',width:'20%',sortable:true">更新时间</th>
            </tr>
            </thead>
        </table>
        <div id="toolbar">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加用户</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改用户</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除勾选</a>
        </div>
    </div>

    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
         closed="true" buttons="#dlg-buttons">
        <div class="ftitle">用户信息</div>
        <form id="fm" method="post" novalidate>
            <input type="hidden" name="id">
            <div class="fitem">
                <label>登 录 名:</label>
                <input name="username" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>登录密码:</label>
                <input name="password" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>用户昵称:</label>
                <input name="nikeName" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>电子邮箱:</label>
                <input name="email" class="easyui-textbox" required="true" validType="email">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关闭</a>
    </div>
</body>


