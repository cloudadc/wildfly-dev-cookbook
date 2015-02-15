package com.wftravel.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * The persistent class for the airport database table.
 * 
 */
@Entity
@Table(name = "airport")
public class Airport implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer airportid;

	@Column(nullable = false, length = 3)
	private String airportcode;

	@Column(nullable = false, length = 50)
	private String airportname;

	@Column(nullable = false, length = 50)
	private String city;

	@Column(nullable = false, length = 3)
	private String country;

	@Column(precision = 18, scale = 15)
	private BigDecimal latitude;

	@Column(precision = 18, scale = 15)
	private BigDecimal longitude;

	@Column(name = "state_prov", length = 25)
	private String stateProv;

	// bi-directional many-to-one association to Route
	@OneToMany(mappedBy = "airport1", fetch = FetchType.LAZY)
	private Set<Route> routes1;

	// bi-directional many-to-one association to Route
	@OneToMany(mappedBy = "airport2", fetch = FetchType.LAZY)
	private Set<Route> routes2;

	public Airport() {
	}

	public Integer getAirportid() {
		return this.airportid;
	}

	public void setAirportid(Integer airportid) {
		this.airportid = airportid;
	}

	public String getAirportcode() {
		return this.airportcode;
	}

	public void setAirportcode(String airportcode) {
		this.airportcode = airportcode;
	}

	public String getAirportname() {
		return this.airportname;
	}

	public void setAirportname(String airportname) {
		this.airportname = airportname;
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

	public BigDecimal getLatitude() {
		return this.latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public BigDecimal getLongitude() {
		return this.longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public String getStateProv() {
		return this.stateProv;
	}

	public void setStateProv(String stateProv) {
		this.stateProv = stateProv;
	}

	public Set<Route> getRoutes1() {
		return this.routes1;
	}

	public void setRoutes1(Set<Route> routes1) {
		this.routes1 = routes1;
	}

	public Set<Route> getRoutes2() {
		return this.routes2;
	}

	public void setRoutes2(Set<Route> routes2) {
		this.routes2 = routes2;
	}

}