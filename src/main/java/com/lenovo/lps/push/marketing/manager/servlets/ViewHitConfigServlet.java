package com.lenovo.lps.push.marketing.manager.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lenovo.lps.push.marketing.manager.HitConfig;
import com.lenovo.lps.push.marketing.manager.services.HitConfigService;

public class ViewHitConfigServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String zkPath = req.getParameter("zkPath");
		String action = req.getParameter("action");
		HitConfigService hcs = new HitConfigService(zkPath);
		HitConfig hc = hcs.getValue();		
		//System.out.println(hc.toStringForTest());
		req.setAttribute("hitConfig", hc);
		req.setAttribute("zkPath", zkPath);
		
		if ( action.equals("v")) {
			req.getRequestDispatcher("show.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("update.jsp").forward(req, resp);
		}		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {		
		doPost(req, resp);
	}
}
