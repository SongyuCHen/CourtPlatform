package nju.software.courtplatform.dao;

import nju.software.courtplatform.model.TModule;

import org.springframework.stereotype.Repository;

@Repository
public class ModuleDao extends BaseDao{
	
	public TModule getByBH(int bh){
		return (TModule)sf.getCurrentSession().get(TModule.class, bh);
	}
}
