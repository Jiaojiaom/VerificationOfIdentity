package com.bean;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
//@WebFilter(
//		urlPatterns = {"/teacher/*","/student/*","/admin/*"}, 
//		initParams = { 
//				@WebInitParam(name = "redirectURL", value = "/login.jsp"),
//		})
public class LoginFilter implements Filter {
	String redirectURL;

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("登录过滤器");
		HttpServletRequest res=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=res.getSession();
		String url=res.getContextPath()+redirectURL;
		System.out.println("url:"+url);
		Object logined=session.getAttribute("isLogined");
		if(null==logined||!"yes".equals((String)logined)){
			resp.sendRedirect(url);
			return;
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		String url = fConfig.getInitParameter("redirectURL");
		if(null!=url&&!"".equals(url.trim())){
			redirectURL=url;
		}else{
			redirectURL="/login.jsp";
		}
	}

}
