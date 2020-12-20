package cn.edu.zjut.dao;

import cn.edu.zjut.po.Example;
import java.util.List;
import org.hibernate.Session;

public interface IExampleDAO {
    Session getSession();

    List findByHql(String var1);

    Example findById(Integer var1);

    Example findById1(Integer var1);

    void save(Example var1);

    void update(Example var1);

    void delete(Example var1);

    void merge(Example var1);
}