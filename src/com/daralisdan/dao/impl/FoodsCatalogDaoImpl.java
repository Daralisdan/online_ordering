package com.daralisdan.dao.impl;

import com.daralisdan.dao.FoodsCatalogDao;
import com.daralisdan.entity.FoodsCatalog;
import com.daralisdan.util.JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 2019/10/29,Create by yaodan
 */
public class FoodsCatalogDaoImpl implements FoodsCatalogDao {
    @Override
    public List<FoodsCatalog> getfoodsCatalog() {
        String sql = "SELECT * FROM t_foodcalalog";
        ResultSet resultSet = JDBC.query(sql);
        List<FoodsCatalog> list = new ArrayList<>();

        try {
            while (resultSet.next()) {
                FoodsCatalog foodsCatalog = new FoodsCatalog();
                foodsCatalog.setCalalogId(resultSet.getInt("calalog_id"));
                foodsCatalog.setCalalogName(resultSet.getString("calalog_name"));
                foodsCatalog.setCalalogDescrible(resultSet.getString("calalog_describle"));
                list.add(foodsCatalog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
