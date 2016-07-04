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
	
	public TModule geTModuleByBh(int bh){
		return md.getByBH(bh);
	}
	
	public MenuContext getMenuContext(){
		MenuContext mc = new MenuContext();
		//TModule curModule = md.getAllTModule();
		mc.setCurrentModel(null);
		mc.setSubModels(md.getAllTModule());
		return mc;
	}
	public boolean reviseURL(String name,int bh){		
		return md.reviseURL(name,bh);
	}
	public boolean reviseInfo(int bh,String name,String url){		
		return md.reviseInfo(bh,name,url);
	}
	
	public int getMaxXssx(int parent){
		return md.getMaxXssx(parent);
	}
	
	public boolean saveTModule(TModule tm){
		return md.saveTModule(tm);
	}
	
	public boolean removeSub(int bh){
		return md.removeSub(bh);
	}
}
