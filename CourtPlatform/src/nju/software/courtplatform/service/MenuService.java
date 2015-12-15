package nju.software.courtplatform.service;

import nju.software.courtplatform.help.MenuContext;

import org.springframework.stereotype.Service;

@Service
public class MenuService extends BaseService{
	
	/**
	 * 根据路径得到菜单上下文
	 * @param path    e.g.  app/business
	 * @return
	 */
	public MenuContext getMenuContext(String path){
		return null;
	}
}
