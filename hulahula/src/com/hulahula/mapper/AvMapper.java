package com.hulahula.mapper;

import com.hulahula.pojo.Av;
import com.hulahula.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.mapper
 *
 * @author : ganying
 * @date : 2019-03-31 12:27
 */
public interface AvMapper {

    /**
     * 根据视频对象插入一条视频记录
     *
     * @param av
     * @return
     */
    @Insert("INSERT into av VALUES(default,#{create_time},#{create_id},#{avCover},#{avUri},#{title},#{avDesc},#{type},#{collect_num},#{like_num},#{play_num})")
    int insByAv(Av av);

    /**
     * 按照视频类型查询每个类型最新的8条数据
     * @param type
     * @return
     */
    @Select("select * from av where type=#{type} ORDER BY create_time DESC limit 8")
    List<Av> selEightByType(int type);

    /**
     * 根据视频id修改视频播放次数
     * @param id
     * @param playnum
     * @return
     */
    @Update("UPDATE av set play_num=#{arg1} where id=#{arg0}")
    int updPlay_numById(int id,int playnum);

    /**
     * 根据视频id修改点赞次数
     * @param id
     * @param likenum
     * @return
     */
    @Update("UPDATE av set like_num=#{arg1} where id=#{arg0}")
    int updlikeById(int id , int likenum);


    /**
     * 根据视频id修改收藏数
     * @param id
     * @param colnum
     * @return
     */
    @Update("UPDATE av set collect_num=#{arg1} where id=#{arg0}")
    int updCollectnumById(int id, int colnum);

    /**
     * 根据用户id查询用户最近收藏的4条视频信息
     * @param uid
     * @return
     */
    @Select("select av.id,av.create_time,av.create_id,av.avCover,av.avUri,av.title,av.avDesc,av.type,av.collect_num,av.like_num,av.play_num from av LEFT JOIN user_like on av.id=user_like.avid where user_like.userid=#{uid} ORDER BY user_like.create_time desc LIMIT 4")
    List<Av> selByLike(int uid);


    /**
     * 根据用户id查询该用户最近观看的4条视频信息
     * @param uid
     * @return
     */
    @Select("select av.id,av.create_time,av.create_id,av.avCover,av.avUri,av.title,av.avDesc,av.type,av.collect_num,av.like_num,av.play_num from av LEFT JOIN history on av.id=history.avid where history.userid=#{uid} ORDER BY history.create_time desc LIMIT 4")
    List<Av> selByHistory(int uid);

    /**
     * 按照用户id查询该用户的所有浏览记录
     * @param uid
     * @return
     */
    @Select("select av.id,av.create_time,av.create_id,av.avCover,av.avUri,av.title,av.avDesc,av.type,av.collect_num,av.like_num,av.play_num from av LEFT JOIN history on av.id=history.avid where history.userid=#{uid} ORDER BY history.create_time desc")
    List<Av> selAllByHistosy(int uid);

}
