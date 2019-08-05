package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;

import java.util.ArrayList;
import java.util.List;

public class Menu {
    private Long id;

    @EasyuiColumn(title = "菜单名")
    private String name;

    @EasyuiColumn(title = "路径")
    private String url;

    @EasyuiColumn(title = "图标")
    private String icon;

    @EasyuiColumn(title = "一级菜单")
    private Long parentId;

    private List<Menu> children =new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", icon='" + icon + '\'' +
                ", parentId=" + parentId +
                ", children=" + children +
                '}';
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

}