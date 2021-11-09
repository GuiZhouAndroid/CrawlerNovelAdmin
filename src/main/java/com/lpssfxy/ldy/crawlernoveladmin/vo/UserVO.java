package com.lpssfxy.ldy.crawlernoveladmin.vo;

import lombok.Data;

/**
 * created by on 2021/11/8
 * 描述：定制用户信息返回内容，去除密码字段
 *
 * @author 龙大艳
 * @create 2021-11-08-21:47
 */

@Data
public class UserVO {
    private Long id;
    private String loginName;

    public UserVO() {
    }

    public UserVO(Long id, String loginName) {
        this.id = id;
        this.loginName = loginName;
    }
}
