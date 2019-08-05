package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class MyPage {
    private Long id;

    @EasyuiColumn(title = "店铺名称")
    private String shopName;

    @EasyuiColumn(title = "店主姓名")
    private String shopkeepersName;

    @EasyuiColumn(title = "微信账号")
    private Integer wechatAccount;

    @EasyuiColumn(title = "行业类型")
    private String industryType;

    @EasyuiColumn(title = "店铺简称")
    private String shopAbbreviation;

    @EasyuiColumn(title = "店铺电话")
    private Integer shopPhone;

    @EasyuiColumn(title = "注册时间")
    private Date registrationTime;

    @EasyuiColumn(title = "店铺地址")
    private String shopAddress;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopkeepersName() {
        return shopkeepersName;
    }

    public void setShopkeepersName(String shopkeepersName) {
        this.shopkeepersName = shopkeepersName;
    }

    public Integer getWechatAccount() {
        return wechatAccount;
    }

    public void setWechatAccount(Integer wechatAccount) {
        this.wechatAccount = wechatAccount;
    }

    public String getIndustryType() {
        return industryType;
    }

    public void setIndustryType(String industryType) {
        this.industryType = industryType;
    }

    public String getShopAbbreviation() {
        return shopAbbreviation;
    }

    public void setShopAbbreviation(String shopAbbreviation) {
        this.shopAbbreviation = shopAbbreviation;
    }

    public Integer getShopPhone() {
        return shopPhone;
    }

    public void setShopPhone(Integer shopPhone) {
        this.shopPhone = shopPhone;
    }

    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", locale="zh", timezone="GMT+8")
    public Date getRegistrationTime() {
        return registrationTime;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setRegistrationTime(Date registrationTime) {
        this.registrationTime = registrationTime;
    }

    public String getShopAddress() {
        return shopAddress;
    }

    public void setShopAddress(String shopAddress) {
        this.shopAddress = shopAddress;
    }
}