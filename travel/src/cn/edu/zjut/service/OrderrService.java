//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.dao.IDesignerDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.dao.IOrderrDAO;
import cn.edu.zjut.dao.ISubscribeDAO;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Orderr;
import cn.edu.zjut.po.Subscribe;
import com.opensymphony.xwork2.ActionContext;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletContext;
import org.apache.struts2.ServletActionContext;

public class OrderrService implements IOrderrService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IOrderrDAO orderrDAO = null;
    private IDesignerDAO designerDAO = null;
    private IEmployerDAO employerDAO = null;
    private ISubscribeDAO subscribeDAO = null;

    public OrderrService() {
    }

    public void setOrderrDAO(IOrderrDAO orderrDAO) {
        this.orderrDAO = orderrDAO;
    }

    public void setDesignerDAO(IDesignerDAO designerDAO) {
        this.designerDAO = designerDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public void setSubscribeDAO(ISubscribeDAO subscribeDAO) {
        this.subscribeDAO = subscribeDAO;
    }

    public boolean changeOrderrSt(String orderrId, String state) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        System.out.println(state);
        Orderr orderr = this.orderrDAO.findById(orderrId);
        Subscribe subscribe = (Subscribe)this.session.get("subscribe");
        subscribe.setStatus(3);
        this.subscribeDAO.update(subscribe);
        this.request.put("subscribe", subscribe);
        Employer employer = this.employerDAO.findById(subscribe.getSubscriber().getEmployerId());
        this.session.put("employer", employer);
        Designer designer = this.designerDAO.findById(subscribe.getScriber().getDesignerId());
        this.session.put("designer", designer);
        orderr.setState(state);
        if (state.equals("完成")) {
            subscribe.setStatus(2);
            this.subscribeDAO.update(subscribe);
            this.request.put("subscribe", subscribe);
            orderr.setFinishTime(new Timestamp((new Date()).getTime()));
        }

        try {
            this.orderrDAO.update(orderr);
            this.request.put("orderr", orderr);
            return true;
        } catch (Exception var9) {
            var9.printStackTrace();
            return false;
        }
    }

    public Orderr getOrderrByID(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        System.out.println(orderrId);
        Orderr orderr = this.orderrDAO.findById(orderrId);
        System.out.println(orderr.getTitle());
        this.request.put("orderr", orderr);
        return orderr;
    }

    public boolean SubmitOrderr(Orderr orderr, Designer designer, Employer employer1) {
        ActionContext ctx = ActionContext.getContext();
        ServletContext servletContext = ServletActionContext.getServletContext();
        this.request = (Map)ctx.get("request");
        this.session = ctx.getSession();
        Employer employer = this.employerDAO.findById(employer1.getEmployerId());
        designer = this.designerDAO.findById(designer.getDesignerId());
        String orderrId = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate1 = sdf.format(new Date());
        String result = "";
        Random random = new Random();

        for(int i = 0; i < 3; ++i) {
            result = result + random.nextInt(10);
        }

        orderrId = newDate1 + result;
        Orderr order = new Orderr(orderrId, orderr.getTitle(), orderr.getDescription(), new Timestamp((new Date()).getTime()), orderr.getDesignTime(), (Date)null, orderr.getMoney(), "未付款", employer, designer);

        try {
            this.orderrDAO.save(order);
            this.request.put("orderr", order);
            Subscribe subscribe = (Subscribe)this.session.get("subscribe");
            if (subscribe != null) {
                subscribe.setStatus(2);
                this.subscribeDAO.update(subscribe);
                this.request.put("designer", designer);
                designer = this.designerDAO.findById(designer.getDesignerId());
                this.session.put("designer", designer);
            }

            Integer count = (Integer)servletContext.getAttribute("ordernum");
            servletContext.setAttribute("ordernum", count + 1);
            return true;
        } catch (Exception var15) {
            var15.printStackTrace();
            return false;
        }
    }

    public Orderr app(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        System.out.println(orderrId);
        Orderr orderr = this.orderrDAO.findById(orderrId);
        System.out.println(orderr.getTitle());
        this.request.put("orderr", orderr);
        return orderr;
    }

    public boolean pay(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        Orderr orderr = this.orderrDAO.findById(orderrId);
        orderr.setState("已付款");
        this.orderrDAO.update(orderr);
        this.request.put("orderr", orderr);
        Employer e = this.employerDAO.findById(orderr.getEmployer().getEmployerId());
        this.session.put("employer", e);
        this.request.put("tipMessage", "支付成功！");
        return true;
    }

    public boolean finish(String orderrId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        Orderr orderr = this.orderrDAO.findById(orderrId);
        orderr.setState("已完成");
        this.orderrDAO.update(orderr);
        this.request.put("orderr", orderr);
        Employer e = this.employerDAO.findById(orderr.getEmployer().getEmployerId());
        this.session.put("employer", e);
        Designer d = this.designerDAO.findById(orderr.getDesigner().getDesignerId());
        this.session.put("designer", d);
        this.request.put("tipMessage", "订单交易成功！！！");
        return true;
    }
}
