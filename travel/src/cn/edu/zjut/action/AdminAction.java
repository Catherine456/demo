//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.IAdminService;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class AdminAction {
    private String phone;
    private String userId;
    private IAdminService adminService = null;
    private Designer designer;
    private Example example;

    public AdminAction() {
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setAdminService(IAdminService service) {
        System.out.println("SetadminService");
        this.adminService = service;
    }

    public Designer getDesigner() {
        return this.designer;
    }

    public void setDesigner(Designer designer) {
        this.designer = designer;
    }

    public Example getExample() {
        return this.example;
    }

    public void setExample(Example example) {
        this.example = example;
    }

    public String Logout() {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (this.adminService.Logout(this.userId, this.phone)) {
            System.out.println(this.userId);
            System.out.println(this.phone);
            String message = "注销成功!";
            request.setAttribute("tipMessage", message);
            return "success";
        } else {
            return "fail";
        }
    }

    public String Exit() {
        HttpServletRequest request = ServletActionContext.getRequest();
        this.adminService.Exit();
        String message = "退出登陆";
        request.setAttribute("tipMessage", message);
        return "success";
    }

    public String Recommend() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.adminService.Recommend(this.designer)) {
            System.out.println("");
            System.out.println(this.designer.getDesignerId());
            message = "推优成功，账单将会寄给用户!";
            request.setAttribute("tipMessage", message);
            System.out.println(message);
            return "success";
        } else {
            message = "推优失败!";
            System.out.println(message);
            request.setAttribute("tipMessage", message);
            return "fail";
        }
    }

    public String Recommend1() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.adminService.Recommend1(this.example, this.designer)) {
            message = "推优成功，账单将会寄给用户!";
            request.setAttribute("tipMessage", message);
            return "success";
        } else {
            message = "推优失败!";
            request.setAttribute("tipMessage", message);
            return "fail";
        }
    }

    public String display() {
        this.adminService.display();
        return "success";
    }

    public String Authen() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.adminService.Authen(this.designer)) {
            message = "认证成功!";
            request.setAttribute("tipMessage", message);
            request.setAttribute("designer", this.designer);
            return "success";
        } else {
            message = "认证失败!";
            request.setAttribute("tipMessage", message);
            request.setAttribute("designer", this.designer);
            return "fail";
        }
    }

    public String View() {
        this.adminService.View(this.designer);
        return "success";
    }

    public String display1() {
        this.adminService.display1();
        return "success";
    }

    public String display2() {
        this.adminService.display2();
        return "success";
    }
}
