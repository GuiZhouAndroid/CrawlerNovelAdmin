package com.lpssfxy.ldy.crawlernoveladmin.utils;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * created by on 2021/11/8
 * 描述：封装Json数据返回统一格式
 *
 * @author 龙大艳
 * @create 2021-11-08-21:31
 */
@Data
public class JsonResult<T> implements Serializable {
    private T data;//数据内容
    private Integer code;//状态码
    private String msg;//提示消息


    /**
     * 无数据返回，指定状态码和提示信息
     *
     * @param resultCode
     */
    public JsonResult setJsonResult(ResultCode resultCode) {
        this.code = resultCode.getCode();
        this.msg = resultCode.getMessage();
        return this;
    }


    /**
     * 有数据返回，状态码为 200，人为指定提示信息
     *
     * @param resultCode
     * @param data
     */
    public JsonResult setJsonResult(ResultCode resultCode, T data) {
        this.code = resultCode.getCode();
        this.msg = resultCode.getMessage();
        this.data = data;
        return this;
    }

    public JsonResult() {
    }

    /**
     * 自定义
     *
     * @param data
     * @param msg
     */
    public JsonResult(Integer code, T data, String msg) {
        this.code = code;
        this.data = data;
        this.msg = msg;
    }
}

