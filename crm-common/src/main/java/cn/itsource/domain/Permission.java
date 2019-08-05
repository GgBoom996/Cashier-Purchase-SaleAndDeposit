package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;

public class Permission {
    private Long id;

    @EasyuiColumn(title = "权限名")
    private String name;

    @EasyuiColumn(title = "权限路径")
    private String url;

    @EasyuiColumn(title = "权限描述")
    private String descs;

    @EasyuiColumn(title = "编号")
    private String sn;

    @EasyuiColumn(title = "菜单")
    private Menu menuId;

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

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs == null ? null : descs.trim();
    }

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }

    public Menu getMenuId() {
        return menuId;
    }

    public void setMenuId(Menu menuId) {
        this.menuId = menuId;
    }
}