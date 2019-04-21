package com.hulahula.service.impl;

import com.hulahula.mapper.CollectMapper;
import com.hulahula.pojo.Collect;
import com.hulahula.service.CollectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Project: finalCourse
 * Package: com.hulahula.service.impl
 *
 * @author : ganying
 * @date : 2019-04-08 20:51
 */
@Service
public class CollectServiceImpl implements CollectService {

    @Resource
    private CollectMapper collectMapper;

    /**
     * 生成一条收藏记录
     * @param collect
     * @return
     */
    @Override
    public int insByCollect(Collect collect) {
        return collectMapper.insByCollect(collect);
    }
}
