package com.hulahula.service;

import com.hulahula.pojo.Collect;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-04-08 20:50
 */
public interface CollectService {

    /**
     * 插入一条收藏记录
     * @param collect
     * @return
     */
    int insByCollect(Collect collect);
}
