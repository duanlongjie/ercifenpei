package com.exceptions;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局统一异常处理器
 */
public class UniformExceptionHandler implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request
            , HttpServletResponse response, Object handler, Exception ex) {
        ModelAndView mv = new ModelAndView("error");
        StringBuffer url = request.getRequestURL();
        String message = ex.getMessage();
        mv.addObject("url",url);
        mv.addObject("message",message);
        return mv;
    }
}
