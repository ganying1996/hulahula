package com.hulahula.service;

import com.hulahula.pojo.Danmu;

import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-04-10 14:43
 */
public interface DanmuService {

    /**
     * 插入一条弹幕数据
     * @param danmu
     * @return
     */
    int insByDanmu(Danmu danmu);

    /**
     * 根据视频id查询所有弹幕
     * @param avid
     * @return
     */
    List<Danmu> selAllByAvid(int avid);
}
