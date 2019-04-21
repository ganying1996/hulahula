package com.hulahula.controller;

import com.hulahula.pojo.Av;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.util.NamedList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-04-17 13:29
 */
@Controller
public class SearchController {

    //solr服务器地址
    String url = "http://localhost:8081/solr/core1";

    /**
     * 搜索视频
     * @param keyword
     * @return
     */
    @RequestMapping(value = "views/search")
    public String dosearch(String keyword, HttpServletRequest request) throws IOException, SolrServerException {
        //未输入关键字
        if (keyword.equals("")){
            return "forward:/views/search.jsp";
        }
        String word = keyword;

        System.out.println("word = " + word);
        //用于存放查询到的视频对象
        List<Av> avList = new ArrayList<Av>();

        //创建solr服务器对象
        HttpSolrClient client = new HttpSolrClient.Builder(url).build();
        //创建查询对象
        SolrQuery query = new SolrQuery();
        //设置查询条件
        query.set("q","av_title:"+keyword);

        //查询
        QueryResponse result = client.query(query);
        //获取查询结果
        SolrDocumentList list = result.getResults();


        if (!list.isEmpty()){

            for (SolrDocument doc : list){

                //新建一个av对象用来存储查询到的数据
                Av av = new Av();
                av.setId((Integer) doc.get("av_id"));
                av.setType((Integer) doc.get("av_type"));
                av.setPlay_num((Integer) doc.get("av_play_num"));
                av.setAvCover((String) doc.get("av_avCover"));
                av.setCreate_id((Integer) doc.get("av_create_id"));
                av.setCreate_time((Date) doc.get("av_create_time"));
                av.setTitle((String) doc.get("av_title"));


                //把av对象存入list
                avList.add(av);
            }

            //把数据存入requestScope
            request.setAttribute("searchList",avList);
            request.setAttribute("numFound",list.getNumFound());
            request.setAttribute("searchword",word);
            return "forward:/views/search.jsp";
        } else {

            return "forward:/views/search.jsp";
        }
    }


}
