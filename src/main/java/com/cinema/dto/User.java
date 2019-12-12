package com.cinema.dto;

import com.cinema.dto.Person;

public class User extends Person{
	private String userName;
	private String userPassword;
	private String nomComplet;



	public User(Person person, String userName, String userPassword, String nomComplet) {
		super(person.getDni(), person.getNom(), person.getLlinatges(), person.getEmail());
		this.userName = userName;
		this.userPassword = userPassword;
		this.nomComplet = nomComplet;
	}

	/**
	 * @return the id
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param id the id to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the nom
	 */
	public String getnomComplet() {
		return nomComplet;
	}
	/**
	 * @param nom the nom to set
	 */
	public void setnomComplet(String nomComplet) {
		this.nomComplet = nomComplet;
	}
	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		return result;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof User)) {
			return false;
		}
		User other = (User) obj;
		if (userName == null) {
			if (other.userName != null) {
				return false;
			}
		} else if (!userName.equals(other.userName)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "User{" +
				"userName='" + userName + '\'' +
				", userPassword='" + userPassword + '\'' +
				", nomComplet='" + nomComplet + '\'' +
				", dni='" + this.getDni() + '\'' +
				", nom='" + this.getNom() + '\'' +
				", llinatges='" + this.getLlinatges() + '\'' +
				", email='" + this.getEmail() +
				'}';
	}
}
