package com.music.util.tool.StringUUID;

import org.apache.commons.lang3.StringUtils;

import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by
 *
 * @author=蓝十七
 * @on 2018-04-06-11:29
 */

public class StringUUIDUtil {

    private static Random strGen = new Random();;
    private static Random numGen = new Random();;
    private static char[] numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();;
    private static char[] numbers = ("0123456789").toCharArray();;
    /** * 产生随机字符串 * */
    public static final String randomString(int length) {
        if (length < 1) {
            return null;
        }
        char[] randBuffer = new char[length];
        for (int i = 0; i < randBuffer.length; i++) {
            randBuffer[i] = numbersAndLetters[strGen.nextInt(61)];
        }
        return new String(randBuffer);
    }

    /** * 产生随机数值字符串 * */
    public static final String randomNumStr(int length) {
        if (length < 1) {
            return null;
        }
        char[] randBuffer = new char[length];
        for (int i = 0; i < randBuffer.length; i++) {
            randBuffer[i] = numbers[numGen.nextInt(9)];//这里参数代表着基础数据长度-1
        }
        return new String(randBuffer);


    }

    private static int maxvaluefive=99999999;
    private static int minvaluefive=0;
    private static AtomicInteger atomic = new AtomicInteger(minvaluefive);
    /**  生成序列号 */
    public static String getSeqFive(int coverPad) {
        for (;;) {
            int current = atomic.get();
            int newValue = current >= maxvaluefive ? minvaluefive : current + 1;
            if (atomic.compareAndSet(current, newValue)) {
                return StringUtils.leftPad(String.valueOf(current), coverPad, "0");
            }
        }
    }

}
