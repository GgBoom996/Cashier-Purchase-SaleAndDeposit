package cn.itsource.shiro.realm;

import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 覆盖底层方法判断业务逻辑
 */
public class ItsourcePermissionsAuthorizationFilter extends PermissionsAuthorizationFilter{

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest req = ((HttpServletRequest) request);
        HttpServletResponse resp = ((HttpServletResponse) response);
        resp.setContentType("text/json;charset=UTF-8");
        //通过请求头信息来判断它是ajax请求还是普通请求
        String header = req.getHeader("X-Requested-With");
        if (StringUtils.hasText(header)) {//如果header有值，就证明是ajax请求
            resp.getWriter().print("{\"success\":false,\"msg\":\"对不起,你没有对应的权限,赶快充值!!\"}");
            return false;
        }else{//如果是普通请求依然走之前的业务逻辑
            return super.onAccessDenied(request, response);
        }

    }
}
