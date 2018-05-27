package com.music.entity;

import com.music.util.GenerateUUidUtil;

import java.util.UUID;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2017-11-21-20:15
 */

public class Test {

    public static void main(String [] args){
        for (int i=0;i<10;i++){
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            System.out.println(uuid);
        }
        System.out.println(GenerateUUidUtil.generateShortUuid(8));
        System.out.println(GenerateUUidUtil.generateRandomStr(8));
    }



}
