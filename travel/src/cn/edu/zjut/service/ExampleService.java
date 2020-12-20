//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.dao.ICommentsDAO;
import cn.edu.zjut.dao.IDesignerDAO;
import cn.edu.zjut.dao.IEmployerDAO;
import cn.edu.zjut.dao.IExampleDAO;
import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.DisplayCom;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import com.opensymphony.xwork2.ActionContext;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ExampleService implements IExampleService {
    private List examples = new ArrayList();
    private List sortedexamples = new ArrayList();
    private Map<String, Object> request;
    private Map<String, Object> session;
    private IDesignerDAO designerDAO = null;
    private IExampleDAO exampleDAO = null;
    private IEmployerDAO employerDAO = null;
    private ICommentsDAO commentsDAO = null;

    public ExampleService() {
    }

    public void setDesignerDAO(IDesignerDAO designerDAO) {
        System.out.println("SetdesignerDAO");
        this.designerDAO = designerDAO;
    }

    public void setExampleDAO(IExampleDAO exampleDAO) {
        System.out.println("SetexampleDAO");
        this.exampleDAO = exampleDAO;
    }

    public void setEmployerDAO(IEmployerDAO employerDAO) {
        System.out.println("SetemployerDAO");
        this.employerDAO = employerDAO;
    }

    public void setCommentsDAO(ICommentsDAO commentsDAO) {
        System.out.println("SetcommentsDAO");
        this.commentsDAO = commentsDAO;
    }

    public List findAllExamples(String condition) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        String hql = "from Example as ex where ex.description like '%" + condition + "%'";
        this.examples = this.exampleDAO.findByHql(hql);
        this.request.put("examples", this.examples);
        return this.examples;
    }

    public void putExample(Example example) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        example = this.exampleDAO.findById(example.getExampleId());
        this.request.put("example", example);
        new HashSet();
        Set<DisplayCom> displayComs = new HashSet(0);
        Set<Comments> commentss = example.getComments();
        Iterator<Comments> it = commentss.iterator();
        new Designer();
        new Employer();

        while(it.hasNext()) {
            DisplayCom displayCom = new DisplayCom();
            Comments comment = (Comments)it.next();
            String str = comment.getReviewer();
            if (str.charAt(0) == '0') {
                Designer designer = this.designerDAO.findById(str);
                displayCom.setProfilePhoto(designer.getProfilePhoto());
                displayCom.setAccount(designer.getAccount());
                displayCom.setContent(comment.getContent());
                displayCom.setTime(comment.getTime());
                displayComs.add(displayCom);
            } else {
                Employer employer = this.employerDAO.findById(str);
                displayCom.setProfilePhoto(employer.getProfilePhoto());
                displayCom.setAccount(employer.getAccount());
                displayCom.setContent(comment.getContent());
                displayCom.setTime(comment.getTime());
                displayComs.add(displayCom);
            }
        }

        this.request.put("displayComs", displayComs);
    }

    public boolean review(Example example, Comments comments) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.session = (Map)ctx.get("session");
        if (this.session.get("designer") != null) {
            Designer designer = (Designer)this.session.get("designer");
            comments.setReviewer(designer.getDesignerId());
        } else {
            Employer employer = (Employer)this.session.get("employer");
            comments.setReviewer(employer.getEmployerId());
        }

        try {
            comments.setTime(new Timestamp((new Date()).getTime()));
            example = this.exampleDAO.findById(example.getExampleId());
            example.getComments().add(comments);
            System.out.println(example.getVisits());
            example.setVisits(example.getVisits() + 1);
            this.exampleDAO.update(example);
            this.request.put("example", example);
            new HashSet();
            Set<DisplayCom> displayComs = new HashSet(0);
            Set<Comments> commentss = example.getComments();
            Iterator<Comments> it = commentss.iterator();
            new Designer();
            new Employer();

            while(it.hasNext()) {
                DisplayCom displayCom = new DisplayCom();
                Comments comment = (Comments)it.next();
                String str = comment.getReviewer();
                if (str.charAt(0) == '0') {
                    Designer designer = this.designerDAO.findById(str);
                    displayCom.setProfilePhoto(designer.getProfilePhoto());
                    displayCom.setAccount(designer.getAccount());
                    displayCom.setContent(comment.getContent());
                    displayCom.setTime(comment.getTime());
                    displayComs.add(displayCom);
                } else {
                    Employer employer = this.employerDAO.findById(str);
                    displayCom.setProfilePhoto(employer.getProfilePhoto());
                    displayCom.setAccount(employer.getAccount());
                    displayCom.setContent(comment.getContent());
                    displayCom.setTime(comment.getTime());
                    displayComs.add(displayCom);
                }
            }

            this.request.put("displayComs", displayComs);
            return true;
        } catch (Exception var12) {
            var12.printStackTrace();
            return false;
        }
    }

    public List findAll() {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        String hql = "from cn.edu.zjut.po.Example";
        this.examples = this.exampleDAO.findByHql(hql);
        this.request.put("examples", this.examples);
        return this.examples;
    }

    public List searchInFrame(String condition) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        String hql = "from Example as ex where ex.name like '%" + condition + "%'";
        String hql2 = "from Example as ex where ex.name like '%" + condition + "%' order by ex.praise";
        System.out.println(hql);
        this.examples = this.exampleDAO.findByHql(hql);
        this.sortedexamples = this.exampleDAO.findByHql(hql2);
        this.request.put("examples", this.examples);
        this.request.put("sortedexamples", this.sortedexamples);
        return this.examples;
    }

    public List searchInList(List<String> list) {
        ActionContext ctx = ActionContext.getContext();
        this.session = ctx.getSession();
        this.request = (Map)ctx.get("request");
        String var10000 = (String)list.get(1);
        String hql = "from Example as ex where ex.style like '%" + var10000 + "%' and ex.area like '%" + (String)list.get(2) + "%'";
        var10000 = (String)list.get(1);
        String hql2 = "from Example as ex where ex.style like '%" + var10000 + "%' and ex.area like '%" + (String)list.get(2) + "%' order by ex.praise";
        this.examples = this.exampleDAO.findByHql(hql);
        this.sortedexamples = this.exampleDAO.findByHql(hql2);
        System.out.println("sortedexamples:" + this.sortedexamples.size());
        this.request.put("examples", this.examples);
        this.request.put("sortedexamples", this.sortedexamples);
        return this.examples;
    }

    public int praise(String exampleId) {
        Example example = this.exampleDAO.findById(Integer.parseInt(exampleId));
        System.out.println("example.getPraise():" + example.getPraise());
        example.setPraise(example.getPraise() + 1);
        System.out.println("example.getPraise()222:" + example.getPraise());
        this.exampleDAO.update(example);
        System.out.println("ok");
        return example.getPraise();
    }

    public void star(String exampleId) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Example example = this.exampleDAO.findById(Integer.parseInt(exampleId));
        example.getEm_collecters().add((Employer)this.session.get("employer"));
        Employer tempemployer = (Employer)this.session.get("employer");
        this.exampleDAO.update(example);
        this.session.put("employer", this.employerDAO.findById(tempemployer.getEmployerId()));
    }

    public void unstar(String exampleId) {
        ActionContext ctx = ActionContext.getContext();
        this.session = (Map)ctx.get("session");
        Example example = this.exampleDAO.findById(Integer.parseInt(exampleId));
        example.getEm_collecters().remove((Employer)this.session.get("employer"));
        Iterator it = example.getEm_collecters().iterator();

        Employer employertemp;
        while(it.hasNext()) {
            employertemp = (Employer)it.next();
            if (((Employer)this.session.get("employer")).getEmployerId().equals(employertemp.getEmployerId())) {
                System.out.println("find it:" + employertemp.getEmployerId());
                it.remove();
            }
        }

        employertemp = (Employer)this.session.get("employer");
        this.exampleDAO.update(example);
        this.session.put("employer", this.employerDAO.findById(employertemp.getEmployerId()));
    }
}
