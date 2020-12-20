package cn.edu.zjut.intercepter;

import cn.edu.zjut.po.Admin;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.Map;

public class AuthorityInterceptor extends AbstractInterceptor {
    public AuthorityInterceptor() {
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        System.out.println("Authority Interceptor executed!");
        ActionContext ctx = invocation.getInvocationContext();
        Map session = ctx.getSession();
        Designer user = (Designer)session.get("designer");
        Employer e = (Employer)session.get("employer");
        Admin a = (Admin)session.get("admin");
        if (user == null && e == null && a == null) {
            ctx.put("tip", "您还没有登录，请输入用户名和密码登录系统miss login");
            return "login";
        } else {
            return invocation.invoke();
        }
    }
}