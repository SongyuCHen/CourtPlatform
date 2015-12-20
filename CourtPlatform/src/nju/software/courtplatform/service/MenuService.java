package nju.software.courtplatform.service;

import nju.software.courtplatform.dao.ModuleDao;
import nju.software.courtplatform.help.MenuContext;
import nju.software.courtplatform.model.TModule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService extends BaseService{
	
	@Autowired
	private ModuleDao md;
	
	/**
	 * 根据路径得到菜单上下文
	 * @param url    e.g.  app/business
	 * @return
	 */
	public MenuContext getMenuContext(String url){
		MenuContext mc = new MenuContext();
		TModule curModule = md.getTModuleByUrl(url);
		mc.setCurrentModel(curModule);
		mc.setSubModels(md.getSubModules(curModule));
		return mc;
	}
}
