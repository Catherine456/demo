//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.action;

import cn.edu.zjut.service.IPanoramaService;

public class PanoramaAction {
    private String path;
    IPanoramaService panoramaServ = null;

    public PanoramaAction() {
    }

    public void setPanoramaServ(IPanoramaService panoramaServ) {
        this.panoramaServ = panoramaServ;
    }

    public String getPath() {
        return this.path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String show() {
        this.panoramaServ.show(this.path);
        return "showSuccess";
    }
}
