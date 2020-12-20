package cn.edu.zjut.dao;

import cn.edu.zjut.po.Employer;
import java.util.List;

public interface IEmployerDAO {
    List findByHql(String var1);

    Employer findById(String var1);

    void save(Employer var1);

    void update(Employer var1);

    void delete(Employer var1);

    String findEmp();
}