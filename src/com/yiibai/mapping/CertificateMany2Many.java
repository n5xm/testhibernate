package com.yiibai.mapping;

public class CertificateMany2Many {
	private int id;
	private String name;

	public CertificateMany2Many() {
	}

	public CertificateMany2Many(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		if (!this.getClass().equals(obj.getClass()))
			return false;
		CertificateMany2Many obj2 = (CertificateMany2Many) obj;
		if ((this.id == obj2.getId()) && (this.name.equals(obj2.getName()))) {
			return true;
		}
		return false;
	}

	public int hashCode() {
		int tmp = 0;
		tmp = (id + name).hashCode();
		return tmp;
	}
}