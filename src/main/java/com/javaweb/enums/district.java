package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

//public enum  districtCode {
//    QUAN_1 ("Quận 1"),
//    QUAN_2 ("Quận 2"),
//    QUAN_3 ("Quận 3"),
//    QUAN_4 ("Quận 4"),
//    QUAN_5 ("Quận 5"),
//    QUAN_6 ("Quận 6"),
//    QUAN_7 ("Quận 7"),
//    QUAN_8 ("Quận 8"),
//    ;
//
//    private final String districtName;
//    districtCode(String districtName) {
//        this.districtName = districtName;
//    }
//
//    public String getDistrictName() {
//        return districtName;
//    }
//
//    public static Map<String,String> type(){
//        Map<String,String> listType = new HashMap<>();
//        for(districtCode item : districtCode.values()){
//            listType.put(item.toString() , item.districtName);
//        }
//        return listType;
//    }
//}
public enum district {
    QUAN_1 ("Quận 1"),
    QUAN_2 ("Quận 2"),
    QUAN_3 ("Quận 3"),
    QUAN_4 ("Quận 4"),
    QUAN_5 ("Quận 5"),
    QUAN_6 ("Quận 6"),
    QUAN_7 ("Quận 7"),
    QUAN_8 ("Quận 8"),
    QUAN_9 ("Quận 9"),
    QUAN_10 ("Quận 10"),
    QUAN_BINH_THANH ("Quận Bình Thạnh"),
    QUAN_THU_DUC ("Quận Thủ Đức");


    private final String districtName;
    district(String districtName){
        this.districtName = districtName;
    }
    public static Map<String,String> type(){
        Map<String,String> districts = new TreeMap<>();
        for(district item: district.values()){
            districts.put(item.toString(),item.districtName);
        }
        return districts;
    }

}