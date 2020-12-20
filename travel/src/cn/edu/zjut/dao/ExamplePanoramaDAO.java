package cn.edu.zjut.dao;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePanorama;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class ExamplePanoramaDAO extends BaseHibernateDAO implements IExamplePanoramaDAO {
    private Log log = LogFactory.getLog(ExamplePanoramaDAO.class);

    public ExamplePanoramaDAO() {
    }

    public List findByHql(String hql, Example example) {
        this.log.debug("finding ExamplePanorama instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            queryObject.setProperties(example);
            return queryObject.list();
        } catch (RuntimeException var5) {
            this.log.error("find by hql failed", var5);
            throw var5;
        }
    }

    public ExamplePanorama findById(String id) {
        this.log.debug("finding ExamplePanorama instance by exampleId");

        try {
            ExamplePanorama e = (ExamplePanorama)this.getSession().get(ExamplePanorama.class, id);
            this.log.debug("find successful");
            return e;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }
    }

    public void save(ExamplePanorama instance) {
        this.log.debug("saving ExamplePanorama instance");

        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }

    public void update(ExamplePanorama instance) {
        this.log.debug("updating ExamplePanorama instance");

        try {
            this.getSession().update(instance);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }

    public void delete(ExamplePanorama instance) {
        this.log.debug("deleting ExamplePanorama instance");

        try {
            this.getSession().delete(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;
        }
    }
}
