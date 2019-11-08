package com.daralisdan.service;

import com.daralisdan.dao.FoodsCatalogDao;
import com.daralisdan.dao.impl.FoodsCatalogDaoImpl;
import com.daralisdan.entity.FoodsCatalog;

import java.util.List;

/**
 * 2019/10/29,Create by yaodan
 */
public class FoodsCatalogService {
    public List<FoodsCatalog> getfoodsCatalog() {  //调用实现层
        FoodsCatalogDao userdao = new FoodsCatalogDaoImpl();
        //查询到的数据
        return userdao.getfoodsCatalog();

    }
}
