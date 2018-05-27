package com.music.util.tool;

import com.music.util.tool.StringUUID.StringUUIDUtil;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2018-04-06-11:34
 */

public class TestStringUUID {

    public static void main(String [] args){
        String StrGen= StringUUIDUtil.randomString(32);
        System.out.println(StrGen);
        String NumGen=StringUUIDUtil.randomNumStr(8);
        System.out.println(NumGen);
        System.out.println("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".length());
        String StrGen1=StringUUIDUtil.getSeqFive(32);
        System.out.println(StrGen1);
    }

}
