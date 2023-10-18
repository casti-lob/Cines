package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.jacaranda.model.Cine;
import com.jacaranda.util.BdUtil;

import jakarta.transaction.SystemException;

public class CineRepository {
	
	public static Cine annadirCine(Cine c) throws IllegalStateException, SystemException {
		Transaction transaction = null;
		Cine result= null;
		Session session = BdUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		try {
			result =session.merge(c);//inserta y modifica
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
		
		
		session.close();
		return result;
	}
	
	public static Cine deleteCine(Cine c) {
		Transaction transaction = null;
		Cine result= null;
		Session session = BdUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		try {
			session.remove(c);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return result;
	}
	
	public static Cine updateCine(Cine c) {
		Transaction transaction = null;
		Cine result = null;
		Session session = BdUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		try {
			session.update(c);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return result;
	}
	
	public static List<Cine> getCinemas(){
		Session session = BdUtil.getSessionFactory().openSession();
		
		List<Cine> r = (List<Cine>) session.createSelectionQuery("From Cine").getResultList();//Se refiere al objeto no a la bbdd porque es HQL
		
		return r;
	}
	
	public static Cine getCine(String cine) {
		Cine result = null;
		Session session = BdUtil.getSessionFactory().openSession();
		SelectionQuery<Cine> q =
				session.createSelectionQuery("From Cine where cine = :cine", Cine.class);
				q.setParameter("cine", cine);//cine se refiere al parametro de entrada de la funcion
				List<Cine> cines = q.getResultList();
				if(cines.size()!=0) result= cines.get(0);
		return result;
	}
}
