package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Employee {
    private Long id;
    @EasyuiColumn(title = "姓名")
    private String username;
    @EasyuiColumn(title = "密码")
    private String password;
    @EasyuiColumn(title = "年龄")
    private Integer age;

    @EasyuiColumn(title = "岗位")

    private String postId;
    @EasyuiColumn(title = "电话")
    private Integer iphone;
    @EasyuiColumn(title = "薪酬")
    private Integer pay;
    @EasyuiColumn(title = "店铺")
    private String shopId;
    @EasyuiColumn(title = "入职时间")
    private Date initiationtime;
    @EasyuiColumn(title = "添加时间")
    private Date addtime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public Integer getIphone() {
        return iphone;
    }

    public void setIphone(Integer iphone) {
        this.iphone = iphone;
    }

    public Integer getPay() {
        return pay;
    }

    public void setPay(Integer pay) {
        this.pay = pay;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

   /* @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss", locale="zh", timezone="GMT+8")
    public Date getInitiationtime() {
        return initiationtime;
    }
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setInitiationtime(Date initiationtime) {
        this.initiationtime = initiationtime;
    }
    @JsonFormat(pattern="yyyy-MM-dd hh:mm:ss ", locale="zh", timezone="GMT+8")
    public Date getAddtime() {
        return addtime;
    }
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }*/
   @JsonFormat(pattern="yyyy-MM-dd", locale="zh", timezone="GMT+8")
    public Date getInitiationtime() {
        return initiationtime;
    }
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setInitiationtime(Date initiationtime) {
        this.initiationtime = initiationtime;
    }
    @JsonFormat(pattern="yyyy-MM-dd", locale="zh", timezone="GMT+8")
    public Date getAddtime() {
        return addtime;
    }
    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", age=" + age +
                ", postId='" + postId + '\'' +
                ", iphone=" + iphone +
                ", pay=" + pay +
                ", shopId='" + shopId + '\'' +
                ", initiationtime=" + initiationtime +
                ", addtime=" + addtime +
                '}';
    }

    public Employee(String username, String password, Integer age, String postId, Integer iphone, Integer pay, String shopId, Date initiationtime, Date addtime) {
        this.username = username;
        this.password = password;
        this.age = age;
        this.postId = postId;
        this.iphone = iphone;
        this.pay = pay;
        this.shopId = shopId;
        this.initiationtime = initiationtime;
        this.addtime = addtime;
    }

    public Employee() {
    }
}