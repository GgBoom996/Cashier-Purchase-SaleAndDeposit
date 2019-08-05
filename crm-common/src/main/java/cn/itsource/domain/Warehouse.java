package cn.itsource.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Warehouse {
    private Long id;
    //管理员
    private String contacts;
    //地址
    private String warehouseAddress;
    //最后入库时间
    private Date addTime;
    //状态
    private Boolean warehouseStatus;
    //对应店铺
    private Long storeId;

    private Storemanage storemanage;
    //总价值
    private BigDecimal productValue;

    private List<Warehousedetail> warehousedetails = new ArrayList<>();

    public List<Warehousedetail> getWarehousedetails() {
        return warehousedetails;
    }

    public void setWarehousedetails(List<Warehousedetail> warehousedetails) {
        this.warehousedetails = warehousedetails;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getWarehouseAddress() {
        return warehouseAddress;
    }

    public void setWarehouseAddress(String warehouseAddress) {
        this.warehouseAddress = warehouseAddress;
    }
    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", locale="zh", timezone="GMT+8")
    public Date getAddTime() {
        return addTime;
    }
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Boolean getWarehouseStatus() {
        return warehouseStatus;
    }

    public void setWarehouseStatus(Boolean warehouseStatus) {
        this.warehouseStatus = warehouseStatus;
    }

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public BigDecimal getProductValue() {
        return productValue;
    }

    public void setProductValue(BigDecimal productValue) {
        this.productValue = productValue;
    }

    public Storemanage getStoremanage() {
        return storemanage;
    }

    public void setStoremanage(Storemanage storemanage) {
        this.storemanage = storemanage;
    }

    @Override
    public String toString() {
        return "Warehouse{" +
                "id=" + id +
                ", contacts='" + contacts + '\'' +
                ", warehouseAddress='" + warehouseAddress + '\'' +
                ", addTime=" + addTime +
                ", warehouseStatus=" + warehouseStatus +
                ", storeId=" + storeId +
                ", productValue=" + productValue +
                ", warehousedetails=" + warehousedetails +
                '}';
    }
}