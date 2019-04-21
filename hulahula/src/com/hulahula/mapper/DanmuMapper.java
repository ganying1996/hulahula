package com.hulahula.mapper;

import com.hulahula.pojo.Danmu;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.mapper
 *
 * @author : ganying
 * @date : 2019-04-10 14:35
 */
public interface DanmuMapper {

    /**
     *插入一条弹幕数据
     * @param danmu
     * @return
     */
    @Insert("insert into danmu values(default,#{color},#{position},#{size},#{text},#{time},#{video_id})")
    int insByDanmu(Danmu danmu);

    /**
     * 根据视频id获取该视频所有弹幕
     * @param avid
     * @return
     */
    @Select("SELECT * from danmu where video_id=#{avid}")
    List<Danmu> selAllByAvid(int avid);
}
