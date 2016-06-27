<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/4
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath %>"/>
    <jsp:include page="../includeEasyui.jsp"/>

    <script>
        $(function () {
            $("#adminTree").tree({
                onContextMenu: function(e, node){
                    e.preventDefault();
                    $('#adminTree').tree('select', node.target);
                    $('#adminTree_contextMenu').menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                },
                onClick: function(node){
                    $("#div_menuDetail").css("visibility", "visible");
                    $('#div_menuDetail').panel('setTitle','修改菜单 -> '+node.text);
                    var getParent = $("#adminTree").tree('getParent',node.target);
                    if (getParent != null) {
                        $('#menu-parent').combotree('setValue',getParent.id);
                    }else {
                        $('#menu-parent').combotree('clear');
                    }
                    $("#menu_id").val(node.id);
                    $("#menu_text").textbox('setValue',node.text);
                    $('#menu_iconCls').textbox("setValue",node.iconCls);
                    $('#menu_display').linkbutton({ text:node.text,iconCls: node.iconCls});
                    $('#menu_url').textbox(node.url);
                }
            });
            $("#menu_iconCls").textbox({
                onChange: function (newValue, oldValue) {
                    var menu_text = $("#menu_text").textbox('getValue');
                    updateMenuDisplay(menu_text, newValue);
                }
            })
            $("#menu_text").textbox({
                onChange: function (newValue, oldValue) {
                    var menu_iconCls = $("#menu_iconCls").textbox('getValue');
                    updateMenuDisplay(newValue, menu_iconCls);
                }
            })
        });

        function updateMenuDisplay(menu_text,menu_iconCls) {
            var menu_iconCls = $("#menu_iconCls").textbox('getValue');
            var menu_text = $("#menu_text").textbox('getValue');
            $('#menu_display').linkbutton({ text:menu_text,iconCls: menu_iconCls});
        }

        function addMenu() {
            $("#div_menuDetail").css("visibility", "visible");
            $('#div_menuDetail').panel('setTitle','添加顶级菜单');

            cleanDetail();
        }
        
        function appendMenu() {
            $("#div_menuDetail").css("visibility", "visible");
            var getSelected = $('#adminTree').tree('getSelected');
            $('#div_menuDetail').panel('setTitle','添加子级菜单 -> '+getSelected.text);

            cleanDetail();
            $('#menu-parent').combotree('setValue', getSelected.id);
        }

        function reloadMenu() {
            $('#adminTree').tree('reload');
            $("#div_menuDetail").css("visibility", "hidden");
            $('#div_menuDetail').panel('setTitle',"菜单详情");
        }

        function removeMenu() {
            var getSelected = $('#adminTree').tree('getSelected');
            $.messager.confirm('确认', '您确定要删除' + getSelected.text + '菜单吗？', function(r){
                if (r){
                    $.ajax({
                        url: "/admin/adminMenuManage/"+getSelected.id+"/delete",
                        success: function(data){
                            $.messager.alert('提示','删除成功!'+data,'info');
                            reloadMenu();
                        },
                        error:function () {
                            $.messager.alert("错误",'删除失败','error')
                        }
                    });
                }
            });
        }
        
        function saveMenu() {
            $.ajax({
                url: "/admin/adminMenuManage/insertOrUpdate",
                data:{
                    parentId:$('#menu-parent').combotree('getValue'),
                    id:$('#menu_id').val(),
                    text:$('#menu_text').textbox('getValue'),
                    iconCls:$('#menu_iconCls').textbox('getValue'),
                    state:$('#menu_state').switchbutton("options").checked,
                    url:$('#menu_url').textbox('getValue'),
                },
                success: function(data){
                    $.messager.alert('提示','添加成功!'+data,'info');
                    reloadMenu();
                },
                error:function () {
                    $.messager.alert("错误",'添加失败','error')
                }
            });
        }
        
        function cancelMenu() {
            $.messager.confirm('确认', '您确定要取消编辑吗？', function(r){
                if (r){
                    $("#div_menuDetail").css("visibility", "hidden");
                    $('#div_menuDetail').panel('setTitle',"菜单详情");
                }
            });
        }

        function cleanDetail() {
            $('#menu-parent').combotree('clear');
            $("#menu_text").textbox('setValue',"");
            $('#menu_iconCls').textbox("setValue","");
            $('#menu_url').textbox("setValue","");
            $('#menu_id').val("");
            $('#menu_display').linkbutton({ text:"",iconCls: ""});
        }
    </script>
</head>
<body class="easyui-layout" style="margin: 2px 2px 2px 2px">
    <div data-options="region:'west',title:'系统菜单',split:true" style="width:200px;padding: 10px;">
        <ul id="adminTree" class="easyui-tree" data-options="url:'/admin/getAdminMenuTree'">

        </ul>
        <div id="adminTree_contextMenu" class="easyui-menu" style="width:120px;">
            <div onclick="appendMenu()" data-options="iconCls:'icon-add'">添加子级菜单</div>
            <div onclick="addMenu()" data-options="iconCls:'icon-add'">添加顶级菜单</div>
            <div onclick="removeMenu()" data-options="iconCls:'icon-remove'">删除菜单</div>
            <div onclick="reloadMenu()" data-options="iconCls:'icon-reload'">刷新</div>
        </div>
    </div>
    <div id="div_menuDetail" data-options="region:'center'" title="菜单详情" style="padding: 10px;visibility: hidden">
        <input id="menu_id" type="hidden" name="id">
        <table cellpadding="5px">
            <tr>
                <td><label for="menu-parent">所属父级菜单</label></td>
                <td>
                    <select id="menu-parent" name="parent" class="easyui-combotree" style="width:150px;" data-options="valueField: 'id', textField: 'text',url:'/admin/getAdminMenuTree'"> </select>
                </td>
            </tr>
            <tr>
                <td><label for="menu_text">菜单显示名称</label></td>
                <td><input id="menu_text" name="text" class="easyui-textbox" style="width:150px" ></td>
            </tr>
            <tr>
                <td><label for="menu_iconCls">菜单显示样式</label></td>
                <td><input id="menu_iconCls" name="iconCls" class="easyui-textbox" style="width:150px" /></td>
            </tr>
            <tr>
                <td><label>菜单显示预览</label></td>
                <td><a id="menu_display" class="easyui-linkbutton" style="width:150px"></a></td>
            </tr>
            <tr>
                <td><label for="menu_state">默认显示状态</label></td>
                <td><input id="menu_state" name="state" class="easyui-switchbutton" data-options="onText:'展开',offText:'收缩'" style="width:150px"></td>
            </tr>
            <tr>
                <td><label for="menu_url">菜单链接地址</label></td>
                <td><input id="menu_url" name="url" class="easyui-textbox" style="width:150px"/></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td colspan="2" align="middle">
                    <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="saveMenu()" >保存</a>
                    <a class="easyui-linkbutton" data-options="iconCls:'icon-undo'" onclick="cancelMenu()">取消</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
