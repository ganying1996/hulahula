package com.hulahula.mapper;

import com.hulahula.pojo.Collect;
import org.apache.ibatis.annotations.Insert;

/**
 * Project: finalCourse
 * Package: com.hulahula.mapper
 *
 * @author : ganying
 * @date : 2019-04-08 20:46
 */
public interface CollectMapper {

    /**
     * 插入一条收藏数据
     * @param collect
     * @return
     */
    @Insert("INSERT into collect VALUES(default,#{userid},#{avid},#{create_time})")
    int insByCollect(Collect collect);
}
