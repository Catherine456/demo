//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.dao.IAdminDAO;
import cn.edu.zjut.dao.IDesignerDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.dao.IExampleDAO;
import cn.edu.zjut.dao.IExamplePanoramaDAO;
import cn.edu.zjut.dao.IExamplePictureDAO;
import cn.edu.zjut.po.Admin;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePanorama;
import cn.edu.zjut.po.ExamplePicture;
import com.mysql.cj.jdbc.MysqlDataSource;
import com.opensymphony.xwork2.ActionContext;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.apache.commons.io.FileUtils;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLBooleanPrefJDBCDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.ReloadFromJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.struts2.ServletActionContext;

public class DesignerService implements IDesignerService {
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IDesignerDAO designerDAO = null;
    private IExampleDAO exampleDAO = null;
    private IEmployerDAO employerDAO = null;
    private IAdminDAO adminDAO = null;
    private IExamplePanoramaDAO examplePanoramaDAO = null;
    private IExamplePictureDAO examplePictureDAO = null;
    Designer designer = new Designer();
    private static MysqlDataSource dataSource;
    private List<Example> recommendExamples = new ArrayList();

    public void setDesignerDAO(IDesignerDAO designerDAO) {
        this.designerDAO = designerDAO;
    }

    public void setExampleDAO(IExampleDAO exampleDAO) {
        this.exampleDAO = exampleDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        this.employerDAO = employerDAO;
    }

    public void setAdminDAO(IAdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public void setExamplePanoramaDAO(IExamplePanoramaDAO examplePanoramaDAO) {
        this.examplePanoramaDAO = examplePanoramaDAO;
    }

    public void setExamplePictureDAO(IExamplePictureDAO examplePictureDAO) {
        this.examplePictureDAO = examplePictureDAO;
    }

    public DesignerService() {
        System.out.println("in service");
        String driver = "com.mysql.cj.jdbc.Driver";
        String user = "root";
        String password = "root";

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException var5) {
            var5.printStackTrace();
        }

        dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://localhost:3306/designer?serverTimezone=GMT%2B8&amp;useUnicode=true&amp;characterEncoding=UTF8");
        dataSource.setUser(user);
        dataSource.setPassword(password);
    }

    public void recommend(String employerID) {
        MySQLBooleanPrefJDBCDataModel datamodel = new MySQLBooleanPrefJDBCDataModel(dataSource, "star", "collecter", "exampleID", (String)null);

        try {
            ReloadFromJDBCDataModel model = new ReloadFromJDBCDataModel(datamodel);
            UserSimilarity similarity = new TanimotoCoefficientSimilarity(model);
            UserNeighborhood neighborhood = new NearestNUserNeighborhood(5, similarity, model);
            Recommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
            System.out.println("Long.parseLong(employerID)" + Long.parseLong(employerID));
            List<RecommendedItem> recommendations = recommender.recommend(Long.parseLong(employerID), 4);
            System.out.println("recommendations.size():" + recommendations.size());
            this.recommendExamples.clear();
            Iterator var8 = recommendations.iterator();

            while(var8.hasNext()) {
                RecommendedItem recommendation = (RecommendedItem)var8.next();
                System.out.println(recommendation.getItemID());
                this.recommendExamples.add(this.exampleDAO.findById((int)recommendation.getItemID()));
            }
        } catch (TasteException var10) {
        }

    }

    public boolean login(Designer desi) {
        String phone = desi.getPhone();
        String password = desi.getPassword();
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        this.request = (Map)ctx.get("request");
        String hql = "from Designer where phone='" + phone + "' and password='" + password + "'";
        String hql2 = "from Employer where phone='" + phone + "' and password='" + password + "'";
        String hql3 = "from Admin where phone='" + phone + "' and password='" + password + "'";
        List list = this.designerDAO.findByHql(hql);
        List list2 = this.employerDAO.findByHql(hql2);
        List list3 = this.adminDAO.findByhql(hql3);
        if (!list.isEmpty()) {
            Designer designer = (Designer)list.get(0);
            this.session.put("id", designer.getDesignerId());
            this.request.put("tip", "登录成功！");
            this.session.put("designer", designer);
            return true;
        } else if (!list2.isEmpty()) {
            Employer employer = (Employer)list2.get(0);
            this.session.put("id", employer.getEmployerId());
            this.session.put("employer", employer);
            System.out.println("in recommend:");
            this.recommend(employer.getEmployerId());
            this.session.put("recommendExamples", this.recommendExamples);
            System.out.println("in recommend:" + this.recommendExamples.size());
            return true;
        } else if (!list3.isEmpty()) {
            Admin admin = (Admin)list3.get(0);
            this.session.put("id", admin.getAdminId());
            this.session.put("admin", admin);
            String state = "审核中";
            String hql4 = "from Designer designer where designer.status='" + state + "'";
            List list4 = this.adminDAO.findByHql(hql4);
            this.session.put("designers", list4);
            return true;
        } else {
            return false;
        }
    }

