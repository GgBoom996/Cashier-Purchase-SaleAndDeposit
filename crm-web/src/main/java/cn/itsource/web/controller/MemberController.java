package cn.itsource.web.controller;

import cn.itsource.domain.Employee;
import cn.itsource.util.AjaxResult;
import cn.itsource.domain.Member;
import cn.itsource.query.MemberQuery;
import cn.itsource.service.IMemberService;
import cn.itsource.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private IMemberService memberService;

    @RequestMapping("/index")
    public String index() {
        return "member/member";
    }

    @RequestMapping("/list")
    @ResponseBody//json
    public PageResult list(MemberQuery qo) {

        return memberService.selectForList(qo);
    }

    // member/delete?id
    @RequestMapping("/delete")
    @ResponseBody//json
    public AjaxResult delete(Long id) {
        try {
            memberService.deleteByPrimaryKey(id);
            return AjaxResult.success();
        }catch (Exception e){
            e.printStackTrace();
            return AjaxResult.error("失败:" + e.getMessage());
        }
    }

    // member/saveOrUpdate
    @RequestMapping("/saveOrUpdate")
    @ResponseBody//json
    public AjaxResult saveOrUpdate(Member member) {

        if (member != null) {
            try {
                //判断是否有id,有就是修改,没有就是添加
                if (member.getId() != null) {
                    //修改
                    memberService.updateByPrimaryKey(member);
                } else {
                    //添加
                    memberService.save(member);
                }
                return AjaxResult.success();
            } catch (Exception e) {
                e.printStackTrace();
                return AjaxResult.error("操作失败:"+e.getMessage());
            }
        }
        return null;
    }



}

