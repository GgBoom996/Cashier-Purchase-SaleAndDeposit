package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.math.BigDecimal;
import java.util.Date;

public class Member {
    private Long id;
    @EasyuiColumn(title = "会员账号")
    private String userName;
    @EasyuiColumn(title = "会员昵称")
    private String nickName;
    @EasyuiColumn(title = "会员密码")
    private String password;
    @EasyuiColumn(title = "会员电话")
    private String tel;
    @EasyuiColumn(title = "会员等级")
    private Integer state;
    @EasyuiColumn(title = "会员积分")
    private Long integral;
    @EasyuiColumn(title = "会员余额")
    private BigDecimal balance;
    @EasyuiColumn(title = "所属商店")
    private Long storemanageId;
    @EasyuiColumn(title = "总充值金额")
    private BigDecimal total;
    @EasyuiColumn(title = "会员生日")
    private Date birthday;

    public Storemanage getStoremanage() {
        return storemanage;
    }

    public void setStoremanage(Storemanage storemanage) {
        this.storemanage = storemanage;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="storemanage_id")
    private Storemanage storemanage;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Long getIntegral() {
        return integral;
    }

    public void setIntegral(Long integral) {
        this.integral = integral;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    public Long getStoremanageId() {
        return storemanageId;
    }

    public void setStoremanageId(Long storemanageId) {
        this.storemanageId = storemanageId;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    @JsonFormat(pattern="MM-dd", locale="zh", timezone="GMT+8")
    public Date getBirthday() {
        return birthday;
    }

    @DateTimeFormat(pattern="MM-dd")
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Member() {
    }

    public Member(Long id, String userName, String nickName, String password, String tel, Integer state, Long integral, BigDecimal balance, Long storemanageId, BigDecimal total, Date birthday) {
        this.id = id;
        this.userName = userName;
        this.nickName = nickName;
        this.password = password;
        this.tel = tel;
        this.state = state;
        this.integral = integral;
        this.balance = balance;
        this.storemanageId = storemanageId;
        this.total = total;
        this.birthday = birthday;
    }
}