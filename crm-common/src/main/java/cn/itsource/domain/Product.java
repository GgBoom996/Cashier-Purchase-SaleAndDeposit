package cn.itsource.domain;

import cn.itsource.util.EasyuiColumn;

import java.math.BigDecimal;

public class Product {
    private Long id;
    @EasyuiColumn(title = "进货价格")
    private BigDecimal inputPrice;
    @EasyuiColumn(title = "销售价格")
    private BigDecimal outPrice;
    @EasyuiColumn(title = "库存")
    private Long productNum;
    @EasyuiColumn(title = "产品名字")
    private String productName;
    @EasyuiColumn(title = "产品编号")
    private Long productCode;

    @EasyuiColumn(title = "类型")
    private Producttype type;
    @EasyuiColumn(title = "单位")
    private String unitId;
    @EasyuiColumn(title = "厂商")
    private String brandId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BigDecimal getInputPrice() {
        return inputPrice;
    }

    public void setInputPrice(BigDecimal inputPrice) {
        this.inputPrice = inputPrice;
    }

    public BigDecimal getOutPrice() {
        return outPrice;
    }

    public void setOutPrice(BigDecimal outPrice) {
        this.outPrice = outPrice;
    }

    public Long getProductNum() {
        return productNum;
    }

    public void setProductNum(Long productNum) {
        this.productNum = productNum;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Long getProductCode() {
        return productCode;
    }

    public void setProductCode(Long productCode) {
        this.productCode = productCode;
    }

    public Producttype getType() {
        return type;
    }

    public void setType(Producttype type) {
        this.type = type;
    }

    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId;
    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", inputPrice=" + inputPrice +
                ", outPrice=" + outPrice +
                ", productNum=" + productNum +
                ", productName='" + productName + '\'' +
                ", productCode=" + productCode +
                ", typeId='" + type + '\'' +
                ", unitId='" + unitId + '\'' +
                ", brandId='" + brandId + '\'' +
                '}';
    }
}
