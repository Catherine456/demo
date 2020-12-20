package cn.edu.zjut.dao;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePanorama;
import java.util.List;

public interface IExamplePanoramaDAO {
    List findByHql(String var1, Example var2);

    ExamplePanorama findById(String var1);

    void save(ExamplePanorama var1);

    void update(ExamplePanorama var1);

    void delete(ExamplePanorama var1);
}
