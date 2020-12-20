//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Orderr;
import cn.edu.zjut.service.IOrderrService;

public class OrderrAction {
    private IOrderrService orderrServ = null;
    private String orderrId;
    private String state;
    private Orderr orderr;
    private Designer designer;
    private Employer employer;

    public OrderrAction() {
    }

    public Designer getDesigner() {
        return this.designer;
    }

    public void setDesigner(Designer designer) {
        this.designer = designer;
    }

    public Employer getEmployer() {
        return this.employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    public void setOrderrServ(IOrderrService orderrServ) {
        this.orderrServ = orderrServ;
    }

    public String getOrderrId() {
        return this.orderrId;
    }

    public void setOrderrId(String orderrId) {
        this.orderrId = orderrId;
    }

    public Orderr getOrderr() {
        return this.orderr;
    }

    public IOrderrService getOrderrServ() {
        return this.orderrServ;
    }

    public void setOrderr(Orderr orderr) {
        this.orderr = orderr;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String changeOrderrSt() throws Exception {
        return this.orderrServ.changeOrderrSt(this.orderrId, this.state) ? "success" : "false";
    }

    public String getOrderrByID() {
        System.out.println(this.orderrId);
        this.orderr = this.orderrServ.getOrderrByID(this.orderrId);
        return "success";
    }

    public String SubmitOrderr() {
        return this.orderrServ.SubmitOrderr(this.orderr, this.designer, this.employer) ? "success" : "false";
    }

    public String app() {
        System.out.println(this.orderrId);
        this.orderr = this.orderrServ.app(this.orderrId);
        return "success";
    }

    public String pay() {
        return this.orderrServ.pay(this.orderrId) ? "success" : "false";
    }

    public String finish() {
        return this.orderrServ.finish(this.orderrId) ? "success" : "false";
    }
}
