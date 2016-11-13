package com.lenovo.lps.push.marketing.manager.services;

import com.lenovo.lps.push.marketing.manager.HitConfig;
import com.lenovo.lps.push.zkconfigurer.DataManager;
import com.lenovo.lps.push.zkconfigurer.ZKConfigurer;

public class HitConfigService {
	
	private final String zkAddress = "localhost:2181";
	private String zkPath = "/user/jason/config/hitConfig";
	/**
	 * @param args
	 */	
	public HitConfigService(String zkPath){
		if(null != zkPath){
			this.zkPath = zkPath;
		}		
	}
	
	public int add(HitConfig hitConfig){
		DataManager dm = new DataManager(zkAddress);
		dm.savaValue(this.zkPath, hitConfig);
		return 0;
	}
	
	public HitConfig getValue(){
		ZKConfigurer zkc = new ZKConfigurer(zkAddress);
		HitConfig hc = null;
		try {
			hc = zkc.getValue(this.zkPath, HitConfig.class);
		} catch (Exception e) {
			// If there is no configuration for HitConfig in Zookeeper, then return the default value.
			//hc = new HitConfig();
		} finally {
			if(hc == null){
				hc = new HitConfig();
			}
		}
		
		return hc;
	}
	
	public int update(HitConfig hitConfig){
		DataManager dm = new DataManager(zkAddress);
		dm.savaValue(this.zkPath, hitConfig);
		return 0;
	}
	public void deleteValue(){
		DataManager dm = new DataManager(zkAddress);
		dm.delete(this.zkPath);
	}
	
	public static void main(String[] args) {
		HitConfigService hcs = new HitConfigService(null);
		HitConfig hc = hcs.getValue();
		System.out.println(hc == null);
	}

}
