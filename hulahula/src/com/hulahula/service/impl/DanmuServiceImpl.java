package com.hulahula.service.impl;

import com.hulahula.mapper.DanmuMapper;
import com.hulahula.pojo.Danmu;
import com.hulahula.service.DanmuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.service.impl
 *
 * @author : ganying
 * @date : 2019-04-10 14:45
 */
@Service
public class DanmuServiceImpl implements DanmuService {

    @Resource
    private DanmuMapper danmuMapper;

    /**
     * 插入一条弹幕记录
     * @param danmu
     * @return
     */
    @Override
    public int insByDanmu(Danmu danmu) {
        return danmuMapper.insByDanmu(danmu);
    }

    /**
     * 按照视频id查询出所有弹幕
     * @param avid
     * @return
     */
    @Override
    public List<Danmu> selAllByAvid(int avid) {
        return danmuMapper.selAllByAvid(avid);
    }
}
