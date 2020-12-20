package cn.edu.zjut.dao;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class AdminDAO extends BaseHibernateDAO implements IAdminDAO {
    private Log log = LogFactory.getLog(AdminDAO.class);

    public AdminDAO() {
    }

    public void delete(Employer employer) {
        this.log.debug("logout instance");

        try {
            this.getSession().delete(employer);
        } catch (RuntimeException var3) {
            throw var3;
        }
    }

    public void delete(Designer designer) {
        this.log.debug("logout instance");

        try {
            this.getSession().delete(designer);
        } catch (RuntimeException var3) {
            throw var3;
        }
    }

    public Designer findD(String hql) {
        this.log.debug("finding designer instance by designerId");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            if (queryObject.list() != null) {
                List list = queryObject.list();
                Designer e = (Designer)list.get(0);
                return e;
            } else {
                return null;
            }
        } catch (RuntimeException var5) {
            this.log.error("find failed", var5);
            throw var5;
        }
    }

    public Employer findE(String hql) {
        this.log.debug("finding designer instance by designerId");
        Employer e = null;

        try {
            Query queryObject = this.getSession().createQuery(hql);
            if (queryObject.list() != null) {
                List list = queryObject.list();
                e = (Employer)list.get(0);
            }

            return e;
        } catch (RuntimeException var5) {
            this.log.error("find failed", var5);
            throw var5;
        }
    }

    public Integer findCount1() {
        this.log.debug("finding maxId instance");

        try {
            Integer count = (Integer)this.getSession().createQuery("select max(visits) from Designer").uniqueResult();
            return count == null ? null : count;
        } catch (RuntimeException var2) {
            this.log.error("find failed", var2);
            System.out.println("err");
            throw var2;
        }
    }

    public Integer findCount2() {
        this.log.debug("finding maxId instance");

        try {
            Integer count = (Integer)this.getSession().createQuery("select max(visits) from Example ").uniqueResult();
            return count == null ? null : count;
        } catch (RuntimeException var2) {
            this.log.error("find failed", var2);
            System.out.println("err");
            throw var2;
        }
    }

    public List findByhql(String hql) {
        this.log.debug("find instance");

        try {
            Query queryObject = this.getSession().createQuery(hql);
            return queryObject.list();
        } catch (RuntimeException var3) {
            this.log.error("find failed", var3);
            System.out.println("err");
            throw var3;
        }
    }

    public void update1(Example example) {
        this.log.debug("update instance");

        try {
            this.getSession().update(example);
        } catch (RuntimeException var3) {
            throw var3;
        }
    }

    public Integer confirm(String name, String Id) {
        this.log.debug("finding count");

        try {
            Integer count = (Integer)this.getSession().createQuery("select exampleId from Example where name='" + name + "'and designerId='" + Id + "'").uniqueResult();
            return count == null ? null : count;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            System.out.println("err");
            throw var4;
        }
    }

    public Designer findById(String id) {
        this.log.debug("finding designer instance by designerId");

        try {
            Designer e = (Designer)this.getSession().get(Designer.class, id);
            this.log.debug("find successful");
            return e;
        } catch (RuntimeException var4) {
            this.log.error("find failed", var4);
            throw var4;
        }
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
}
