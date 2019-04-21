package com.hulahula.service.impl;

import com.hulahula.mapper.HistoryMapper;
import com.hulahula.pojo.History;
import com.hulahula.service.HistoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.swing.plaf.basic.BasicScrollPaneUI;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-04-08 20:06
 */
@Service
public class HistoryServiceImpl implements HistoryService {

    @Resource
    private HistoryMapper historyMapper;

    /**
     * 插入一条观看历史记录
     * @param history
     * @return
     */
    @Override
    public int insByHistory(History history) {
        return historyMapper.insByHistory(history);
    }
}
