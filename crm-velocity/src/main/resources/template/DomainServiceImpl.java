package cn.itsource.service.impl;


import cn.itsource.mapper.BaseMapper;
import cn.itsource.service.impl.BaseServiceImpl;
import cn.itsource.domain.${Domain};
import cn.itsource.mapper.${Domain}Mapper;
import cn.itsource.service.I${Domain}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: wenbing
 * @Date: 2018/10/17 14:45
 * @Version 1.0
 */
@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class ${Domain}ServiceImpl extends BaseServiceImpl<${Domain}> implements I${Domain}Service {
    @Autowired
    private ${Domain}Mapper ${domain}Mapper;

    @Override
    protected BaseMapper<${Domain}> getMapper() {
        return ${domain}Mapper;
    }



//  事务测试
// @Transactional
//    @Override
//    public void add(${Domain} ${domain}) {
//        System.out.println("come on");
//        ${domain}Mapper.save(${domain});
//        int i=1/0;
//    }
}
