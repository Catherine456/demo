package cn.edu.zjut.dao;

import cn.edu.zjut.po.Apprise;
import java.util.List;

public interface IAppriseDAO {
    void save(Apprise var1);

    List getByDesignerId(String var1);
}
