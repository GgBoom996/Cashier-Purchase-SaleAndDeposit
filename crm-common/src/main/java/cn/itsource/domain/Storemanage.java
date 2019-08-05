package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Storemanage {
    private Long id;
    @EasyuiColumn(title = "店铺名")
    private String storeName;
    @EasyuiColumn(title = "店长")
    private String buinour;
    @EasyuiColumn(title = "联系方式")
    private Long buinourPhone;
    @EasyuiColumn(title = "店铺状态")
    private Boolean storeCondition;
    @EasyuiColumn(title = "店铺地址")
    private String storeAddress;
    @EasyuiColumn(title = "注册时间")
    private Date registrationDate = new Date();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getBuinour() {
        return buinour;
    }

    public void setBuinour(String buinour) {
        this.buinour = buinour;
    }

    public Long getBuinourPhone() {
        return buinourPhone;
    }

    public void setBuinourPhone(Long buinourPhone) {
        this.buinourPhone = buinourPhone;
    }

    public Boolean getStoreCondition() {
        return storeCondition;
    }

    public void setStoreCondition(Boolean storeCondition) {
        this.storeCondition = storeCondition;
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }

    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", locale="zh", timezone="GMT+8")
    public Date getRegistrationDate() {
        return registrationDate;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    @Override
    public String toString() {
        return "Storemanage{" +
                "id=" + id +
                ", storeName='" + storeName + '\'' +
                ", buinour='" + buinour + '\'' +
                ", buinourPhone=" + buinourPhone +
                ", storeCondition=" + storeCondition +
                ", storeAddress='" + storeAddress + '\'' +
                ", registrationDate=" + registrationDate +
                '}';
    }
}