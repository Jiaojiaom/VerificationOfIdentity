package com.bean;

import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import db.SystemMsgDAO;

/**
 * Application Lifecycle Listener implementation class ContextListener
 *
 */
@WebListener
public class ContextListener implements ServletContextListener, ServletContextAttributeListener {

    /**
     * Default constructor. 
     */
    public ContextListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextAttributeListener#attributeAdded(ServletContextAttributeEvent)
     */
    public void attributeAdded(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
     */
    public void attributeRemoved(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextAttributeListener#attributeReplaced(ServletContextAttributeEvent)
     */
    public void attributeReplaced(ServletContextAttributeEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	 System.out.println("系统开始启动");
    	 ServletContext application = arg0.getServletContext();
    	 if(application.getAttribute("rsStatus")==null&&application.getAttribute("isStatus")==null&&application.getAttribute("rStatus")==null){
			SystemMsgDAO smdao = new SystemMsgDAO();
			application.setAttribute("rsStatus", smdao.getRegistrationSystemStatus());
			System.out.println("rsStatus" + application.getAttribute("rsStatus"));
			application.setAttribute("isStatus", smdao.getIdentificationSystemStatus());
			application.setAttribute("rStatus", smdao.getRegistStatus());
 		}
    }
	
}
