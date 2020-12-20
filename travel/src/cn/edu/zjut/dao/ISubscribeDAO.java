package cn.edu.zjut.dao;

import cn.edu.zjut.po.Subscribe;

public interface ISubscribeDAO {
    void save(Subscribe var1);

    int find();

    Subscribe findById(int var1);

    void delete(Subscribe var1);

    void update(Subscribe var1);
}
