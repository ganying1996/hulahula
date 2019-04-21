package com.hulahula.controller;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;

import java.io.IOException;

/**
 * Project: finalCourse
 * Package: com.hulahula.controller
 *
 * @author : ganying
 * @date : 2019-04-16 17:26
 */
public class Test {

    public void testAdd() throws IOException, SolrServerException {
        //solr服务器地址(需要带上用的那个集群)
        String url = "http://localhost:8080/solr/core1";
        //创建solr服务对象
        HttpSolrClient cilent = new HttpSolrClient.Builder(url).withConnectionTimeout(10000).withSocketTimeout(60000).build();

        //创建solr查询对象
        SolrQuery query = new SolrQuery();
        //设置查询条件
        query.set("q","user_username:张");
        //查询
        QueryResponse query1 = cilent.query(query);
        //查询到的结果
        SolrDocumentList res = query1.getResults();

        System.out.println("查询结果===============");
        for (SolrDocument doc : res){
            System.out.println("id----->"+doc.get("id"));
            System.out.println("name----->"+doc.get("name"));
            System.out.println("price----->"+doc.get("price"));
            System.out.println("title----->"+doc.get("title"));
        }


    }

    public static void main(String[] args) throws IOException, SolrServerException {
        new Test().testAdd();
    }
}
