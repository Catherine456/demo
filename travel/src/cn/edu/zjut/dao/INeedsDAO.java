package cn.edu.zjut.dao;

import cn.edu.zjut.po.Needs;
import java.util.List;

public interface INeedsDAO {
    void save(Needs var1);

    int find();

    List findByHql(String var1);

    Needs findById(int var1);

    void update(Needs var1);

    void delete(Needs var1);
}