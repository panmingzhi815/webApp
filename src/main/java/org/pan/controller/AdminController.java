package org.pan.controller;

import com.fasterxml.jackson.databind.node.ObjectNode;
import org.pan.MenuAdpater;
import org.pan.bean.SystemMenu;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Administrator on 2016/6/3.
 */
@Controller
public class AdminController {

    @RequestMapping("/")
    public String root(){
        return "adminLogin";
    }

    @RequestMapping("/admin/adminLayout")
    public String adminLayout(){
        return "adminLayout";
    }

    @RequestMapping("/admin/adminLogin")
    public String adminLogin(@RequestParam(value = "username") String username,@RequestParam(value = "password") String password){
        return "redirect:adminLayout";
    }

    @ResponseBody
    @RequestMapping("/admin/systemMenuTree")
    public List<ObjectNode> getSystemMenuTree(){
        List<SystemMenu> systemMenus = new ArrayList<>();
        Long id = 1L;
        SystemMenu systemMenu = new SystemMenu(id ++,"系统管理","open","icon-system","");
        SystemMenu systemMenu1 = new SystemMenu(id ++, "用户管理","open","icon-user","admin/adminUserManage");
        SystemMenu systemMenu2 = new SystemMenu(id ++, "角色管理","open","icon-role","admin/adminRoleManage");
        SystemMenu systemMenu3 = new SystemMenu(id ++, "菜单管理","open","icon-menu","admin/adminMenuManage");
        systemMenu.setChildren(Arrays.asList(systemMenu1,systemMenu2,systemMenu3));
        systemMenus.add(systemMenu);
        MenuAdpater menuAdpater = new MenuAdpater(systemMenus);
        return menuAdpater.createEasyuiMenu();
    }

    @ResponseBody
    @RequestMapping("/admin/getAdminMenuTree")
    public List<ObjectNode> getAdminMenuTree(){
        List<SystemMenu> systemMenus = new ArrayList<>();
        Long id = 1L;
        SystemMenu systemMenu = new SystemMenu(id ++,"基础资料管理","open","icon-system","");
        SystemMenu systemMenu1 = new SystemMenu(id ++, "卡片管理","open","icon-user","admin/adminUserManage");
        SystemMenu systemMenu2 = new SystemMenu(id ++, "设备管理","open","icon-role","admin/adminRoleManage");
        SystemMenu systemMenu3 = new SystemMenu(id ++, "系统参数","open","icon-menu","admin/adminMenuManage");
        systemMenu.setChildren(Arrays.asList(systemMenu1,systemMenu2,systemMenu3));
        systemMenus.add(systemMenu);
        MenuAdpater menuAdpater = new MenuAdpater(systemMenus);
        return menuAdpater.createEasyuiMenu();
    }

    @RequestMapping("/admin/adminUserManage")
    public String adminUserManage(){
        return "admin/adminUserManage";
    }

    @RequestMapping("/admin/adminRoleManage")
    public String adminRoleManage(){
        return "admin/adminRoleManage";
    }

    @RequestMapping("/admin/adminMenuManage")
    public String adminMenuManage(){
        return "admin/adminMenuManage";
    }

    @ResponseBody
    @RequestMapping("/admin/adminMenuManage/{id}/delete")
    public Long deleteMenu(@PathVariable Long id){
        return id;
    }

    @ResponseBody
    @RequestMapping("/admin/adminMenuManage/insertOrUpdate")
    public Long saveMenu(Long parentId, Long id, String text, String iconCls, String url) {
        System.out.println(parentId);
        System.out.println(id);
        System.out.println(text);
        System.out.println(iconCls);
        System.out.println(url);
        return 1L;
    }
}
