package com.hulahula.service.impl;

import com.hulahula.mapper.UserMapper;
import com.hulahula.pojo.User;
import com.hulahula.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Project: finalCourse
 * Package: com.hulahula.service.impl
 *
 * @author : ganying
 * @date : 2019-03-28 19:48
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    /**
     * 按照姓名查询用户
     * @param name
     * @return
     */
    @Override
    public User selectByName(String name) {
        return userMapper.selByName(name);
    }

    /**
     * 添加一个新一个用户
     * @param user
     * @return
     */
    @Override
    public int insNewUser(User user) {
        return userMapper.insUser(user);
    }

    /**
     * 登录验证
     * @param user
     * @return
     */
    @Override
    public User selByLogin(User user) {
        return userMapper.selByLogin(user);
    }

    /**
     * 修改用户信息
     * @return
     */
    @Override
    public int updByUser(User user) {
        return userMapper.updByUser(user);
    }

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    @Override
    public User selById(int id) {
        return userMapper.selById(id);
    }

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    @Override
    public int updPassword(int id, String password) {
        return userMapper.updPassword(id,password);
    }
}
