package org.pan;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.pan.bean.SystemMenu;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/6/5.
 */
public class MenuAdpater {

    private List<SystemMenu> systemMenuList;

    public MenuAdpater(List<SystemMenu> systemMenuList) {
        this.systemMenuList = systemMenuList;
    }

    public List<ObjectNode> createEasyuiMenu(){
        ObjectMapper mapper = new ObjectMapper();
        List<ObjectNode> arrayNode = new ArrayList<>();
        for (SystemMenu systemMenu : systemMenuList) {
            ObjectNode easyuiNode = createEasyuiNode(mapper, systemMenu);
            arrayNode.add(easyuiNode);
        }
        return arrayNode;
    }

    private ObjectNode createEasyuiNode(ObjectMapper mapper, SystemMenu systemMenu){
        ObjectNode objectNode = mapper.createObjectNode();
        objectNode.put("id", systemMenu.getId());
        objectNode.put("iconCls", systemMenu.getIconCls());
        objectNode.put("state", systemMenu.getState());
        objectNode.put("text", systemMenu.getText());

        ObjectNode objectNode1 = mapper.createObjectNode();
        objectNode1.put("url",systemMenu.getUrl());
        objectNode.set("attributes",objectNode1);

        List<SystemMenu> children = systemMenu.getChildren();
        if (children != null && !children.isEmpty()) {
            ArrayNode arrayNode = mapper.createArrayNode();
            for (SystemMenu child : children) {
                ObjectNode easyuiNode = createEasyuiNode(mapper, child);
                arrayNode.add(easyuiNode);
            }
            objectNode.put("children", arrayNode);
        }
        return objectNode;
    }

}
