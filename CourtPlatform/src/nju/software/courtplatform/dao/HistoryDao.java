package nju.software.courtplatform.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import nju.software.courtplatform.model.History;

@Repository
public class HistoryDao extends BaseDao{
	
	
	public History getByBH(int bh){
		return (History)sf.getCurrentSession().get(History.class, bh);
	}

	
	public int saveHistory(History history){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("select max(t.bh) from History t"); 
		Integer bh = (Integer) query.uniqueResult();
		if(bh == null){
			bh = 0;
		}
		history.setBh(bh+1);
		int id = (Integer)session.save(history);
		return id;
	}
	@SuppressWarnings("unchecked")
	public List<History> getHistory(){
		List<History> lHistories = new ArrayList<History>();
		Session session = sf.getCurrentSession();
		Query qu = session.createQuery("from History h order by h.time asc");
		List list = qu.list();
		Iterator itr = list.iterator(); 
		while(itr.hasNext()){
			lHistories.add((History)itr.next());
		}		
		return lHistories;
	}
	
	public boolean reviseURL(String name,int bh){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update History t set t.c_img = ? where bh = ?"); 
		query.setParameter(0, name);
		query.setParameter(1, bh);
		return query.executeUpdate()==1;
	}
	
	public boolean reviseHistory(int bh,String title,String time,String content){
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("update History t set t.title = ?,t.time = ?,t.content = ? where bh = ?"); 
		query.setParameter(0, title);
		query.setParameter(1, time);
		query.setParameter(2, content);
		query.setParameter(3, bh);
		return query.executeUpdate()==1;
	}
	
	public boolean deleteHistory(int bh){
		Session session = sf.getCurrentSession();
		History tm = getByBH(bh);
		try {
			session.delete(tm);
			return true;
		} catch (HibernateException e) {
			// TODO: handle exception
			return false;
		}
	}
}
