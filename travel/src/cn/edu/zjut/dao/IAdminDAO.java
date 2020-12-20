package cn.edu.zjut.dao;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import java.util.List;
import org.hibernate.Session;

public interface IAdminDAO {
    Session getSession();

    void delete(Employer var1);

    void delete(Designer var1);

    Designer findD(String var1);

    Employer findE(String var1);

    Integer findCount1();

    Integer findCount2();

    void update1(Example var1);

    List findByhql(String var1);

    Integer confirm(String var1, String var2);

    Designer findById(String var1);

    List findByHql(String var1);
}
