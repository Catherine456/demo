package cn.edu.zjut.dao;

import cn.edu.zjut.po.Apprise;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class AppriseDAO extends BaseHibernateDAO implements IAppriseDAO{
    private Log log = LogFactory.getLog(AppriseDAO.class);

    public AppriseDAO() {
    }

    public void save(Apprise appr) {
        this.log.debug("saving appr instance");

        try {
            this.getSession().save(appr);
            this.log.debug("save successfully!");
        } catch (RuntimeException var3) {
            this.log.error("save fail", var3);
            throw var3;
        }
    }

    public List getByDesignerId(String designerId) {
        this.log.debug("");
        List list = null;

        try {
            String hql = "from Apprise where designerID=" + designerId;
            System.out.println(hql);
            Query queryObject = this.getSession().createQuery(hql);
            list = queryObject.list();
            return list;
        } catch (RuntimeException var5) {
            this.log.error("", var5);
            throw var5;
        }
    }
}
