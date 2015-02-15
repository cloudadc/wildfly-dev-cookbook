package com.wftravel.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * The persistent class for the route database table.
 * 
 */
@Entity
@Table(name = "route")
public class Route implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer routeid;

	@Column(nullable = false)
	private Integer distance;

	// bi-directional many-to-one association to Flight
	@OneToMany(mappedBy = "route")
	private Set<Flight> flights;

	// bi-directional many-to-one association to Airport
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "destinationairportid", nullable = false)
	private Airport airport1;

	// bi-directional many-to-one association to Airport
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "originairportid", nullable = false)
	private Airport airport2;

	public Route() {
	}

	public Integer getRouteid() {
		return this.routeid;
	}

	public void setRouteid(Integer routeid) {
		this.routeid = routeid;
	}

	public Integer getDistance() {
		return this.distance;
	}

	public void setDistance(Integer distance) {
		this.distance = distance;
	}

	public Set<Flight> getFlights() {
		return this.flights;
	}

	public void setFlights(Set<Flight> flights) {
		this.flights = flights;
	}

	public Airport getAirport1() {
		return this.airport1;
	}

	public void setAirport1(Airport airport1) {
		this.airport1 = airport1;
	}

	public Airport getAirport2() {
		return this.airport2;
	}

	public void setAirport2(Airport airport2) {
		this.airport2 = airport2;
	}

}