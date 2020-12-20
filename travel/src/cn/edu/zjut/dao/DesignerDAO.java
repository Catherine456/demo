

package cn.edu.zjut.dao;

import cn.edu.zjut.po.Designer;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.query.Query;

public class DesignerDAO extends BaseHibernateDAO implements IDesignerDAO {
    private Log log = LogFactory.getLog(DesignerDAO.class);

    public DesignerDAO() {
    }

    public List findByHql(String hql) {
        this.log.debug("finding Designer instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var4) {
            this.log.error("find by hql failed", var4);
            throw var4;
        }
    }

    public Designer findById(String id) {
        this.log.debug("finding Designer instance by exampleId");

        try {
            Designer e = (Designer)this.getSession().get(Designer.class, id);
            this.log.debug("find successful");
            return e;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }
    }

    public void save(Designer instance) {
        this.log.debug("saving Designer instance");

        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }

    public void update(Designer instance) {
        this.log.debug("updating Designer instance");

        try {
            this.getSession().update(instance);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }

    public void delete(Designer instance) {
        this.log.debug("deleting Designer instance");

        try {
            this.getSession().delete(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;
        }
    }

    public Object merge(Designer instance) {
        this.log.debug("merging Designer instance");

        try {
            return this.getSession().merge(instance);
        } catch (RuntimeException var3) {
            this.log.error("merge failed", var3);
            throw var3;
        }
    }

    public String findDes() {
        this.log.debug("finding maxId instance");

        try {
            String maxValue = (String)this.getSession().createQuery("select max(designerId) from Designer ").uniqueResult();
            return maxValue == null ? null : maxValue;
        } catch (RuntimeException var2) {
            this.log.error("find failed", var2);
            System.out.println("err");
            throw var2;
        }
    }
}
