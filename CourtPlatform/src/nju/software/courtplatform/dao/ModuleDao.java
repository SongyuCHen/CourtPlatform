package nju.software.courtplatform.dao;

import nju.software.courtplatform.model.TModule;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class ModuleDao extends BaseDao{
	
	public TModule getByBH(int bh){
		return (TModule)sf.getCurrentSession().get(TModule.class, bh);
	}
	
	@SuppressWarnings("unchecked")
	public List<TModule> getTModuleListByName(String name){
		return sf.getCurrentSession().createCriteria(TModule.class).add(Restrictions.eq("name", name)).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<TModule> getSubModules(TModule m){
		return sf.getCurrentSession().createCriteria(TModule.class).add(Restrictions.eq("parent", m.getBh())).addOrder(Order.asc("xssx")).list();
	}
}
