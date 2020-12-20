//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.IDesignerService;
import cn.edu.zjut.service.IExampleService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

public class ExampleAction {
    private String condition;
    private List examples;
    private Example example;
    private Comments comments;
    private String exampleId;
    private List<String> conditionList = new ArrayList();
    private String radio1;
    private String radio2;
    private String radio3;
    @Autowired
    private IExampleService exampleServ = null;

    public ExampleAction() {
    }

    public IExampleService getExampleServ() {
        return this.exampleServ;
    }

    public void setExampleServ(IExampleService exampleServ) {
        System.out.println("SetexampleServ");
        this.exampleServ = exampleServ;
    }

    public String getCondition() {
        return this.condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public List getExamples() {
        return this.examples;
    }

    public void setExamples(List examples) {
        this.examples = examples;
    }

    public Example getExample() {
        return this.example;
    }

    public void setExample(Example example) {
        this.example = example;
    }

    public Comments getComments() {
        return this.comments;
    }

    public void setComments(Comments comments) {
        this.comments = comments;
    }

    public String findAllExample() {
        this.examples = this.exampleServ.findAll();
        return "success";
    }

    public String putExample() {
        this.exampleServ.putExample(this.example);
        return "success";
    }

    public String review() {
        return this.exampleServ.review(this.example, this.comments) ? "viewSuccess" : "viewFail";
    }

    public String searchInFrame() {
        this.examples = this.exampleServ.searchInFrame(this.condition);
        return "success";
    }

    public String searchInList() {
        System.out.println("in searchList");
        System.out.println("1:" + this.radio1 + "2:" + this.radio2 + "3:" + this.radio3);
        if (this.radio1 != null) {
            this.conditionList.add(this.radio1);
        } else {
            this.conditionList.add("");
        }

        if (this.radio2 != null) {
            this.conditionList.add(this.radio2);
        } else {
            this.conditionList.add("");
        }

        if (this.radio3 != null) {
            this.conditionList.add(this.radio3);
        } else {
            this.conditionList.add("");
        }

        this.examples = this.exampleServ.searchInList(this.conditionList);
        return "success";
    }

    public String praise() throws IOException {
        System.out.println("exampleId:" + this.exampleId);
        int num = this.exampleServ.praise(this.exampleId);
        ServletActionContext.getResponse().getWriter().print(num);
        return null;
    }

    public String star() throws IOException {
        System.out.println("exampleId:" + this.exampleId);
        this.exampleServ.star(this.exampleId);
        return null;
    }

    public String unstar() throws IOException {
        System.out.println("in unstar action ");
        System.out.println("exampleId:" + this.exampleId);
        this.exampleServ.unstar(this.exampleId);
        return null;
    }

    public String unstarInList() throws IOException {
        System.out.println("in unstar action ");
        System.out.println("exampleId:" + this.exampleId);
        this.exampleServ.unstar(this.exampleId);
        return "success";
    }

    public String getRadio1() {
        return this.radio1;
    }

    public void setRadio1(String radio1) {
        this.radio1 = radio1;
    }

    public String getRadio2() {
        return this.radio2;
    }

    public void setRadio2(String radio2) {
        this.radio2 = radio2;
    }

    public String getRadio3() {
        return this.radio3;
    }

    public void setRadio3(String radio3) {
        this.radio3 = radio3;
    }

    public String getExampleId() {
        return this.exampleId;
    }

    public void setExampleId(String exampleId) {
        this.exampleId = exampleId;
    }
}
