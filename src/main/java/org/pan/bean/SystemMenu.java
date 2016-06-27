package org.pan.bean;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/6/3.
 */
@Entity
public class SystemMenu extends AbstractObject{
    private String text;
    private String state;
    private String iconCls;
    private String url;
    @OneToMany
    private List<SystemMenu> children;
    @ManyToOne
    private SystemMenu parent;

    public SystemMenu() {
    }

    public SystemMenu(Long id, String text, String state,String iconCls,String url) {
        super.id = id;
        this.text = text;
        this.state = state;
        this.iconCls = iconCls;
        this.url = url;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public SystemMenu getParent() {
        return parent;
    }

    public void setParent(SystemMenu parent) {
        this.parent = parent;
    }

    public List<SystemMenu> getChildren() {
        return children;
    }

    public void setChildren(List<SystemMenu> children) {
        this.children = children;
    }


}
