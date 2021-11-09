package com.lpssfxy.ldy.crawlernoveladmin.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lpssfxy.ldy.crawlernoveladmin.entity.BookBean;
import com.lpssfxy.ldy.crawlernoveladmin.service.BookService;
import com.lpssfxy.ldy.crawlernoveladmin.utils.JsonResult;
import com.lpssfxy.ldy.crawlernoveladmin.utils.ResultCode;
import com.lpssfxy.ldy.crawlernoveladmin.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 龙大艳
 * @since 2021-11-09
 */
@RestController
@RequestMapping("/book/")
public class BookController {

    @Autowired
    BookService bookService;

    /**
     * 查询MySQL数据库books中book表 全部小说信息
     *
     * @return 返回Json数据，用于APP解析使用
     */
    @RequestMapping("selectBookAllInfo")
    public JsonResult selectBookAllInfo() {
        QueryWrapper<BookBean> queryWrapper = new QueryWrapper<BookBean>().select("id", "book_name", "author", "update_time");
        List<BookBean> bookBeanList = bookService.list(queryWrapper);
        if (bookBeanList != null) {
            //登录失败
            return ResultUtil.successSate(bookBeanList);
        }
        //登录失败
        return ResultUtil.failure(ResultCode.SUCCESS_AND_FAIL, null);
    }
}
