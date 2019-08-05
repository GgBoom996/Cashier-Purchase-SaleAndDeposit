package cn.itsource.domain;


public class Producttype{

    private Long id;
    //类型名字
    private String typeName;

    private Long parentId;

    public Long getParentId() {
        return parentId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return typeName;
    }

    public void setName(String typeName) {
        this.typeName = typeName;
    }


    @Override
    public String toString() {
        return "Producttype{" +
                "id=" + id +
                ", typeName='" + typeName + '\'' +
                ", parentId=" + parentId +
                '}';
    }
}