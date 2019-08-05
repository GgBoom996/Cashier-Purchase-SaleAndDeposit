package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Purchasingandpurchasing {
    private Long id;
    @EasyuiColumn(title = "订单编号")
    private String documentNumber;
    //采购订单明细
    private List<Orderdetail> orderdetails = new ArrayList<>();

    @EasyuiColumn(title = "商品总数")
    private Long totalAmount;
    @EasyuiColumn(title = "总金额")
    private BigDecimal paymentAmount;
    @EasyuiColumn(title = "进货门店")
    private Long storemanageId;
    //进货门店
    private Storemanage storemanage;

    @EasyuiColumn(title = "采购时间")
    private Date makeTime;
    //订单状态
    private Boolean orderStatus;

    @EasyuiColumn(title = "备注")
    private String remarks;

    public Boolean getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Boolean orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Storemanage getStoremanage() {
        return storemanage;
    }

    public void setStoremanage(Storemanage storemanage) {
        this.storemanage = storemanage;
    }

    public List<Orderdetail> getOrderdetails() {
        return orderdetails;
    }

    public void setOrderdetails(List<Orderdetail> orderdetails) {
        this.orderdetails = orderdetails;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDocumentNumber() {
        return documentNumber;
    }

    public void setDocumentNumber(String documentNumber) {
        this.documentNumber = documentNumber;
    }



    public Long getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Long totalAmount) {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(BigDecimal paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Long getStoremanageId() {
        return storemanageId;
    }

    public void setStoremanageId(Long storemanageId) {
        this.storemanageId = storemanageId;
    }
    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", locale="zh", timezone="GMT+8")
    public Date getMakeTime() {
        return makeTime;
    }
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setMakeTime(Date makeTime) {
        this.makeTime = makeTime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "Purchasingandpurchasing{" +
                "id=" + id +
                ", documentNumber='" + documentNumber + '\'' +
                ", orderdetails=" + orderdetails +
                ", totalAmount=" + totalAmount +
                ", paymentAmount=" + paymentAmount +
                ", storemanageId=" + storemanageId +
                ", storemanage=" + storemanage +
                ", makeTime=" + makeTime +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}