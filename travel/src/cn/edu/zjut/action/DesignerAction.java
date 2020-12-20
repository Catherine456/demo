//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.IDesignerService;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

public class DesignerAction extends ActionSupport {
    private Example example;
    private Designer designer;
    IDesignerService designerServ = null;
    private Integer exampleId;
    private File[] upload;
    private File[] upload2;
    private String designerID;
    private String account;
    private File profile;
    public String profileFileName;
    private File certificate;
    public String certificateFileName;
    private int money1;
    private String message;

    public DesignerAction() {
    }

    public String getAccount() {
        return this.account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getDesignerID() {
        return this.designerID;
    }

    public void setDesignerID(String designerID) {
        this.designerID = designerID;
    }

    public IDesignerService getDesignerServ() {
        return this.designerServ;
    }

    public void setDesignerServ(IDesignerService designerServ) {
        System.out.println("SetdesignerServ");
        this.designerServ = designerServ;
    }

    public File[] getUpload() {
        return this.upload;
    }

    public void setUpload(File[] upload) {
        this.upload = upload;
    }

    public File[] getUpload2() {
        return this.upload2;
    }

    public void setUpload2(File[] upload2) {
        this.upload2 = upload2;
    }

    public Example getExample() {
        return this.example;
    }

    public void setExample(Example example) {
        this.example = example;
    }

    public Designer getDesigner() {
        return this.designer;
    }

    public void setDesigner(Designer designer) {
        this.designer = designer;
    }

    public String gotoSubscribe() {
        System.out.println("designerID:" + this.designerID);
        Designer designer = new Designer();
        designer.setDesignerId(this.designerID);
        this.designerServ.putDesigner(designer);
        return "success";
    }

    public Integer getExampleId() {
        return this.exampleId;
    }

    public void setExampleId(Integer exampleId) {
        this.exampleId = exampleId;
    }

    public void removeCase() throws Exception {
        JSONObject result = new JSONObject();
        if (this.designerServ.removeCase(this.exampleId)) {
            result.put("success", true);
        } else {
            result.put("false", true);
        }

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(result.toString());
        out.flush();
        out.close();
    }

    public String upload() throws Exception {
        return this.designerServ.upload(this.example, this.upload, this.upload2) ? "uploadSucccess" : "uploadFail";
    }

    public String login() {
        return this.designerServ.login(this.designer) ? "loginSuccess" : "loginFail";
    }

    public String putDesigner() {
        return this.designerServ.putDesigner(this.designer) ? "myself" : "others";
    }

    public String judgeIdentity() {
        return this.designerServ.judgeIdentity() ? "designer" : "employer";
    }

    public String registerDes() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.designerServ.registerDes(this.designer)) {
            message = "注册成功!";
            request.setAttribute("tipMessage", message);
            return "success";
        } else {
            message = "注册失败，手机号已被注册过!";
            request.setAttribute("tipMessage", message);
            return "fail";
        }
    }

    public String viewExampleDetails() {
        return this.designerServ.viewExampleDetails(this.designer, this.example) ? "viewSuccess" : "viewFail";
    }

    public String findAll() {
        return this.designerServ.findAll() ? "success" : "false";
    }

    public String findByPraise() throws Exception {
        return this.designerServ.findByPraise() ? "praiseSuccess" : "praiseFail";
    }

    public String findByScore() throws Exception {
        return this.designerServ.findByScore() ? "scoreSuccess" : "scoreFail";
    }

    public String logout() {
        return this.designerServ.logout() ? "success" : "false";
    }

    public String update() {
        System.out.println(this.designer.getDesignerId());
        System.out.println(this.designer.getAccount());
        return this.designerServ.update(this.designer, this.profile, this.profileFileName) ? "success" : "fail";
    }

    public String update2() {
        return this.designerServ.update2(this.designer, this.certificate, this.certificateFileName) ? "success" : "fail";
    }

    public String recommend1() {
        return this.designerServ.recommend1(this.money1) ? "success" : "fail";
    }

    public String recommend2() {
        return this.designerServ.recommend2(this.money1) ? "success" : "fail";
    }

    public String recommend3() {
        return this.designerServ.recommend3(this.message) ? "success" : "fail";
    }

    public File getProfile() {
        return this.profile;
    }

    public void setProfile(File profile) {
        this.profile = profile;
    }

    public String getProfileFileName() {
        return this.profileFileName;
    }

    public void setProfileFileName(String profileFileName) {
        this.profileFileName = profileFileName;
    }

    public File getCertificate() {
        return this.certificate;
    }

    public void setCertificate(File certificate) {
        this.certificate = certificate;
    }

    public String getCertificateFileName() {
        return this.certificateFileName;
    }

    public void setCertificateFileName(String certificateFileName) {
        this.certificateFileName = certificateFileName;
    }

    public int getMoney1() {
        return this.money1;
    }

    public void setMoney1(int money1) {
        this.money1 = money1;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String searchByAccount() {
        return this.designerServ.searchByAccount(this.account) ? "accountSuccess" : "accountFail";
    }
}
