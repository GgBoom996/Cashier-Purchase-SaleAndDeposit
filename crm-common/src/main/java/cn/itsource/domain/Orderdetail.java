package cn.itsource.domain;

import java.math.BigDecimal;

public class Orderdetail {

    private Long id;
    //商品详情
    private Long productId;

    private Product product;
    //同类商品数量
    private Long productNum;
    //同类商品价格
    private BigDecimal prodctTotalnum;
    //关联字段
    private Long purchasingandpurchasingId;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getProductNum() {
        return productNum;
    }

    public void setProductNum(Long productNum) {
        this.productNum = productNum;
    }

    public BigDecimal getProdctTotalnum() {
        return prodctTotalnum;
    }

    public void setProdctTotalnum(BigDecimal prodctTotalnum) {
        this.prodctTotalnum = prodctTotalnum;
    }

    public Long getPurchasingandpurchasingId() {
        return purchasingandpurchasingId;
    }

    public void setPurchasingandpurchasingId(Long purchasingandpurchasingId) {
        this.purchasingandpurchasingId = purchasingandpurchasingId;
    }

    @Override
    public String toString() {
        return "Orderdetail{" +
                "id=" + id +
                ", productId=" + productId +
                ", product=" + product +
                ", productNum=" + productNum +
                ", prodctTotalnum=" + prodctTotalnum +
                ", purchasingandpurchasingId=" + purchasingandpurchasingId +
                '}';
    }
}