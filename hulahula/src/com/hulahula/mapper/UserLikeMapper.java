package com.hulahula.mapper;

import com.hulahula.pojo.UserLike;
import org.apache.ibatis.annotations.Insert;

/**
 * Project: finalCourse
 * Package: com.hulahula.mapper
 *
 * @author : ganying
 * @date : 2019-04-08 16:53
 */
public interface UserLikeMapper {

    /**
     * 插入一条数据
     * @param like
     * @return
     */
    @Insert("INSERT into user_like VALUES (default,#{userid},#{avid},#{create_time})")
    int insByUserLike(UserLike like);


}
