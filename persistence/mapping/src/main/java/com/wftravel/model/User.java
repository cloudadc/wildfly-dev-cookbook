package com.wftravel.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name = "user")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer userid;

	@Column(nullable = false, length = 35)
	private String address1;

	@Column(length = 35)
	private String address2;

	private Integer age;

	@Column(name = "alan_resorts_id", length = 10)
	private String alanResortsId;

	@Column(nullable = false, length = 25)
	private String city;

	@Column(nullable = false, length = 3)
	private String country;

	@Column(name = "d_hotels_id", length = 10)
	private String dHotelsId;

	@Column(nullable = false, length = 50)
	private String emailaddress;

	@Column(nullable = false, length = 35)
	private String firstname;

	private Integer frequentflyernumber;

	@Column(nullable = false, length = 35)
	private String lastname;

	@Column(length = 10)
	private String loyaltylevel;

	@Column(length = 35)
	private String middlename;

	@Column(nullable = false, length = 250)
	private String password;

	private Integer phonenumber;

	@Column(name = "state_prov", nullable = false, length = 2)
	private String stateProv;

	@Column(nullable = false, length = 35)
	private String username;

	@Column(name = "zip_post", nullable = false, length = 10)
	private String zipPost;

	// bi-directional many-to-one association to Reservation
	@OneToMany(mappedBy = "user")
	private Set<Reservation> reservations;

	public User() {
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getAlanResortsId() {
		return this.alanResortsId;
	}

	public void setAlanResortsId(String alanResortsId) {
		this.alanResortsId = alanResortsId;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getDHotelsId() {
		return this.dHotelsId;
	}

	public void setDHotelsId(String dHotelsId) {
		this.dHotelsId = dHotelsId;
	}

	public String getEmailaddress() {
		return this.emailaddress;
	}

	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public Integer getFrequentflyernumber() {
		return this.frequentflyernumber;
	}

	public void setFrequentflyernumber(Integer frequentflyernumber) {
		this.frequentflyernumber = frequentflyernumber;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getLoyaltylevel() {
		return this.loyaltylevel;
	}

	public void setLoyaltylevel(String loyaltylevel) {
		this.loyaltylevel = loyaltylevel;
	}

	public String getMiddlename() {
		return this.middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getPhonenumber() {
		return this.phonenumber;
	}

	public void setPhonenumber(Integer phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getStateProv() {
		return this.stateProv;
	}

	public void setStateProv(String stateProv) {
		this.stateProv = stateProv;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getZipPost() {
		return this.zipPost;
	}

	public void setZipPost(String zipPost) {
		this.zipPost = zipPost;
	}

	public Set<Reservation> getReservations() {
		return this.reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

	@Override
	public String toString() {
		return "My name is " + this.firstname + " " + this.lastname;
	}

}