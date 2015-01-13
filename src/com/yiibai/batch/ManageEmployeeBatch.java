package com.yiibai.batch;

import org.hibernate.HibernateException;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ManageEmployeeBatch {
	private static SessionFactory factory;

	public static void main(String[] args) {
		try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}
		ManageEmployeeBatch ME = new ManageEmployeeBatch();
		/* Add employee records in batches */
		// ME.addEmployees();
		ME.updateEmployees();
	}

	/* Method to create employee records in batches */
	public void addEmployees() {
		Session session = factory.openSession();
		Transaction tx = null;
		Integer employeeID = null;
		try {
			tx = session.beginTransaction();
			for (int i = 0; i < 1000; i++) {// 100000
				String fname = "First Name " + i;
				String lname = "Last Name " + i;
				Integer salary = i;
				EmployeeBatch employee = new EmployeeBatch(fname, lname, salary);
				session.save(employee);
				if (i % 50 == 0) {
					session.flush();
					session.clear();
				}
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return;
	}

	public void updateEmployees() {
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			ScrollableResults employeeCursor = session.createQuery(
					"FROM EmployeeBatch").scroll();
			int count = 0;
			while (employeeCursor.next()) {
				EmployeeBatch employee = (EmployeeBatch) employeeCursor.get(0);
				// employee.updateEmployee();
				employee.setSalary(employee.getSalary() + 10000);
				session.update(employee);
				if (++count % 50 == 0) {
					session.flush();
					session.clear();
				}
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return;
	}
}