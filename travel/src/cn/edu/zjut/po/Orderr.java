package cn.edu.zjut.po;

import java.util.Date;

public class Orderr {
    private String orderrId;
    private String title;
    private String description;
    private Date beginTime;
    private Date designTime;
    private Date finishTime;
    private Float money;
    private String state;
    private Employer employer;
    private Designer designer;

    public Orderr() {
    }

    public Orderr(String orderrId) {
        this.setOrderrId(orderrId);
    }

    public Orderr(String orderrId, String title, String description, Date beginTime, Date designTime, Date finishTime, Float money, String state, Employer employer, Designer designer) {
        this.orderrId = orderrId;
        this.title = title;
        this.description = description;
        this.beginTime = beginTime;
        this.designTime = designTime;
        this.finishTime = finishTime;
        this.money = money;
        this.state = state;
        this.employer = employer;
        this.designer = designer;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getBeginTime() {
        return this.beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getDesignTime() {
        return this.designTime;
    }

    public void setDesignTime(Date designTime) {
        this.designTime = designTime;
    }

    public Date getFinishTime() {
        return this.finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public Float getMoney() {
        return this.money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOrderrId() {
        return this.orderrId;
    }

    public void setOrderrId(String orderrId) {
        this.orderrId = orderrId;
    }

    public Employer getEmployer() {
        return this.employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }

    public Designer getDesigner() {
        return this.designer;
    }

    public void setDesigner(Designer designer) {
        this.designer = designer;
    }
}
