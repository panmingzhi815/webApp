$(function () {
    $('#systemTree').tree({
        onClick: function(node){
            if (node.attributes == null || node.attributes.url == null || node.attributes.url == '') {
                return;
            }
            var href = node.attributes.url;
            addTab(node.text,node.iconCls,href)
        }
    });
})

function addTab(title,iconCls,href) {
    if ($('#systemTab').tabs('exists', title)){
        $('#systemTab').tabs('select', title);
    } else {
        $('#systemTab').tabs('add',{
            title:title,
            content: createTab(href) ,
            closable:true,
            iconCls:iconCls,
            tools:[{
                iconCls:'icon-mini-refresh',
                handler:function(){
                    var tab = $('#systemTab').tabs('getSelected');
                    $('#systemTab').tabs('update', {
                        tab: tab,
                        options:{
                            title:title,
                            content: createTab(href)
                        }
                    });
                }
            }]
        });
    }
}

function createTab(href) {
    var content = '<div style="width: 100%;height: 100%; overflow: hidden"><iframe scrolling="auto" frameborder="0" style="width: 100%;height: 100%;" src="'+href+'"></iframe></div>';
    return content;
}
