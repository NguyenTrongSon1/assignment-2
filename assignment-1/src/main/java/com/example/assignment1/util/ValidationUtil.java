package com.example.assignment1.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationUtil {
    // Khuôn URL
    private static Pattern patternUrl = Pattern.compile("^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]");

    // Khuôn EMAIL
    private static Pattern patternEmail = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\\\.[A-Z]{2,6}$");

    private  static Pattern patternName = Pattern.compile("^[A-Za-z0-9_]{7}");
    public static boolean checkUrl(String url) {
        Matcher matcher = patternUrl.matcher(url);
        return matcher.find();
    }

    public static boolean checkEmail(String url) {
        Matcher matcher = patternEmail.matcher(url);
        return matcher.find();
    }
    public static boolean checkName(String url) {
        Matcher matcher = patternName.matcher(url);
        return matcher.find();
    }
}
