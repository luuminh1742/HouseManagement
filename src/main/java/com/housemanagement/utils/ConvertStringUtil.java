package com.housemanagement.utils;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class ConvertStringUtil {

	private static String chuanHoa(String str) {
        str = str.trim();
        str = str.replaceAll("\\s+", " ");
        return str;
    }
	private static String chuanHoaDanhTuRieng(String str) {
        str = chuanHoa(str);
        String temp[] = str.split(" ");
        str = ""; // ? ^-^
        for (int i = 0; i < temp.length; i++) {
            str += String.valueOf(temp[i].charAt(0)).toUpperCase() + temp[i].substring(1);
            if (i < temp.length - 1) // ? ^-^
                str += " ";
        }
        return str;
    }
    private static String removeAccent(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(temp).replaceAll("")
                .replaceAll("Đ", "D")
                .replace("đ", "");
    }
    public static  String toCode(String s){
        String result = removeAccent(s);
        result = chuanHoaDanhTuRieng(result).trim().toLowerCase();
        result = result.replace(' ','-');
        return result;
    }
    
    public static  String toUsername(String s){
        String result = removeAccent(s);
        result = chuanHoaDanhTuRieng(result).trim().toLowerCase();
        result = result.replace(' ','_');
        return result;
    }
}
