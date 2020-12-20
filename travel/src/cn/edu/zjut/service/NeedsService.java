//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.dao.IDesignerDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.dao.INeedsDAO;
import cn.edu.zjut.dao.IOrderrDAO;
import cn.edu.zjut.po.Admin;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Needs;
import com.opensymphony.xwork2.ActionContext;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class NeedsService implements INeedsService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private INeedsDAO needsDAO = null;
    private IDesignerDAO designerDAO = null;
    private IOrderrDAO orderrDAO = null;
    private List<String> areaList = Arrays.asList("0-999999", "0-50", "50-100", "100-150", "150-200", "200-99999");
    private List<String> moneyList = Arrays.asList("0-99999999", "0-5000", "5000-10000", "10000-50000", "50000-100000", "100000-99999999");
    private IEmployerDAO employerDAO = null;
    private List needs1 = new ArrayList();

    public NeedsService() {
    }

    public void setNeedsDAO(INeedsDAO needsDAO) {
        this.needsDAO = needsDAO;
    }

    public void setDesignerDAO(IDesignerDAO designerDAO) {
        this.designerDAO = designerDAO;
    }

    public void setOrderrDAO(IOrderrDAO orderrDAO) {
        this.orderrDAO = orderrDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public boolean wanted(Needs need) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        int id = this.needsDAO.find();
        need.setNeedsId(id + 1);
        Employer user = (Employer)this.session.get("employer");
        need.setEmployer(user);
        need.setEnrollment(0);
        Timestamp d = new Timestamp(System.currentTimeMillis());
        need.setTime1(d);
        System.out.println(need.getTime2());

        try {
            this.needsDAO.save(need);
            user.getNeeds().add(need);
            System.out.println(user.getNeeds());
            this.session.put("employer", user);
            this.request.put("tip", "发布成功");
            return true;
        } catch (Exception var7) {
            var7.printStackTrace();
            this.request.put("tip", "发布失败");
            return false;
        }
    }

    public List<Needs> findneeds(String city, int area, int money, int order) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Designer user = (Designer)this.session.get("designer");
        Employer e = (Employer)this.session.get("employer");
        Admin ad = (Admin)this.session.get("admin");
        String[] a = ((String)this.areaList.get(area)).split("-");
        int a0 = Integer.parseInt(a[0]);
        int a1 = Integer.parseInt(a[1]);
        String[] m = ((String)this.moneyList.get(money)).split("-");
        int m0 = Integer.parseInt(m[0]);
        int m1 = Integer.parseInt(m[1]);
        String hql = "from Needs as needs";
        hql = hql + " where area between " + a0 + " and " + a1;
        hql = hql + " and money between " + m0 + " and " + m1;
        if (city != null && city.length() > 0) {
            city = city.replaceAll(" ", "");
            city = city.replaceAll(",", "");
            city = city.substring(0, city.length() - 1);
            hql = hql + " and city like '%" + city + "%'";
        }

        if (order == 1) {
            hql = hql + " order by time1 DESC";
        } else if (order == 2) {
            hql = hql + " order by area DESC";
        }

        System.out.println(hql);
        System.out.println(city + " " + area + " " + money + " " + order);
        this.session.put("areaList", this.areaList);
        this.session.put("moneyList", this.moneyList);
        this.session.put("city", city);
        List<Needs> list = this.needsDAO.findByHql(hql);
        if (user == null && e == null && ad == null) {
            ctx.put("tip", "您还没有登录，请输入用户名和密码登录系统");
            return null;
        } else {
            return list;
        }
    }

    public Needs getNeedsByID(int needsID) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        Designer d = (Designer)this.session.get("designer");
        String hql = "from Needs where needsID=" + needsID;
        List list = this.needsDAO.findByHql(hql);
        Needs needs = null;
        int enrollment = 0;
        if (!list.isEmpty()) {
            needs = (Needs)list.get(0);
            enrollment = needs.getEnrollment();
            Iterator var8 = needs.getDesigners().iterator();

            while(var8.hasNext()) {
                Object s = var8.next();
                Designer designer = (Designer)s;
                if (d != null) {
                    if (d.getDesignerId().equals(designer.getDesignerId())) {
                        this.request.put("hasSignup", true);
                        break;
                    }

                    this.request.put("hasSignup", false);
                }
            }

            needs.setEnrollment(enrollment);
            this.request.put("needs", needs);
        }

        return needs;
    }

    public boolean SignUp(int needsID) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Designer designer = (Designer)this.session.get("designer");
        Needs needs = this.needsDAO.findById(needsID);
        needs.getDesigners().add(designer);
        needs.setEnrollment(needs.getEnrollment() + 1);

        try {
            this.needsDAO.update(needs);
            return true;
        } catch (Exception var6) {
            var6.printStackTrace();
            return false;
        }
    }

    public boolean selectDes(Needs needs, Designer designer) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        Needs Needs = this.needsDAO.findById(needs.getNeedsId());
        Designer Designer = this.designerDAO.findById(designer.getDesignerId());
        if (Needs != null && Designer != null) {
            this.request.put("needs", Needs);
            this.request.put("designer", Designer);
            return true;
        } else {
            return false;
        }
    }

    public boolean cancelSignUp(int needsID) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Designer designer = (Designer)this.session.get("designer");
        Needs needs = this.needsDAO.findById(needsID);
        Iterator it = needs.getDesigners().iterator();

        while(it.hasNext()) {
            Designer designertemp = (Designer)it.next();
            if (((Designer)this.session.get("designer")).getDesignerId().equals(designertemp.getDesignerId())) {
                System.out.println("find it:" + designertemp.getDesignerId());
                it.remove();
            }
        }

        needs.setEnrollment(needs.getEnrollment() - 1);

        try {
            this.needsDAO.update(needs);
            return true;
        } catch (Exception var7) {
            var7.printStackTrace();
            return false;
        }
    }

    public boolean cancelNeeds(int needsID) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        Needs needs = this.needsDAO.findById(needsID);

        try {
            this.needsDAO.delete(needs);
            this.request.put("orderr", needs);
            return true;
        } catch (Exception var5) {
            var5.printStackTrace();
            return false;
        }
    }
}
