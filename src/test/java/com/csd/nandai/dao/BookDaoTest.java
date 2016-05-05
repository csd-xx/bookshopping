package com.csd.nandai.dao;

import config.SpringTest;
import net.sf.json.JSONArray;
import org.junit.Test;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by Administrator on 2016-05-04.
 */
public class BookDaoTest extends SpringTest{
    @Resource
    private BookDao bookDao;
    @Test
    public void countAll(){
        System.out.println("开始查询");
        int x=bookDao.countAll();
        JSONArray js=JSONArray.fromObject(x);
        System.out.println(js.toString());
        System.out.println("结束查询");
    }
}