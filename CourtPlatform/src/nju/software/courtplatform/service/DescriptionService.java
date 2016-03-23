package nju.software.courtplatform.service;

import nju.software.courtplatform.dao.DescriptionDao;
import nju.software.courtplatform.dao.ModuleDao;
import nju.software.courtplatform.help.MenuContext;
import nju.software.courtplatform.model.TModule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DescriptionService extends BaseService{
	
	@Autowired
	private DescriptionDao md;
	
	/**
	 * 根据路径得到菜单上下文
	 * @param url    e.g.  app/business
	 * @return
	 */
	public String getDescription(){	
		return md.getDescription();
	}
	
//	public MenuContext getMenuContext(){
//		MenuContext mc = new MenuContext();
//		//TModule curModule = md.getAllTModule();
//		mc.setCurrentModel(null);
//		mc.setSubModels(md.getAllTModule());
//		return mc;
//	}
//	public boolean reviseURL(String name,int bh){		
//		return md.reviseURL(name,bh);
//	}
//	public boolean reviseInfo(int bh,String name,String url){		
//		return md.reviseInfo(bh,name,url);
//	}
//	
//	public int getMaxXssx(int parent){
//		return md.getMaxXssx(parent);
//	}
//	
	public boolean saveDesc(String js){
		return md.saveDesc(js);
	}
//	
//	public boolean removeSub(int bh){
//		return md.removeSub(bh);
//	}
}
