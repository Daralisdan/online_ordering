package com.daralisdan.entity;

/**
 * 2019/11/4,Create by yaodan
 */
public class Foods {
    //    foods_id  foods_name  foods_describle  foods_type  foods_img  foods_price  foods_people
    private Integer foodsId;
    private String foodsName;
    private String foodsdescrible;

    public Integer getFoodsId() {
        return foodsId;
    }

    public void setFoodsId(Integer foodsId) {
        this.foodsId = foodsId;
    }

    public String getFoodsName() {
        return foodsName;
    }

    public void setFoodsName(String foodsName) {
        this.foodsName = foodsName;
    }

    public String getFoodsdescrible() {
        return foodsdescrible;
    }

    public void setFoodsdescrible(String foodsdescrible) {
        this.foodsdescrible = foodsdescrible;
    }

    @Override
    public String toString() {
        return "Foods{" +
                "foodsId=" + foodsId +
                ", foodsName='" + foodsName + '\'' +
                ", foodsdescrible='" + foodsdescrible + '\'' +
                '}';
    }
}
