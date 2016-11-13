package com.lenovo.lps.push.marketing.manager.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lenovo.lps.push.marketing.manager.HitConfig;
import com.lenovo.lps.push.marketing.manager.services.HitConfigPackage;
import com.lenovo.lps.push.marketing.manager.services.HitConfigService;

public class UpdateHitConfigServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Receive Parameters
		String minHitIntervalString = req.getParameter("minHitInterval");
		String[] pushHours = req.getParameterValues("pushHours");
		String userMaxAdsPerDay = req.getParameter("userMaxAdsPerDay");
		String testDevicesString = req.getParameter("testDevices");
		String[] testDevices = testDevicesString.split("\\s*,\\s*");
		String zkPath = req.getParameter("zkPath");
				
		// Convert String parameters to Object
		HitConfigPackage hcp = new HitConfigPackage();
		HitConfig hitConfig = hcp.pack(minHitIntervalString, pushHours, testDevices, userMaxAdsPerDay);
		System.out.println(hitConfig.getConfId());		
		//System.out.println(hitConfig.toStringForTest());		
		HitConfigService hcs = new HitConfigService(zkPath);
		int res = hcs.update(hitConfig);
		
		if(res == 0){
			req.getRequestDispatcher("success.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}
		
		
	}
	
}
