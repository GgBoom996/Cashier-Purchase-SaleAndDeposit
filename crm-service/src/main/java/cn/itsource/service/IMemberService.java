package cn.itsource.service;

import cn.itsource.domain.Member;
import cn.itsource.query.BaseQuery;
import cn.itsource.query.MemberQuery;
import cn.itsource.util.PageResult;

import java.util.List;

public interface IMemberService extends  IBaseService<Member>{
    PageResult selectForList(BaseQuery qo);

    void deleteByPrimaryKey(Long id);

    int save(Member member);


}
