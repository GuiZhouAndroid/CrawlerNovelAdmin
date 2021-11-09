package com.lpssfxy.ldy.crawlernoveladmin.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lpssfxy.ldy.crawlernoveladmin.entity.UserBean;
import com.lpssfxy.ldy.crawlernoveladmin.service.UserService;
import com.lpssfxy.ldy.crawlernoveladmin.utils.JsonResult;
import com.lpssfxy.ldy.crawlernoveladmin.utils.ResultCode;
import com.lpssfxy.ldy.crawlernoveladmin.utils.ResultUtil;
import com.lpssfxy.ldy.crawlernoveladmin.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 龙大艳
 * @since 2021-11-08
 */
@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    UserService userService;

    /**
     * 查询MySQL数据库books中user表 全部用户编号 + 用户名--->密码涉及安全，因此不查询
     * @return 返回Json数据，用于APP解析使用
     */
    @RequestMapping("selectUserAllInfo")
    public JsonResult selectUserAllInfo(){
        QueryWrapper<UserBean> queryWrapper = new QueryWrapper<UserBean>().select("id","login_name");
        List<UserBean> userInfoList = userService.list(queryWrapper);
        return ResultUtil.successSate(userInfoList);
    }

    /**
     * 超级管理员登录
     * @return 返回Json数据，用于APP解析使用
     */
    @RequestMapping("superAdminUserLogin/{username}/{password}")
    public JsonResult superAdminUserLogin(@PathVariable(value = "username") String username,@PathVariable(value = "password") String password){
        QueryWrapper<UserBean> queryWrapper = new QueryWrapper<UserBean>().select("*").eq("login_name",username).eq("password",password);
        UserBean ifHaveLogin = userService.getOne(queryWrapper);
        if (ifHaveLogin !=null){
            //登录失败
            return ResultUtil.successSate(ifHaveLogin);
        }
        //登录失败
        return ResultUtil.failure(ResultCode.SUCCESS_AND_FAIL,null);
    }
}
