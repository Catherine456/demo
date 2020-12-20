//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;

public class PanoramaService implements IPanoramaService {
    private Map<String, Object> request;
    private Map<String, Object> session;

    public PanoramaService() {
    }

    public void show(String path) {
        ActionContext ctx = ActionContext.getContext();
        this.request = (Map)ctx.get("request");
        this.request.put("path", path);
    }
}
