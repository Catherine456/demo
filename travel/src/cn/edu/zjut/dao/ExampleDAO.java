package cn.edu.zjut.dao;

import cn.edu.zjut.po.Example;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class ExampleDAO extends BaseHibernateDAO implements IExampleDAO {
    private Log log = LogFactory.getLog(ExampleDAO.class);

    public ExampleDAO() {
    }

    public List findByHql(String hql) {
        this.log.debug("finding Example instance by hql");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var4) {
            this.log.error("find by hql failed", var4);
            throw var4;
        }
    }

    public Example findById(Integer id) {
        this.log.debug("finding Example instance by exampleId");

        try {
            Example e = (Example)this.getSession().get(Example.class, id);
            this.log.debug("find successful");
            return e;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }
    }

    public Example findById1(Integer id) {
        this.log.debug("finding Example instance by exampleId");
        List list = null;

        try {
            String hql = "from Example";
            Query queryObject = this.getSession().createQuery(hql);
            list = queryObject.list();
            if (queryObject.list() != null) {
                System.out.println("aaaaaaa");

                for(int i = 0; i < list.size(); ++i) {
                    Example e = (Example)list.get(i);
                    if (e.getExampleId() == id) {
                        System.out.println("gkhjhilu");
                        return e;
                    }
                }
            }

            System.out.println("nuugdjasgdygak");
            return null;
        } catch (RuntimeException var7) {
            this.log.error("find failed", var7);
            throw var7;
        }
    }

    public void save(Example instance) {
        this.log.debug("saving Example instance");

        try {
            this.getSession().save(instance);
            this.log.debug("save successful");
        } catch (RuntimeException var3) {
            this.log.error("save failed", var3);
            throw var3;
        }
    }

    public void update(Example instance) {
        this.log.debug("updating Example instance");

        try {
            this.getSession().merge(instance);
            this.log.debug("update successful");
        } catch (RuntimeException var3) {
            this.log.error("update failed", var3);
            throw var3;
        }
    }

    public void delete(Example instance) {
        this.log.debug("deleting Example instance");

        try {
            this.getSession().delete(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;
        }
    }

    public void merge(Example instance) {
        this.log.debug("deleting Example instance");

        try {
            this.getSession().merge(instance);
            this.log.debug("delete successful");
        } catch (RuntimeException var3) {
            this.log.error("delete failed", var3);
            throw var3;
        }
    }
}
