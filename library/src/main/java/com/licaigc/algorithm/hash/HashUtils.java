package com.licaigc.algorithm.hash;

import com.licaigc.lang.Transformer;

import java.security.MessageDigest;

/**
 * Created by walfud on 2015/11/18.
 */
public class HashUtils {

    public static final String TAG = "HashUtils";

    /**
     *
     * @param string
     * @return `null` if something wrong
     */
    public static String md5(String string) {
        String md5 = null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            byte[] bytesMd5 = messageDigest.digest(string.getBytes());
            md5 = Transformer.bytes2String(bytesMd5);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return md5;
    }
}
