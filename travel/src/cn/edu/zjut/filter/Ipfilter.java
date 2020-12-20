package cn.edu.zjut.filter;

import java.io.IOException;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

@WebFilter({"/Ipfilter"})
public class Ipfilter implements Filter {
    public Ipfilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
        ServletContext servletContext = webApplicationContext.getServletContext();
        List<String> iplist = (List)servletContext.getAttribute("iplist");
        String ip = request.getRemoteAddr();
        boolean flag = false;

        for(int i = 0; i < iplist.size(); ++i) {
            if (((String)iplist.get(i)).equals(ip)) {
                flag = true;
            }
        }

        if (!flag) {
            Integer count = (Integer)servletContext.getAttribute("visit");
            servletContext.setAttribute("visit", count + 1);
            iplist.add(ip);
            servletContext.setAttribute("iplist", iplist);
        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }
}
