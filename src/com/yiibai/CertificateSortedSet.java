package com.yiibai;

public class CertificateSortedSet implements Comparable<CertificateSortedSet> {
	private int id;
	private String name;

	public CertificateSortedSet() {
	}

	public CertificateSortedSet(String name) {
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

	public int compareTo(CertificateSortedSet that) {
		final int BEFORE = -1;
		final int AFTER = 1;
		if (that == null) {
			return BEFORE;
		}
		Comparable thisCertificate = this.getName();
		Comparable thatCertificate = that.getName();
		if (thisCertificate == null) {
			return AFTER;
		} else if (thatCertificate == null) {
			return BEFORE;
		} else {
			return thisCertificate.compareTo(thatCertificate);
		}
	}
}