package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;

public class Role {
    private Long id;

    @EasyuiColumn(title = "角色名")
    private String name;

    @EasyuiColumn(title = "编号")
    private String sn;

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

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn == null ? null : sn.trim();
    }
}