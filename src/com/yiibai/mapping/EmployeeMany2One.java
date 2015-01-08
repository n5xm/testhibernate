package com.yiibai.mapping;

public class EmployeeMany2One {
	private int id;
	private String firstName;
	private String lastName;
	private int salary;
	private AddressMany2One address;

	public EmployeeMany2One() {
	}

	public EmployeeMany2One(String fname, String lname, int salary,
			AddressMany2One address) {
		this.firstName = fname;
		this.lastName = lname;
		this.salary = salary;
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String first_name) {
		this.firstName = first_name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String last_name) {
		this.lastName = last_name;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public AddressMany2One getAddress() {
		return address;
	}

	public void setAddress(AddressMany2One address) {
		this.address = address;
	}
}