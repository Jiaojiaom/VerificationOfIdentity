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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class RegistFilter
 */
@WebFilter("/RegistFilter")
public class RegistFilter implements Filter {
	String redirectURL;
    /**
     * Default constructor. 
     */
    public RegistFilter() {
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
		System.out.println("报名过滤器");
		HttpServletRequest res=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=res.getSession();
		ServletContext application = session.getServletContext();
		String url = res.getContextPath()+redirectURL;
		String rStatus = (String) application.getAttribute("rStatus");
		System.out.println("rStatus " + application.getAttribute("rStatus")+"\n");
		if(rStatus.equals("0")){
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
