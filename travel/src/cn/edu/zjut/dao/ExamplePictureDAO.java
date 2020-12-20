package cn.edu.zjut.dao;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePicture;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class ExamplePictureDAO extends BaseHibernateDAO implements IExamplePictureDAO {
    private Log log = LogFactory.getLog(ExamplePictureDAO.class);

    public ExamplePictureDAO() {
    }

    public List findByHql(String hql, Example example) {
        this.log.debug("finding ExamplePicture instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            queryObject.setProperties(example);
            return queryObject.list();
        } catch (RuntimeException var5) {
            this.log.error("find by hql failed", var5);
            throw var5;
        }
    }

    public String findById1(Integer Id) {
        this.log.debug("finding ExamplePicture instance by exampleId");
        List list = null;

        try {
            String hql = "from ExamplePicture";
            Query queryObject = this.getSession().createQuery(hql);
            list = queryObject.list();

            for(int i = 0; i < list.size(); ++i) {
                ExamplePicture e = (ExamplePicture)list.get(i);
                if (e.getExample().getExampleId() == Id) {
                    return e.getPicture1();
                }
            }

            return null;
        } catch (RuntimeException var7) {
            this.log.error("find failed", var7);
            throw var7;
        }
    }

    public void save(ExamplePicture instance) {
        this.log.debug("saving ExamplePicture instance");

        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }

    public void update(ExamplePicture instance) {
        this.log.debug("updating ExamplePicture instance");

        try {
            this.getSession().update(instance);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }

    public void delete(ExamplePicture instance) {
        this.log.debug("deleting ExamplePicture instance");

        try {
            this.getSession().delete(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;
        }
    }
}
