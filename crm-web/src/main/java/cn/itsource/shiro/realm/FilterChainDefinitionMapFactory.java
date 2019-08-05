package cn.itsource.shiro.realm;


import cn.itsource.domain.Permission;
import cn.itsource.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class FilterChainDefinitionMapFactory {
    @Autowired
    private IPermissionService permissionService;


    public Map<String,String> createMap(){
        List<Permission> permissions = permissionService.findAll();
        Map<String, String> map = new LinkedHashMap<>();
        map.put("/images/**", "anon");
        map.put("/static/**", "anon");
        map.put("/login", "anon");
        map.put("/logout", "logout");
        for (Permission permission : permissions) {
            map.put(permission.getUrl(), "itsourcePerms["+permission.getSn()+"]");
        }
        map.put("/**", "authc");
        return map;
    }

}
