package cn.itsource.service.impl;


import cn.itsource.mapper.BaseMapper;
import cn.itsource.service.impl.BaseServiceImpl;
import cn.itsource.domain.MyPage;
import cn.itsource.mapper.MyPageMapper;
import cn.itsource.service.IMyPageService;
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
public class MyPageServiceImpl extends BaseServiceImpl<MyPage> implements IMyPageService {

//  事务测试
// @Transactional
//    @Override
//    public void add(MyPage myPage) {
//        System.out.println("come on");
//        myPageMapper.save(myPage);
//        int i=1/0;
//    }
}
