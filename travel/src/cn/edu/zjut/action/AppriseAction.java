//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Apprise;
import cn.edu.zjut.service.IAppriseService;

public class AppriseAction {
    private Apprise apprise;
    private String employerId;
    private String designerId;
    IAppriseService appriseServ = null;

    public AppriseAction() {
    }

    public void setAppriseServ(IAppriseService appriseServ) {
        System.out.println("SetappriseServ");
        this.appriseServ = appriseServ;
    }

    public Apprise getApprise() {
        return this.apprise;
    }

    public void setApprise(Apprise apprise) {
        this.apprise = apprise;
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

    public IAppriseService getAppriseServ() {
        return this.appriseServ;
    }

    public String apprise() {
        return this.appriseServ.apprise(this.apprise, this.employerId, this.designerId) ? "success" : "fail";
    }

    public String getApprises() {
        System.out.println(this.designerId);
        return this.appriseServ.getApprises(this.designerId) ? "success" : "false";
    }
}
