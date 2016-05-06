package com.csd.nandai.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2016-05-06.
 */
public class DateUtil {
    public String getTime(){
        Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置显示格式
        String nowTime="";
        nowTime= df.format(dt);
        return nowTime;
    }
}