    public boolean upload(Example example, File[] upload, File[] upload2) {
        ServletContext servletContext = ServletActionContext.getServletContext();

        try {
            Designer designer = (Designer)this.session.get("designer");
            String var10001 = designer.getDesignerId();
            String pathOfPanoramas = servletContext.getRealPath("/file/" + var10001 + "/" + example.getName() + "/panoramas/");
            var10001 = designer.getDesignerId();
            String pathOfPictures = servletContext.getRealPath("/file/" + var10001 + "/" + example.getName() + "/pictures/");
            System.out.println(pathOfPanoramas);
            File fileOfPanoramas = new File(pathOfPanoramas);
            File fileOfPictures = new File(pathOfPictures);
            if (!fileOfPanoramas.exists()) {
                fileOfPanoramas.mkdirs();
            }

            if (!fileOfPictures.exists()) {
                fileOfPictures.mkdirs();
            }

            int i;
            String var10002;
            for(i = 0; i < upload.length; ++i) {
                upload[i].renameTo(new File(fileOfPanoramas, Integer.toString(i) + ".jpg"));
                var10002 = designer.getDesignerId();
                ExamplePanorama panorama = new ExamplePanorama("file/" + var10002 + "/" + example.getName() + "/panoramas/" + Integer.toString(i) + ".jpg");
                this.examplePanoramaDAO.save(panorama);
                example.getPanoramas().add(panorama);
            }

            for(i = 0; i < upload2.length; ++i) {
                upload2[i].renameTo(new File(fileOfPictures, Integer.toString(i) + ".jpg"));
                var10002 = designer.getDesignerId();
                ExamplePicture picture = new ExamplePicture("file/" + var10002 + "/" + example.getName() + "/pictures/" + Integer.toString(i) + ".jpg");
                this.examplePictureDAO.save(picture);
                example.getPictures().add(picture);
            }

            example.setPraise(0);
            example.setVisits(0);
            example.setTime(new Timestamp((new Date()).getTime()));
            designer.getExamples_own().add(example);
            this.designerDAO.update(designer);
            Designer designer_old = (Designer)this.session.get("designer");
            Designer designer_new = this.designerDAO.findById(designer_old.getDesignerId());
            this.session.put("designer", designer_new);
            Integer count = (Integer)servletContext.getAttribute("examplenum");
            servletContext.setAttribute("examplenum", count + 1);
            return true;
        } catch (Exception var13) {
            var13.printStackTrace();
            return false;
        }
    }

    public boolean removeCase(Integer exampleId) {
        Example example = this.exampleDAO.findById(exampleId);
        this.exampleDAO.delete(example);
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Designer designer_old = (Designer)this.session.get("designer");
        Designer designer_new = this.designerDAO.findById(designer_old.getDesignerId());
        this.session.put("designer", designer_new);
        return true;
    }

