package com.hulahula.service;

import com.hulahula.pojo.User;

/**
 * Project: finalCourse
 * Package: com.hulahula.service
 *
 * @author : ganying
 * @date : 2019-03-28 19:46
 */

public interface UserService {

    /**
     * 按照姓名查询用户
     * @param name
     * @return
     */
    User selectByName(String name);

    /**
     * 插入一个新用户
     * @param user
     * @return
     */
    int insNewUser(User user);

    /**
     * 依据昵称和密码查询用户
     * @return
     */
    User selByLogin(User user);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    int updByUser(User user);

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    User selById(int id);

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    int updPassword(int id,String password);
}
