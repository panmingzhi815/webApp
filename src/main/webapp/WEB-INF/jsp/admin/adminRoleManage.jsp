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
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/common.css">
    <script type="text/javascript" src="<%=basePath %>js/datagrid-filter.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/adminRoleManage.js"></script>
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
    <table class="easyui-datagrid" title="角色列表"
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
</body>