    public boolean putDesigner(Designer designer) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        if (this.session.get("designer") != null) {
            String id = ((Designer)this.session.get("designer")).getDesignerId();
            if (designer.getDesignerId().equals(id)) {
                return true;
            } else {
                designer = this.designerDAO.findById(designer.getDesignerId());
                this.request.put("designer", designer);
                return false;
            }
        } else {
            designer = this.designerDAO.findById(designer.getDesignerId());
            this.request.put("designer", designer);
            return false;
        }
    }

    public boolean judgeIdentity() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        return this.session.get("designer") != null;
    }

    public boolean viewExampleDetails(Designer designer, Example example) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        example = this.exampleDAO.findById(example.getExampleId());
        designer = this.designerDAO.findById(designer.getDesignerId());
        if (example != null && designer != null) {
            this.request.put("designer", designer);
            this.request.put("example", example);
            return true;
        } else {
            return false;
        }
    }

    public boolean registerDes(Designer designer) {
        String phone = designer.getPhone();
        String hql = "from Designer where phone='" + phone + "'";
        System.out.println(phone);
        if (this.designerDAO.findByHql(hql).isEmpty()) {
            String id = this.designerDAO.findDes();
            if (id == null) {
                String a = "0000000001";
                designer.setDesignerId(a);
            } else {
                Integer a = Integer.parseInt(id) + 1;
                String b = "0" + a.toString();
                designer.setDesignerId(b);
            }

            designer.setAccount(designer.getPhone());
            designer.setName("abc");
            designer.setIDNumber("0000000");
            designer.setProfilePhoto("");

            try {
                this.designerDAO.save(designer);
                return true;
            } catch (Exception var7) {
                var7.printStackTrace();
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean findAll() {
        ActionContext ctx = ActionContext.getContext();
        String hql = "from cn.edu.zjut.po.Designer";
        List designers = this.designerDAO.findByHql(hql);
        this.request = (Map)ctx.get("request");
        this.request.put("designers", designers);
        return true;
    }

    public boolean findByPraise() {
        ActionContext ctx = ActionContext.getContext();
        String hql = "from cn.edu.zjut.po.Designer d where d.praise >=15";
        List designers = this.designerDAO.findByHql(hql);
        this.request = (Map)ctx.get("request");
        this.request.put("designers", designers);
        return true;
    }

    public boolean findByScore() {
        ActionContext ctx = ActionContext.getContext();
        String hql = "from cn.edu.zjut.po.Designer d where d.score >=1 ";
        List designers = this.designerDAO.findByHql(hql);
        this.request = (Map)ctx.get("request");
        this.request.put("designers", designers);
        return true;
    }

    public boolean logout() {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        this.session.clear();
        return true;
    }

    public boolean update(Designer designer, File profile, String profileFileName) {
        ServletContext servletContext = ServletActionContext.getServletContext();
        System.out.println("in update");
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        System.out.println("designer.getDesignerId():" + designer.getDesignerId());
        System.out.println("designer.getAccount(): " + designer.getAccount());
        System.out.println(designer.getPassword());
        if (profile != null) {
            String save = servletContext.getRealPath("/designer/designer/profilephoto/");
            save = this.copyfile(save, profile, profileFileName);
            designer.setProfilePhoto(profileFileName);
            System.out.println(save);
        }

        Designer d = (Designer)this.session.get("designer");
        d.setAccount(designer.getAccount());
        d.setPassword(designer.getPassword());
        d.setProfilePhoto(designer.getProfilePhoto());
        d.setName(designer.getName());
        d.setIDNumber(designer.getIDNumber());
        d.setSex(designer.getSex());
        d.setRegion(designer.getRegion());
        d.setPhone(designer.getPhone());
        d.setEmail(designer.getEmail());
        d.setQq(designer.getQq());
        d.setWechat(designer.getWechat());
        d.setIntroduction(designer.getIntroduction());

        try {
            this.designerDAO.update(d);
            this.request.put("tip", "修改成功");
            this.session.put("designer", designer);
            return true;
        } catch (Exception var8) {
            this.request.put("tip", "修改失败");
            var8.printStackTrace();
            return false;
        }
    }

    public boolean update2(Designer designer, File certificate, String certificateFileName) {
        ServletContext servletContext = ServletActionContext.getServletContext();
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        if (certificate != null) {
            String save2 = servletContext.getRealPath("/designer/designer/certificate/");
            save2 = this.copyfile(save2, certificate, certificateFileName);
            designer.setCertificate(certificateFileName);
            designer.setStatus("审核中");
            System.out.println(save2);
        }

        Designer d = (Designer)this.session.get("designer");
        System.out.println(d.getDesignerId());
        d.setPrize(designer.getPrize());
        d.setCertificate(designer.getCertificate());
        d.setStatus(designer.getStatus());

        try {
            this.designerDAO.update(d);
            this.request.put("tip", "申请已提交，请耐心等待");
            this.session.put("designer", d);
            return true;
        } catch (Exception var8) {
            this.request.put("tip", "申请失败");
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

        path = path + "\\" + filename;
        return path;
    }

    public boolean recommend1(int money1) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        Designer designer = (Designer)this.session.get("designer");
        designer.setStatus1(1);
        designer.setMoney1(money1);

        try {
            this.designerDAO.update(designer);
            this.request.put("tip", "您已申请推优!");
            this.session.put("designer", designer);
            return true;
        } catch (Exception var5) {
            this.request.put("tip", "");
            var5.printStackTrace();
            return false;
        }
    }

    public boolean recommend2(int money1) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        Designer designer = (Designer)this.session.get("designer");
        designer.setStatus1(3);
        designer.setMoney1(money1);

        try {
            this.designerDAO.update(designer);
            this.session.put("designer", designer);
            return true;
        } catch (Exception var5) {
            this.request.put("tip", "");
            var5.printStackTrace();
            return false;
        }
    }

    public boolean recommend3(String message) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        Designer designer = (Designer)this.session.get("designer");
        designer.setMessage(message);
        designer.setStatus1(3);

        try {
            this.designerDAO.update(designer);
            this.session.put("designer", designer);
            this.request.put("tip", "");
            return true;
        } catch (Exception var5) {
            this.request.put("tip", "");
            var5.printStackTrace();
            return false;
        }
    }

    public boolean searchByAccount(String account) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        String hql = "from Designer as d where d.account like '%" + account + "%'";
        List designers = this.designerDAO.findByHql(hql);
        this.request.put("designers", designers);
        return true;
    }
}
