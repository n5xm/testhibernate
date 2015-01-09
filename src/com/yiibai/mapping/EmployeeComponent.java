package com.yiibai.mapping;

public class EmployeeComponent implements java.io.Serializable {
	private int id;
	private String firstName;
	private String lastName;
	private int salary;
	private AddressComponent address;

	public EmployeeComponent() {
	}

	public EmployeeComponent(String fname, String lname, int salary, AddressComponent address) {
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

	public AddressComponent getAddress() {
		return address;
	}

	public void setAddress(AddressComponent address) {
		this.address = address;
	}
}
