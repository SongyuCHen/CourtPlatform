package nju.software.courtplatform.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import nju.software.courtplatform.model.Award;
import nju.software.courtplatform.model.History;

@Repository
public class AwardDao extends BaseDao{
	public Award getByBH(int bh){
		return (Award)sf.getCurrentSession().get(Award.class, bh);
	}
	
	@SuppressWarnings("unchecked")
	public List<Award> getAward(){
		List<Award> lHistories = new ArrayList<Award>();
		Session session = sf.getCurrentSession();
		Query qu = session.createQuery("from Award h order by h.time asc");
		List list = qu.list();
		Iterator itr = list.iterator(); 
		while(itr.hasNext()){
			lHistories.add((Award)itr.next());
		}		
		return lHistories;
	}
	
	public int saveAward(Award award){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select max(t.bh) from Award t"); 
		Integer bh = (Integer) query.uniqueResult();
		if(bh == null){
			bh = 0;
		}
		award.setBh(bh+1);
		int id = (Integer)session.save(award);
		return id;
	}
	
	public boolean reviseURL(String name,int bh){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update Award t set t.c_img = ? where bh = ?"); 
		query.setParameter(0, name);
		query.setParameter(1, bh);
		return query.executeUpdate()==1;
	}
	
	public boolean deleteAward(int bh){
		Session session = sf.getCurrentSession();
		Award tm = getByBH(bh);
		try {
			session.delete(tm);
			return true;
		} catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
	}
	public boolean reviseAward(int bh,String title,String time){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update Award t set t.title = ?,t.time = ? where bh = ?"); 
		query.setParameter(0, title);
		query.setParameter(1, time);
		query.setParameter(2, bh);
		return query.executeUpdate()==1;
	}
}
