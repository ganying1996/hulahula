package com.hulahula.service.impl;

import com.hulahula.mapper.AvMapper;
import com.hulahula.pojo.Av;
import com.hulahula.service.AvService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.service.impl
 *
 * @author : ganying
 * @date : 2019-03-31 12:42
 */
@Service
public class AvServiceImpl implements AvService {

    @Resource
    private AvMapper avMapper;

    /**
     * 新增一条视频记录
     * @param av
     * @return
     */
    @Override
    public int insByAv(Av av) {
        return avMapper.insByAv(av);
    }

    /**
     * 查询8条最新记录，按照类型查询
     * @param tpye
     * @return
     */
    @Override
    public List<Av> selByType(int tpye) {
        return avMapper.selEightByType(tpye);
    }

    /**
     * 根据视频id修改点赞次数
     * @param id
     * @param likenum
     * @return
     */
    @Override
    public int updLikenumById(int id, int likenum) {
        return avMapper.updlikeById(id,likenum);
    }

    /**
     * 根据视频id修改视频收藏数
     * @param id
     * @param colnum
     * @return
     */
    @Override
    public int updColnumById(int id, int colnum) {
        return avMapper.updCollectnumById(id,colnum);
    }

    /**
     * 根据id修改视频播放次数
     * @param id
     * @param playnum
     * @return
     */
    @Override
    public int updPlaynumById(int id, int playnum) {
        return avMapper.updPlay_numById(id,playnum);
    }

    /**
     * 根据用户id查询用户最近收藏的4条视频
     * @param uid
     * @return
     */
    @Override
    public List<Av> selByLike(int uid) {
        return avMapper.selByLike(uid);
    }

    /**
     * 根据用户id查询该用户最近观看的4条视频
     * @param uid
     * @return
     */
    @Override
    public List<Av> selByHistory(int uid) {
        return avMapper.selByHistory(uid);
    }
}
