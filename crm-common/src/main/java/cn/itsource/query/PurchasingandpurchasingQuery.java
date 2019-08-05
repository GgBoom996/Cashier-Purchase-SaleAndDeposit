package cn.itsource.query;

import cn.itsource.query.BaseQuery;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author: wenbing
 * @Date: 2018/10/18 0:18
 * @Version 1.0
 */
public class PurchasingandpurchasingQuery extends BaseQuery {

    private Long storeId;

    private Date contractStartDt;

    private Date contractEndDt;

    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public Date getContractStartDt() {
        return contractStartDt;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setContractStartDt(Date contractStartDt) {
        this.contractStartDt = contractStartDt;
    }

    public Date getContractEndDt() {
        return contractEndDt;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setContractEndDt(Date contractEndDt) {
        this.contractEndDt = contractEndDt;
    }
}
