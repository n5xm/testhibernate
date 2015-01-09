package com.yiibai.mapping;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ManageEmployeeComponent {
	private static SessionFactory factory;

	public static void main(String[] args) {
		try {
			factory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable ex) {
			System.err.println("Failed to create sessionFactory object." + ex);
			throw new ExceptionInInitializerError(ex);
		}
		ManageEmployeeComponent ME = new ManageEmployeeComponent();
		/* Let us have one address object */
		AddressComponent address1 = ME.addAddress("Kondapur", "Hyderabad",
				"AP", "532");
		/* Add employee records in the database */
		Integer empID1 = ME.addEmployee("Manoj", "Kumar", 4000, address1);
		/* Let us have another address object */
		AddressComponent address2 = ME.addAddress("Saharanpur", "Ambehta",
				"UP", "111");
		/* Add another employee record in the database */
		Integer empID2 = ME.addEmployee("Dilip", "Kumar", 3000, address2);
		/* List down all the employees */
		ME.listEmployees();
		/* Update employee's salary records */
		ME.updateEmployee(empID1, 5000);
		/* List down all the employees */
		ME.listEmployees();
	}

	/* Method to add an address record in the database */
	public AddressComponent addAddress(String street, String city,
			String state, String zipcode) {
		Session session = factory.openSession();
		Transaction tx = null;
		Integer addressID = null;
		AddressComponent address = null;
		try {
			tx = session.beginTransaction();
			address = new AddressComponent(street, city, state, zipcode);
			addressID = (Integer) session.save(address);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return address;
	}

	/* Method to add an employee record in the database */
	public Integer addEmployee(String fname, String lname, int salary,
			AddressComponent address) {
		Session session = factory.openSession();
		Transaction tx = null;
		Integer employeeID = null;
		try {
			tx = session.beginTransaction();
			EmployeeComponent employee = new EmployeeComponent(fname, lname,
					salary, address);
			employeeID = (Integer) session.save(employee);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return employeeID;
	}

	/* Method to list all the employees detail */
	public void listEmployees() {
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			List employees = session.createQuery("FROM EmployeeComponent")
					.list();
			for (Iterator iterator = employees.iterator(); iterator.hasNext();) {
				EmployeeComponent employee = (EmployeeComponent) iterator
						.next();
				System.out.print("First Name: " + employee.getFirstName());
				System.out.print("  Last Name: " + employee.getLastName());
				System.out.println("  Salary: " + employee.getSalary());
				AddressComponent add = employee.getAddress();
				System.out.println("AddressComponent ");
				System.out.println("\tStreet: " + add.getStreet());
				System.out.println("\tCity: " + add.getCity());
				System.out.println("\tState: " + add.getState());
				System.out.println("\tZipcode: " + add.getZipcode());
			}
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	/* Method to update salary for an employee */
	public void updateEmployee(Integer EmployeeID, int salary) {
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			EmployeeComponent employee = (EmployeeComponent) session.get(
					EmployeeComponent.class, EmployeeID);
			employee.setSalary(salary);
			session.update(employee);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}