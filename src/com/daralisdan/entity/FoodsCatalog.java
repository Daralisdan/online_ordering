package com.daralisdan.entity;

/**
 * 2019/10/29,Create by yaodan
 */
public class FoodsCatalog {
    private Integer calalogId;
    private String calalogName;
    private String calalogDescrible;

    public Integer getCalalogId() {
        return calalogId;
    }

    public void setCalalogId(Integer calalogId) {
        this.calalogId = calalogId;
    }

    public String getCalalogName() {
        return calalogName;
    }

    public void setCalalogName(String calalogName) {
        this.calalogName = calalogName;
    }

    public String getCalalogDescrible() {
        return calalogDescrible;
    }

    public void setCalalogDescrible(String calalogDescrible) {
        this.calalogDescrible = calalogDescrible;
    }

    @Override
    public String toString() {
        return "FoodsCatalog{" +
                "calalogId=" + calalogId +
                ", calalogName='" + calalogName + '\'' +
                ", calalogDescrible='" + calalogDescrible + '\'' +
                '}';
    }
}
