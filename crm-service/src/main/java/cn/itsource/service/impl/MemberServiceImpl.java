package cn.itsource.service.impl;


import cn.itsource.query.BaseQuery;
import cn.itsource.domain.Member;
import cn.itsource.mapper.MemberMapper;
import cn.itsource.service.IMemberService;
import cn.itsource.util.MD5Util;
import cn.itsource.util.PageResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;





@Service
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class MemberServiceImpl extends BaseServiceImpl<Member> implements IMemberService {
    @Autowired
    private MemberMapper memberMapper;

//    @Override
//    public void updateStateToDisable(Long id) {
//        Member member = memberMapper.selectByPrimaryKey(id);
//
//        //判断状态
//        if(member.getState() == 0){
//            //2.修改状态
//            member.setState(0);
//            updateByPrimaryKey(member);
//        }
//    }


    @Override
    public int save(Member m) {
        m.setPassword(MD5Util.createMd5(m.getPassword()));
        return  memberMapper.insert(m);
    }

    @Override
    public PageResult selectForList(BaseQuery qo) {
        PageHelper.startPage(qo.getPage(), qo.getRows());
        Page page = (Page) memberMapper.selectKeywords(qo);
        return new PageResult(page.getTotal(), page.getResult());
    }

    @Override
    public void deleteByPrimaryKey(Long id) {
        memberMapper.deleteByPrimaryKey(id);
    }
}
