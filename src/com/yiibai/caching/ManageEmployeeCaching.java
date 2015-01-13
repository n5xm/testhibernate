package com.yiibai.caching;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.yiibai.Employee;

public class ManageEmployeeCaching {
	private static SessionFactory factory;

	public static void main(String[] args) {
		try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}
		ManageEmployeeCaching ME = new ManageEmployeeCaching();
		/* List down all the employees */
		ME.listEmployees();
	}

	/* Method to READ all the employees */
	public void listEmployees() {
		Session session = factory.openSession();
		try {
			Query query = session.createQuery("FROM Employee");
			query.setCacheable(true);
			query.setCacheRegion("employee");// Hibernate也支持通过一个缓存区域的概念非常细粒度的缓存支持。缓存区是这是给定一个名称缓存的一部分。
			List users = query.list();
			for (Iterator iterator = users.iterator(); iterator.hasNext();) {
				Employee employee = (Employee) iterator.next();
				System.out.print("First Name: " + employee.getFirstName());
				System.out.print("  Last Name: " + employee.getLastName());
				System.out.println("  Salary: " + employee.getSalary());
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}