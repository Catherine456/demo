//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Subscribe;
import cn.edu.zjut.service.ISubscribeService;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class SubscribeAction {
    private Subscribe subscribe;
    private String employerId;
    private String designerId;
    private String subscribeID;
    ISubscribeService subscribeServ = null;

    public SubscribeAction() {
    }

    public String getSubscribeID() {
        return this.subscribeID;
    }

    public void setSubscribeID(String subscribeID) {
        this.subscribeID = subscribeID;
    }

    public String getEmployerId() {
        return this.employerId;
    }

    public void setEmployerId(String employerId) {
        this.employerId = employerId;
    }

    public String getDesignerId() {
        return this.designerId;
    }

    public void setDesignerId(String designerId) {
        this.designerId = designerId;
    }

    public void setSubscribeServ(ISubscribeService subscribeServ) {
        this.subscribeServ = subscribeServ;
    }

    public Subscribe getSubscribe() {
        return this.subscribe;
    }

    public void setSubscribe(Subscribe subscribe) {
        this.subscribe = subscribe;
    }

    public String subscribe() {
        System.out.println("employerId" + this.employerId);
        System.out.println("designerId" + this.designerId);
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.subscribeServ.subscribe(this.subscribe, this.employerId, this.designerId)) {
            message = "预约成功!";
            request.setAttribute("tipMessage", message);
            return "success";
        } else {
            message = "预约失败!";
            request.setAttribute("tipMessage", message);
            return "fail";
        }
    }

    public String putSubscribe() {
        this.subscribeServ.putSubscribe(this.subscribe);
        return "success";
    }

    public String accept() {
        System.out.println("subscibeID" + this.subscribeID);
        this.subscribeServ.accept(this.subscribeID);
        return "success";
    }

    public String reject() {
        System.out.println("action收到的subsribeID：" + this.subscribeID);
        this.subscribeServ.reject(this.subscribe);
        return "success";
    }

    public String gotoGenerateOrder() {
        this.subscribeServ.putSubscribe(this.subscribe);
        return "success";
    }

    public String cancelSub() {
        this.subscribeServ.cancelSub(this.subscribeID);
        return "success";
    }
}
