package com.bean;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SystemFilter
 */
//@WebFilter(
//		urlPatterns = {"/teacher/*","/student/*","/LoginCheck"}, 
//		initParams = { 
//				@WebInitParam(name = "redirectURL", value = "/login.jsp"),
//		})
public class RegistSystemFilter implements Filter {
	String redirectURL;
	
    /**
     * Default constructor. 
     */
    public RegistSystemFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		redirectURL = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("报名系统过滤器");
		HttpServletRequest res=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=res.getSession();
		ServletContext application = session.getServletContext();
		String url = res.getContextPath()+redirectURL;
		String rsStatus = (String) application.getAttribute("rsStatus");
		System.out.println("rsStatus " + application.getAttribute("rsStatus")+"\n");
		if(rsStatus.equals("0")){
			resp.sendRedirect(url+"?fail=1");
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
