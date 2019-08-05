package cn.itsource.service.impl;


import cn.itsource.domain.Menu;
import cn.itsource.mapper.MenuMapper;
import cn.itsource.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 14:45
 * @Version 1.0
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements IMenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> findMenuByLoginUser(Long id) {
        //定义一个空集合，该集合专门用来装一级菜单
        List<Menu> parents = new ArrayList<>();
        Menu father = null;
        //查询出来的数据全部都是二级菜单
        List<Menu> chidren = menuMapper.findMenuByLoginUser(id); //二级菜单[角色管理,菜单管理,权限管理,导入管理,部门管理，员工管理]
        for (Menu menu : chidren) {
            //拿到一级菜单
            father= menuMapper.selectByPrimaryKey(menu.getParentId());
            //System.out.println(father);
            /*Menu parentId = menu2.getParentId();*///组织机构
            if(!parents.contains(father) ){//如果不包含一级菜单则添加进去
                parents.add(father);
            }
            //父菜单添加子菜单
           /* System.out.println(menu.getName());*/
           father.getChildren().add(menu);
            /*System.out.println(father);
            System.out.println(father.getChildren());*/
        }
        return parents;
    }


//  事务测试
// @Transactional
//    @Override
//    public void add(Menu menu) {
//        System.out.println("come on");
//        menuMapper.save(menu);
//        int i=1/0;
//    }
}
