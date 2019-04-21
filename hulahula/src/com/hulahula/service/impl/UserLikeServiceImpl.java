package com.hulahula.service.impl;

import com.hulahula.mapper.UserLikeMapper;
import com.hulahula.pojo.UserLike;
import com.hulahula.service.UserLikeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Project: finalCourse
 * Package: com.hulahula.service.impl
 *
 * @author : ganying
 * @date : 2019-04-08 17:00
 */
@Service
public class UserLikeServiceImpl implements UserLikeService {

    @Resource
    private UserLikeMapper userLikeMapper;

    /**
     * 插入一条点赞数据
     * @param like
     * @return
     */
    @Override
    public int insByUserlike(UserLike like) {
        return userLikeMapper.insByUserLike(like);
    }
}
