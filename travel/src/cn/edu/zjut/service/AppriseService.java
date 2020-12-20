//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.dao.IAppriseDAO;
import cn.edu.zjut.dao.IDesignerDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.po.Apprise;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;

public class AppriseService implements IAppriseService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IAppriseDAO appriseDAO = null;
    private IDesignerDAO designerDAO = null;
    private IEmployerDAO employerDAO = null;

    public AppriseService() {
    }

    public void setDesignerDAO(IDesignerDAO designerDAO) {
        this.designerDAO = designerDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public IAppriseDAO getAppriseDAO() {
        return this.appriseDAO;
    }

    public void setAppriseDAO(IAppriseDAO appriseDAO) {
        this.appriseDAO = appriseDAO;
    }

    public boolean apprise(Apprise appr, String employerId, String designerId) {
        try {
            ActionContext ctx = ActionContext.getContext();
            this.request = (Map)ctx.get("request");
            this.session = ctx.getSession();
            Employer e = this.employerDAO.findById(employerId);
            Designer d = this.designerDAO.findById(designerId);
            appr.setDesigner(d);
            System.out.println(d);
            appr.setEmployer(e);
            this.appriseDAO.save(appr);
            this.request.put("tip", "评价成功");
            return true;
        } catch (Exception var7) {
            var7.printStackTrace();
            return false;
        }
    }

    public boolean getApprises(String designerId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = ctx.getSession();
        List<Apprise> a = this.appriseDAO.getByDesignerId(designerId);
        this.request.put("list", a);
        System.out.println(a);
        return true;
    }
}
