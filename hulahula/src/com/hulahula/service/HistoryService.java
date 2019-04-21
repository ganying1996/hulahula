package com.hulahula.service;

import com.hulahula.pojo.History;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-04-08 20:04
 */
public interface HistoryService {

    /**
     * 插入一条历史记录
     * @param history
     * @return
     */
    int insByHistory(History history);
}
