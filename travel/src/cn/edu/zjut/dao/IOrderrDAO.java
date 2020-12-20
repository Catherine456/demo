package cn.edu.zjut.dao;

import cn.edu.zjut.po.Orderr;

public interface IOrderrDAO {
    void save(Orderr var1);

    Orderr findById(String var1);

    void update(Orderr var1);
}