package cn.itsource.mapper;

import cn.itsource.domain.MyPage;
import java.util.List;

public interface MyPageMapper extends BaseMapper<MyPage>{
    int deleteByPrimaryKey(Long id);

    MyPage selectByPrimaryKey(Long id);
}