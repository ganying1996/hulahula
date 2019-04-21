package com.hulahula.service;

import com.hulahula.mapper.AvMapper;
import com.hulahula.pojo.Av;

import javax.annotation.Resource;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-03-31 12:40
 */
public interface AvService {

    /**
     * 添加一条视频记录
     * @param av
     * @return
     */
    int insByAv(Av av);

    /**
     * 按照类型查询8条最新视频记录
     * @param tpye
     * @return
     */
    List<Av> selByType(int tpye);

    /**
     * 依据视频id修改视频播放次数
     * @param id
     * @param playnum
     * @return
     */
    int updPlaynumById(int id,int playnum);

    /**
     * 根据视频id修改点赞次数
     * @param id
     * @param likenum
     * @return
     */
    int updLikenumById(int id, int likenum);

    /**
     * 根据视频id修改收藏数
     * @param id
     * @param colnum
     * @return
     */
    int updColnumById(int id, int colnum);


    /**
     * 根据用户的id查询用户最近收藏的4条视频
     * @param uid
     * @return
     */
    List<Av> selByLike(int uid);

    /**
     * 根据用户id查询该用户最近观看的4条视频
     * @param uid
     * @return
     */
    List<Av> selByHistory(int uid);
}
