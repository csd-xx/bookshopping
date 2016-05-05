package com.csd.nandai.util;

/**
 * Created by Administrator on 2016-05-04.
 */
public class PageUtil {
    private int curPage;// 当前页数
    private int pageSize;// 每页显示多少条记录

    public PageUtil(int curPage) {
        this(curPage, 10);
    }

    public PageUtil(int curPage, int pageSize) {
        this.curPage = curPage;
        this.pageSize = pageSize;
    }

    public int getStart() {
        return (curPage - 1) * pageSize;
    }

    public int getEnd() {
        return curPage * pageSize;
    }
}
