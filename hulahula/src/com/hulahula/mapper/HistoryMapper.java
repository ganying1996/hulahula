package com.hulahula.mapper;

import com.hulahula.pojo.History;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.mapper
 *
 * @author : ganying
 * @date : 2019-04-08 19:57
 */
public interface HistoryMapper {

    /**
     * 新增一条历史记录
     * @param history
     * @return
     */
    @Insert("INSERT into history VALUES(default,#{userid},#{avid},#{create_time})")
    int insByHistory(History history);

}
