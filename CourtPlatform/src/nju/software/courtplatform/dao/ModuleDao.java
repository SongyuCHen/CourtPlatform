package nju.software.courtplatform.dao;

import nju.software.courtplatform.model.TModule;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
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
	
	public TModule getTModuleByUrl(String c_url){
		return (TModule)sf.getCurrentSession().createCriteria(TModule.class).add(Restrictions.eq("c_url", c_url)).uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<TModule> getAllTModule(){
		return sf.getCurrentSession().createCriteria(TModule.class).addOrder(Order.asc("xssx")).list();
	}
	
	public boolean reviseURL(String name,int bh){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update TModule t set t.c_img = ? where bh = ?"); 
		query.setParameter(0, name);
		query.setParameter(1, bh);
		return query.executeUpdate()==1;
	}
	
	public boolean reviseInfo(int bh,String name,String url){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update TModule t set t.name = ? , t.c_url = ? where bh = ?"); 
		query.setParameter(0, name);
		query.setParameter(1, url);
		query.setParameter(2, bh);
		return query.executeUpdate()==1;
	}
	
	public int getMaxXssx(int parent){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select max(t.xssx) from TModule t where t.parent = ?"); 
		query.setInteger(0, parent);
		Integer xssx = (Integer) query.uniqueResult();
		if(xssx == null){
			xssx = 0;
		}
		return xssx;
	}
	
	public boolean saveTModule(TModule tm){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select max(t.bh) from TModule t"); 
		Integer bh = (Integer) query.uniqueResult();
		if(bh == null){
			bh = 0;
		}
		tm.setBh(bh+1);
		int id = (Integer)session.save(tm);
		System.err.println("id:"+id);
		return id>0;
	}
	
	public boolean removeSub(int bh){
		Session session = sf.getCurrentSession();
		TModule tm = getByBH(bh);
		try {
			session.delete(tm);
			return true;
		} catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
	}
}
