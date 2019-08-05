package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Supplier {
    private Long id;

    @EasyuiColumn(title = "供应商")
    private String supplier;

    @EasyuiColumn(title = "应付欠款")
    private Long payable;

    @EasyuiColumn(title = "应收退款")
    private Long refundsReceivable;

    @EasyuiColumn(title = "联系人")
    private String contacts;

    @EasyuiColumn(title = "联系电话")
    private Long contactNumber;

    @EasyuiColumn(title = "添加时间")
    private Date addTime = new Date();

    @EasyuiColumn(title = "操作人员")
    private Integer employeeId;

    @EasyuiColumn(title = "备注")
    private String remarks;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public Long getPayable() {
        return payable;
    }

    public void setPayable(Long payable) {
        this.payable = payable;
    }

    public Long getRefundsReceivable() {
        return refundsReceivable;
    }

    public void setRefundsReceivable(Long refundsReceivable) {
        this.refundsReceivable = refundsReceivable;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public Long getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(Long contactNumber) {
        this.contactNumber = contactNumber;
    }

    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", locale="zh", timezone="GMT+8")
    public Date getAddTime() {
        return addTime;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", supplier='" + supplier + '\'' +
                ", payable=" + payable +
                ", refundsReceivable=" + refundsReceivable +
                ", contacts='" + contacts + '\'' +
                ", contactNumber=" + contactNumber +
                ", addTime=" + addTime +
                ", employeeId=" + employeeId +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}