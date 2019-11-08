package com.daralisdan.action;

import com.daralisdan.entity.SystemField;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;

import java.util.*;

/**
 * 2019/10/27,Create by yaodan
 */
public class SystemInfo {

    public static Map<String, String> getSystemInfo() {
        Map<String, String> map = new HashMap<>();
        //获取当前系统配置信息
        Properties properties = System.getProperties();
//        System.out.println(properties);


        //获取操作系统的版本
        String property = properties.getProperty("os.name");
        map.put("操作系统名称", property);

        //操作系统名称，架构
        property = properties.getProperty("os.arch");
        map.put("操作系统架构名称", property);

        //用户目录，临时目录
        property = properties.getProperty("user.dir");
        map.put("用户目录，临时目录", property);

        //jdk版本
        property = properties.getProperty("java.version");
        map.put("jdk版本", property);

        //jdk安装目录
        property = properties.getProperty("java.home");
        map.put("jdk安装目录", property);

        //调用内存的静态方法，把数据存入map中
        String mermory = null;
        try {
            mermory = getMermory();
        } catch (SigarException e) {
            e.printStackTrace();
        }
        map.put("总内存/剩余内存", mermory);
        return map;
    }
public List<SystemField> getField(){
    List<SystemField> list=new ArrayList<>();
    Map<String, String> map=SystemInfo.getSystemInfo();
    for(Map.Entry<String, String> entry : map.entrySet()){
        SystemField systemField=new SystemField();

        String mapKey = entry.getKey();
        String mapValue = entry.getValue();
        systemField.setKey(mapKey);
        systemField.setValue(mapValue);
        list.add(systemField);
        System.out.println(mapKey+":"+mapValue);
    }
    return list;
}
    //内存
    public static String getMermory() throws SigarException {
        Sigar sigar = new Sigar();
        //总内存/剩余内存
        String total = sigar.getMem().getTotal() / 1024L / 1024L + "MB/" + sigar.getMem().getFree() / 1024L / 1024L + "MB";
        return total;

    }

    public static void main(String[] args){
        //获取静态方法中的存入map中的对象
        Map<String, String> rs = SystemInfo.getSystemInfo();
        //打印系统属性的所有信息
        System.out.println(rs);
//        System.out.println(Properties);
        try {
            System.out.println(getMermory());
        } catch (SigarException e) {
            e.printStackTrace();
        }
    }
}
