package cn.edu.zjut.dao;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePicture;
import java.util.List;
import org.hibernate.Session;

public interface IExamplePictureDAO {
    Session getSession();

    List findByHql(String var1, Example var2);

    String findById1(Integer var1);

    void save(ExamplePicture var1);

    void update(ExamplePicture var1);

    void delete(ExamplePicture var1);
}