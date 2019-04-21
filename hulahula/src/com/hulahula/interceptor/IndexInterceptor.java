package com.hulahula.interceptor;

import com.hulahula.pojo.Av;
import com.hulahula.service.AvService;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Project: finalCourse
 * Package: com.hulahula.interceptor
 *
 * @author : ganying
 * @date : 2019-04-08 10:41
 */
public class IndexInterceptor extends HandlerInterceptorAdapter {

    @Resource
    private AvService avService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("IndexInterceptor.preHandle");
        //加载首页需要的数据
        //查询每个类型的视频
        List<Av> avList0 = avService.selByType(0);
        List<Av> avList1 = avService.selByType(1);
        List<Av> avList2 = avService.selByType(2);
        List<Av> avList3 = avService.selByType(3);


        request.setAttribute("avlist0",avList0);
        request.setAttribute("avlist1",avList1);
        request.setAttribute("avlist2",avList2);
        request.setAttribute("avlist3",avList3);

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("IndexInterceptor.postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("IndexInterceptor.afterCompletion");
    }
}
