package cn.edu.zjut.dao;

import cn.edu.zjut.po.Designer;
import java.util.List;
import org.hibernate.Session;

public interface IDesignerDAO {
    Session getSession();

    List findByHql(String var1);

    Designer findById(String var1);

    void save(Designer var1);

    void update(Designer var1);

    void delete(Designer var1);

    Object merge(Designer var1);

    String findDes();
}
