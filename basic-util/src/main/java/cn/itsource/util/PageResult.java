package cn.itsource.util;

import java.util.ArrayList;
import java.util.List;

public class PageResult<T> {
    private long total = 0;

    private List rows = new ArrayList<>();

    public PageResult() {
    }

    public PageResult(long total, List rows) {
        this.total = total;
        this.rows = rows;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
