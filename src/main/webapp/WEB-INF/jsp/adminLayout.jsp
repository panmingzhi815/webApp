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
    <jsp:include page="includeEasyui.jsp"/>
    <script type="text/javascript" src="<%=basePath %>js/adminLayout.js"></script>

</head>
<body  class="easyui-layout">
    <div data-options="region:'north'" style="height:80px;padding: 5px">
        <img src="icon/logo_64.png" style="float: left" onclick="window.location='#'"/>
        <label style="line-height: 64px;font-size: 20pt;padding-left: 15px;font-weight:900;">中小型企业管理平台</label>
    </div>
    <div data-options="region:'south',split:false" style="height:30px;text-align: center;padding-top: 5px;">
        <label>建议在谷歌浏览器 1400 x 900 分辨率下使用该系统</label>
    </div>
    <div data-options="region:'west',split:true" title="功能菜单" style="width:200px;padding: 10px;">
        <ul id="systemTree" class="easyui-tree" data-options="url:'admin/systemMenuTree',method:'get',animate:true,lines:true"></ul>
    </div>
    <div data-options="region:'center'">
        <div id="systemTab" class="easyui-tabs" data-options="fit:true,border:false">
            <div title="欢迎使用" style="display:none;">
                <img src="image/mainLogo.jpg"/>
            </div>
        </div>
    </div>
</body>
</html>
