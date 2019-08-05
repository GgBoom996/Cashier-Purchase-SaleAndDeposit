package cn.itsource.mapper;

import cn.itsource.domain.Member;
import cn.itsource.query.BaseQuery;

import java.util.List;

public interface MemberMapper extends BaseMapper<Member>{
    int deleteByPrimaryKey(Long id);

    Member selectByPrimaryKey(Long id);

    List<Member> selectKeywords(BaseQuery qo);
}