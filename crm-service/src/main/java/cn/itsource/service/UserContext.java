package cn.itsource.service;

import cn.itsource.domain.Employee;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class UserContext {
    public static final String LOGIN_IN_SESSION = "loginUser";
    public static void setSesssion(Employee employee){
        Subject subject = SecurityUtils.getSubject();
        subject.getSession().setAttribute(LOGIN_IN_SESSION, employee);
    }

    public static Employee getUser(){
        Subject subject = SecurityUtils.getSubject();
        return (Employee) subject.getSession().getAttribute(LOGIN_IN_SESSION);
    }
    public static Long getId(){
        Subject subject = SecurityUtils.getSubject();
        Employee attribute = (Employee) subject.getSession().getAttribute(LOGIN_IN_SESSION);
        Long id = attribute.getId();
        return id;
    }
}