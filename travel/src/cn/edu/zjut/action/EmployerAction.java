//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Employer;
import cn.edu.zjut.service.IEmployerService;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class EmployerAction {
    Employer employer;
    IEmployerService employerServ = null;
    private File uprofile;
    public String uprofileFileName;

    public EmployerAction() {
    }

    public void setEmployerServ(IEmployerService employerServ) {
        this.employerServ = employerServ;
    }

    public Employer getEmployer() {
        return this.employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    public String registerEmp() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String message;
        if (this.employerServ.registerEmp(this.employer)) {
            message = "注册成功!";
            request.setAttribute("tipMessage", message);
            return "success";
        } else {
            message = "注册失败，手机号已被注册过!";
            request.setAttribute("tipMessage", message);
            return "fail";
        }
    }

    public String putEmployer() {
        return this.employerServ.putEmployer(this.employer) ? "myself" : "others";
    }

    public String update3() {
        System.out.println("in actoin employer.name" + this.employer.getName());
        System.out.println("uprofileFileName:   " + this.uprofileFileName);
        if (this.uprofile == null) {
            System.out.println("yes");
        }

        return this.employerServ.update3(this.employer, this.uprofile, this.uprofileFileName) ? "success" : "fail";
    }

    public String back() {
        return this.employerServ.back() ? "success" : "fail";
    }

    public File getUprofile() {
        return this.uprofile;
    }

    public void setUprofile(File uprofile) {
        this.uprofile = uprofile;
    }

    public String getUprofileFileName() {
        return this.uprofileFileName;
    }

    public void setUprofileFileName(String uprofileFileName) {
        this.uprofileFileName = uprofileFileName;
    }
}
