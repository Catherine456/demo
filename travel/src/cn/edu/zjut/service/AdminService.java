//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.dao.IAdminDAO;
import cn.edu.zjut.dao.IDesignerDAO;
import cn.edu.zjut.dao.IExampleDAO;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;

public class AdminService implements IAdminService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IAdminDAO adminDAO = null;
    private IDesignerDAO designerDAO = null;
    private IExampleDAO exampleDAO = null;

    public AdminService() {
    }

    public void setDesignerDAO(IDesignerDAO designerDAO) {
        this.designerDAO = designerDAO;
    }

    public void setExampleDAO(IExampleDAO exampleDAO) {
        this.exampleDAO = exampleDAO;
    }

    public void setAdminDAO(IAdminDAO dao) {
        this.adminDAO = dao;
    }

    public boolean Authen(Designer designer) {
        Designer designer1 = this.designerDAO.findById(designer.getDesignerId());
        designer1.setStatus("已审核");
        designer1.setTitle(designer.getTitle());

        try {
            this.designerDAO.update(designer1);
            this.designerDAO.update(designer1);
            this.request.put("designer", designer1);
            this.display1();
            this.display2();
            return true;
        } catch (Exception var4) {
            var4.printStackTrace();
            return false;
        }
    }

    public void View(Designer designer) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        System.out.println("view");
        System.out.println(designer.getDesignerId());
        designer = this.adminDAO.findById(designer.getDesignerId());
        this.request.put("designer", designer);
    }

    public List display1() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String state = "审核中";
        String hql = "from Designer designer where designer.status='" + state + "'";
        List list = this.adminDAO.findByHql(hql);
        System.out.println(list);
        this.session.put("designers", list);
        return list;
    }

    public List display2() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String state = "已审核";
        String hql = "from Designer designer where designer.status='" + state + "'";
        List list = this.adminDAO.findByHql(hql);
        this.session.put("designerss", list);
        return list;
    }

    public boolean Logout(String userId, String phone) {
        System.out.println(userId);
        System.out.println(phone);
        String str = userId.substring(0, 1);
        System.out.println(str);
        String hql;
        if (str.equals("0")) {
            hql = "from Designer  where designerId='" + userId + "'and phone='" + phone + "'";

            try {
                Designer designer = this.adminDAO.findD(hql);
                System.out.println(designer.getAccount());
                this.adminDAO.delete(designer);
                System.out.println(1111);
                return true;
            } catch (Exception var6) {
                var6.printStackTrace();
                return false;
            }
        } else {
            hql = "from Employer where employerId='" + userId + "'and phone='" + phone + "'";

            try {
                Employer employer = this.adminDAO.findE(hql);
                System.out.println(employer.getEmployerId());
                this.adminDAO.delete(employer);
                return true;
            } catch (Exception var7) {
                var7.printStackTrace();
                return false;
            }
        }
    }

    public boolean Recommend(Designer designer) {
        try {
            designer = this.designerDAO.findById(designer.getDesignerId());
            Integer count = this.adminDAO.findCount1();
            if (count == null) {
                designer.setVisits(1);
            } else {
                designer.setVisits(count + 1);
            }

            designer.setStatus1(2);
            this.designerDAO.update(designer);
            this.display();
            return true;
        } catch (Exception var3) {
            var3.printStackTrace();
            return false;
        }
    }

    public boolean Recommend1(Example example, Designer designer) {
        try {
            Integer exampleId = this.adminDAO.confirm(example.getName(), designer.getDesignerId());
            if (exampleId != null) {
                designer = this.designerDAO.findById(designer.getDesignerId());
                example = this.exampleDAO.findById1(exampleId);
                Integer count = this.adminDAO.findCount2();
                if (count == null) {
                    example.setVisits(1);
                } else {
                    example.setVisits(count + 1);
                }

                this.adminDAO.update1(example);
                designer.setStatus1(4);
                this.designerDAO.update(designer);
                this.display();
                return true;
            } else {
                return false;
            }
        } catch (Exception var5) {
            var5.printStackTrace();
            return false;
        }
    }

    public List display() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        String hql = "from Designer order by money1 desc";
        List list = this.adminDAO.findByhql(hql);
        this.session.put("Designerss", list);
        return list;
    }

    public List displayExp() {
        String hql = "from Example order by visits desc";
        List list = this.adminDAO.findByhql(hql);
        return list;
    }

    public List displayDes() {
        String hql = "from Designer order by visits desc";
        String hql1 = "from Designer where status1=2";
        List list = this.adminDAO.findByhql(hql);
        List list1 = this.adminDAO.findByhql(hql1);
        Designer designer = null;
        if (list1 == null) {
            return null;
        } else if (list1.size() == 3) {
            return list1;
        } else {
            for(int i = 0; i < list.size() && list1.size() < 3; ++i) {
                designer = (Designer)list.get(i);
                if (designer.getStatus1() != null && designer.getStatus1() != 2) {
                    list1.add(designer);
                }
            }

            return list1;
        }
    }

    public void Exit() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        this.session.remove("id");
        this.session.remove("admin");
    }
}
