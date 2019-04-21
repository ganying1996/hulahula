package com.hulahula.service;

import com.hulahula.pojo.UserLike;

import java.security.PrivateKey;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-04-08 16:58
 */
public interface UserLikeService {

    /**
     * 插入一条点赞数据
     * @param like
     * @return
     */
    int insByUserlike(UserLike like);
}
