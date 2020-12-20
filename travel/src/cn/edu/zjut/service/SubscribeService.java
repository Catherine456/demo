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
import java.io.PrintStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;

public class SubscribeService implements ISubscribeService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private ISubscribeDAO subscribeDAO = null;
    private IOrderrDAO orderrDAO = null;
    private IEmployerDAO employerDAO = null;
    private IDesignerDAO designerDAO = null;

    public SubscribeService() {
    }

    public void setSubscribeDAO(ISubscribeDAO subscribeDAO) {
        this.subscribeDAO = subscribeDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public void setDesignerDAO(IDesignerDAO designerDAO) {
        this.designerDAO = designerDAO;
    }

    public IOrderrDAO getOrderrDAO() {
        return this.orderrDAO;
    }

    public void setOrderrDAO(IOrderrDAO orderrDAO) {
        this.orderrDAO = orderrDAO;
    }

    public boolean subscribe(Subscribe sub, String employerId, String designerId) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        int id = this.subscribeDAO.find();
        sub.setSubscribeID(id + 1);
        Employer user = this.employerDAO.findById(employerId);
        sub.setSubscriber(user);
        Designer user1 = this.designerDAO.findById(designerId);
        sub.setScriber(user1);
        Timestamp d = new Timestamp(System.currentTimeMillis());
        sub.setTime(d);
        sub.setStatus(1);
        System.out.println(user.getEmployerId());
        user.getSubscribe().add(sub);
        this.session.put("employer", user);
        this.request.put("designer", user1);

        try {
            this.subscribeDAO.save(sub);
            return true;
        } catch (Exception var10) {
            var10.printStackTrace();
            return false;
        }
    }

    public void putSubscribe(Subscribe subscribe) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = ctx.getSession();
        subscribe = this.subscribeDAO.findById(subscribe.getSubscribeID());
        this.request.put("subscribe", subscribe);
        this.session.put("subscribe", subscribe);
        Employer subscriber = subscribe.getSubscriber();
        this.request.put("subscriber", subscriber);
        this.request.put("scriber", subscribe.getScriber());
        System.out.println("该预约的预约者为：" + subscriber.getName());
        System.out.println("该预约的设计师为：" + subscribe.getScriber().getName());
    }

    public void accept(String subscribeID) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        int id = Integer.parseInt(subscribeID);
        Subscribe subscribe = this.subscribeDAO.findById(id);
        this.subscribeDAO.delete(subscribe);
        PrintStream var10000 = System.out;
        String var10001 = subscribe.getScriber().getName();
        var10000.println("before order.getDesigner()" + var10001 + subscribe.getScriber().getPhone());
        var10000 = System.out;
        int var13 = subscribe.getScriber().getSubscribe().size();
        var10000.println("before order.getDesigner().size() sub order" + var13 + "   " + subscribe.getScriber().getOrderrs().size());
        Orderr order = new Orderr();
        Timestamp beginTime = new Timestamp(System.currentTimeMillis());
        order.setBeginTime(beginTime);
        order.setDesigner(subscribe.getScriber());
        order.setEmployer(subscribe.getSubscriber());
        order.setMoney(subscribe.getMoney());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate = sdf.format(new Date());
        String result = "";
        Random random = new Random();

        for(int i = 0; i < 3; ++i) {
            result = result + random.nextInt(10);
        }

        order.setOrderrId(newDate + result);
        order.setState("进行中");
        order.setTitle(subscribe.getTitle());
        System.out.println("in save");
        this.orderrDAO.save(order);
        System.out.println("out save");
        Designer designer = this.designerDAO.findById(order.getDesigner().getDesignerId());
        this.session.put("designer", designer);
        var10000 = System.out;
        var10001 = designer.getName();
        var10000.println("after order.getDesigner()" + var10001 + designer.getPhone());
        var10000 = System.out;
        var13 = designer.getSubscribe().size();
        var10000.println("after order.getDesigner().size() sub order" + var13 + "   " + designer.getOrderrs().size());
    }

    public void reject(Subscribe subscribe) {
        subscribe = this.subscribeDAO.findById(subscribe.getSubscribeID());
        subscribe.setStatus(3);
        this.subscribeDAO.update(subscribe);
        Designer designer = this.designerDAO.findById(subscribe.getScriber().getDesignerId());
        this.session.put("designer", designer);
    }

    public void cancelSub(String subscribeID) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        System.out.println(subscribeID);
        Subscribe subscribe = this.subscribeDAO.findById(Integer.parseInt(subscribeID));
        subscribe.setStatus(4);
        this.subscribeDAO.update(subscribe);
        Employer employer = this.employerDAO.findById(subscribe.getSubscriber().getEmployerId());
        this.session.put("employer", employer);
        this.request.put("tip", "您已取消成功！");
    }
}
