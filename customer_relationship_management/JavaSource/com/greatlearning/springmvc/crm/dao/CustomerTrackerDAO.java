package com.greatlearning.springmvc.crm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.greatlearning.springmvc.crm.model.Customer;

@Repository
public class CustomerTrackerDAO {

	private SessionFactory sessionFactory;
	private Session session;

	CustomerTrackerDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException ex) {
			session = sessionFactory.openSession();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Customer> getAllRegistrations() {
		return session.createQuery("from Customer").list();
	}

	@Transactional
	public void saveRegistration(Customer student) {
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(student);
		transaction.commit();
	}

	public Customer getStudentById(int id) {
		return session.get(Customer.class, id);
	}

	@Transactional
	public void deleteStudent(int id) {
		Transaction transaction = session.beginTransaction();
		Customer student = session.get(Customer.class, id);
		session.delete(student);
		transaction.commit();
	}

}
