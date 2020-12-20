//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.po.Employer;
import com.opensymphony.xwork2.ActionContext;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class EmployerService implements IEmployerService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    IEmployerDAO employerDAO = null;

    public EmployerService() {
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public boolean registerEmp(Employer emp) {
        String phone = emp.getPhone();
        String hql = "from Employer where phone='" + phone + "'";
        if (this.employerDAO.findByHql(hql).isEmpty()) {
            String id = this.employerDAO.findEmp();
            if (id == null) {
                String a = "1000000001";
                emp.setEmployerId(a);
            } else {
                Integer a = Integer.parseInt(id) + 1;
                String b = a.toString();
                emp.setEmployerId(b);
            }

            emp.setAccount(emp.getPhone());
            emp.setHmpgbkg("");
            emp.setProfilePhoto("");

            try {
                this.employerDAO.save(emp);
                return true;
            } catch (Exception var7) {
                var7.printStackTrace();
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean putEmployer(Employer employer) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        this.request = (Map)ctx.get("request");
        if (this.session.get("employer") != null) {
            String id = ((Employer)this.session.get("employer")).getEmployerId();
            if (employer.getEmployerId().equals(id)) {
                return true;
            } else {
                employer = this.employerDAO.findById(employer.getEmployerId());
                this.request.put("employer", employer);
                return false;
            }
        } else {
            employer = this.employerDAO.findById(employer.getEmployerId());
            this.request.put("employer", employer);
            return false;
        }
    }

    public boolean back() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Employer emp = this.employerDAO.findById("1222222222");
        this.session.put("employer", emp);
        this.session.put("id", "1222222222");
        return true;
    }

    public boolean update3(Employer employer, File uprofile, String uprofileFileName) {
        ServletContext servletContext = ServletActionContext.getServletContext();
        System.out.println("in service:" + uprofileFileName);
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        if (uprofile != null) {
            String save = servletContext.getRealPath("/designer/employer/profilephoto/");
            this.copyfile(save, uprofile, uprofileFileName);
            employer.setProfilePhoto(uprofileFileName);
        }

        Employer emp = (Employer)this.session.get("employer");
        emp.setAccount(employer.getAccount());
        emp.setPassword(employer.getPassword());
        emp.setProfilePhoto(employer.getProfilePhoto());
        emp.setName(employer.getName());
        emp.setIDNumber(employer.getIDNumber());
        emp.setSex(employer.getSex());
        emp.setRegion(employer.getRegion());
        emp.setPhone(employer.getPhone());
        emp.setEmail(employer.getEmail());
        emp.setQq(employer.getQq());
        emp.setWechat(employer.getWechat());

        try {
            this.employerDAO.update(emp);
            this.request.put("tip", "修改成功");
            this.session.put("employer", employer);
            return true;
        } catch (Exception var8) {
            this.request.put("tip", "修改失败");
            var8.printStackTrace();
            return false;
        }
    }

    public String copyfile(String path, File file, String filename) {
        File f = new File(path);
        if (!f.exists()) {
            f.mkdirs();
        }

        try {
            FileUtils.copyFile(file, new File(f, filename));
        } catch (IOException var6) {
            var6.printStackTrace();
        }

        System.out.println(path);
        path = path + filename;
        System.out.println(path);
        return path;
    }
}
