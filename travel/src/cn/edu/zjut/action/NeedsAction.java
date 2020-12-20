//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Needs;
import cn.edu.zjut.po.Orderr;
import cn.edu.zjut.service.INeedsService;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

public class NeedsAction {
    Needs need;
    @Autowired
    private INeedsService needsServ = null;
    private String city;
    private int area = 0;
    private int money = 0;
    private int order = 1;
    private List needs1;
    private Needs needs;
    private int needsId;
    private Designer designer;
    private String designerId;
    private Orderr orderr;
    private List signupList;

    public NeedsAction() {
    }

    public void setNeedsServ(INeedsService needsServ) {
        this.needsServ = needsServ;
    }

    public void setNeed(Needs need) {
        this.need = need;
    }

    public Needs getNeed() {
        return this.need;
    }

    public String order() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.needsServ.wanted(this.need)) {
            message = "发布成功!";
            request.setAttribute("tipMessage", message);
            return "success";
        } else {
            message = "发布失败!";
            request.setAttribute("tipMessage", message);
            return "fail";
        }
    }

    public List getSignupList() {
        return this.signupList;
    }

    public void setSignupList(List signupList) {
        this.signupList = signupList;
    }

    public int getNeedsId() {
        return this.needsId;
    }

    public void setNeedsId(int needsId) {
        this.needsId = needsId;
    }

    public Designer getDesigner() {
        return this.designer;
    }

    public void setDesigner(Designer designer) {
        this.designer = designer;
    }

    public String getDesignerId() {
        return this.designerId;
    }

    public void setDesignerId(String designerId) {
        this.designerId = designerId;
    }

    public Needs getNeeds() {
        return this.needs;
    }

    public void setNeeds(Needs needs) {
        this.needs = needs;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) throws UnsupportedEncodingException {
        this.city = URLDecoder.decode(city, "utf-8");
    }

    public int getArea() {
        return this.area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getMoney() {
        return this.money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public List getNeeds1() {
        return this.needs1;
    }

    public void setNeeds1(List needs1) {
        this.needs1 = needs1;
    }

    public int getOrder() {
        return this.order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public Orderr getOrderr() {
        return this.orderr;
    }

    public void setOrderr(Orderr orderr) {
        this.orderr = orderr;
    }

    public String findneeds() {
        this.needs1 = this.needsServ.findneeds(this.city, this.area, this.money, this.order);
        return this.needs1 != null ? "findneedssuccess" : "login";
    }

    public String getNeedsByID() {
        this.needs = this.needsServ.getNeedsByID(this.needsId);
        return "success";
    }

    public String SignUp() throws Exception {
        JSONObject result = new JSONObject();
        if (this.needsServ.SignUp(this.needsId)) {
            result.put("success", true);
            return "success";
        } else {
            result.put("false", true);
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println(result.toString());
            out.flush();
            out.close();
            return null;
        }
    }

    public String cancelSignUp() throws Exception {
        JSONObject result = new JSONObject();
        if (this.needsServ.cancelSignUp(this.needsId)) {
            result.put("success", true);
            return "success";
        } else {
            result.put("false", true);
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println(result.toString());
            out.flush();
            out.close();
            return null;
        }
    }

    public String cancelNeeds() throws Exception {
        JSONObject result = new JSONObject();
        if (this.needsServ.cancelNeeds(this.needsId)) {
            result.put("success", true);
            return "success";
        } else {
            result.put("false", true);
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println(result.toString());
            out.flush();
            out.close();
            return null;
        }
    }

    public String SelectDes() throws Exception {
        return this.needsServ.selectDes(this.needs, this.designer) ? "success" : "false";
    }
}
