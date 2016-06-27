<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/3
  Time: 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>用户登录</title>
    <base href="<%=basePath %>"/>
    <meta charset="UTF-8">
    <jsp:include page="includeEasyui.jsp"/>
    <script>
        function submitForm(){
            $('#ff').submit();
        }
        function clearForm(){
            $('#ff').form('clear');
        }
        $(function(){
            $("#textbox_id").textbox('textbox').bind('keydown', function(e){
                if (e.keyCode == 13){
                    $('#ff').submit();
                }
            });
        })
    </script>
</head>
<body>
    <div id="win" class="easyui-window" title="用户登录" data-options="modal:true,collapsible:false,minimizable:false,maximizable:false,closable:false,resizable:false" style="padding:10px;width:400px;height:250px;">
        <div style="padding:20px 40px 10px 40px">
            <form id="ff" method="post" action="admin/adminLogin">
                <table cellpadding="5">
                    <tr>
                        <td>用户名:</td>
                        <td><input class="easyui-textbox" type="text" name="username" data-options="required:true,missingMessage:'用户名不可为空'"></td>
                    </tr>
                    <tr>
                        <td>密　码:</td>
                            <td><input id="textbox_id" class="easyui-textbox" type="text" name="password" data-options="required:true,missingMessage:'密码不可为空'"></td>
                    </tr>
                </table>
            </form>
            <div style="text-align:center;padding:15px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">登  录</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重  置</a>
            </div>
        </div>
    </div>
</body>
</html>
