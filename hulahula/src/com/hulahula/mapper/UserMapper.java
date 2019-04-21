package com.hulahula.mapper;

import com.hulahula.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * Project: finalCourse
 * Package: com.hulahula.mapper
 *
 * @author : ganying
 * @date : 2019-03-28 19:45
 */

public interface UserMapper {

    /**
     * 按照姓名查询用户
     * @param name
     * @return
     */
    @Select("select * from user where username=#{name}")
    User selByName(String name);

    /**
     * 插入一个新用户
     * @param user
     * @return
     */
    @Insert("INSERT into user (id,username,password,icon,create_time) VALUES(default,#{username},#{password},default,#{create_time})")
    int insUser(User user);

    /**
     * 依据用户名和密码查询用户
     * @return
     */
    @Select("select * from user where username=#{username} and password=#{password}")
    User selByLogin(User user);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Update("UPDATE USER SET username=#{username},icon=#{icon},sex=#{sex},introduce=#{introduce} WHERE id=#{id}")
    int updByUser(User user);

    /**
     * 按照用户ID查询用户
     * @param id
     * @return
     */
    @Select("select * from user where id=#{id}")
    User selById(int id);

    /**
     * 修改用户密码
     * @param id
     * @param password
     * @return
     */
    @Update("UPDATE user set password=#{arg1} where id=#{arg0}")
    int updPassword(int id,String password);

}
