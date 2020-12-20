package cn.edu.zjut.dao;

import cn.edu.zjut.po.Needs;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class NeedsDAO extends BaseHibernateDAO implements INeedsDAO {
    private Log log = LogFactory.getLog(NeedsDAO.class);

    public NeedsDAO() {
    }

    public Needs findById(int id) {
        this.log.debug("finding Designer instance by exampleId");

        try {
            Needs n = (Needs)this.getSession().get(Needs.class, id);
            this.log.debug("find successful");
            return n;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }
    }

    public List findByHql(String hql) {
        this.log.debug("finding Needs instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var4) {
            this.log.error("find by hql failed", var4);
            throw var4;
        }
    }

    public void update(Needs instance) {
        this.log.debug("updating Needs instance");

        try {
            this.getSession().update(instance);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }

    public void save(Needs need) {
        this.log.debug("saving need instance");

        try {
            this.getSession().save(need);
            this.log.debug("save successfully!");
        } catch (RuntimeException var3) {
            this.log.error("save fail", var3);
            throw var3;
        }
    }

    public void delete(Needs need) {
        this.log.debug("delete need");

        try {
            this.getSession().delete(need);
        } catch (RuntimeException var3) {
            throw var3;
        }
    }

    public int find() {
        this.log.debug("finding maxId instance");

        try {
            Integer maxValue = (Integer)this.getSession().createQuery("select max( needsId )  from Needs").uniqueResult();
            return maxValue == null ? 0 : maxValue;
        } catch (RuntimeException var2) {
            this.log.error("find failed", var2);
            System.out.println("err");
            throw var2;
        }
    }
}
