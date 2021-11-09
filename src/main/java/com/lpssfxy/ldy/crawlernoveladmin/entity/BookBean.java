package com.lpssfxy.ldy.crawlernoveladmin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 龙大艳
 * @since 2021-11-09
 */
@Getter
@Setter
@Accessors(chain = true)
@TableName("book")
public class BookBean extends Model<BookBean> {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @Ignore
    @TableField("catId")
    private Integer catId;

    @Ignore
    @TableField("pic_url")
    private String picUrl;

    @TableField("book_name")
    private String bookName;

    @TableField("author")
    private String author;

    @Ignore
    @TableField("book_desc")
    private String bookDesc;

    @Ignore
    @TableField("score")
    private Float score;

    @Ignore
    @TableField("book_status")
    private String bookStatus;

    @Ignore
    @TableField("visit_count")
    private Long visitCount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    @TableField("update_time")
    private LocalDateTime updateTime;

    @Ignore
    @TableField("soft_cat")
    private Integer softCat;

    @Ignore
    @TableField("soft_tag")
    private String softTag;

}
