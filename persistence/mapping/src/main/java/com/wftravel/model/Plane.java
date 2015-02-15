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
 * The persistent class for the plane database table.
 * 
 */
@Entity
@Table(name = "plane")
public class Plane implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer planeid;

	@Column(nullable = false, length = 35)
	private String planemodel;

	@Column(nullable = false, length = 15)
	private String tailnumber;

	@Column(nullable = false)
	private Integer totalnumberofseats;

	// bi-directional many-to-one association to Flight
	@OneToMany(mappedBy = "plane")
	private Set<Flight> flights;

	// bi-directional many-to-one association to Seat
	@OneToMany(mappedBy = "plane")
	private Set<Seat> seats;

	public Plane() {
	}

	public Integer getPlaneid() {
		return this.planeid;
	}

	public void setPlaneid(Integer planeid) {
		this.planeid = planeid;
	}

	public String getPlanemodel() {
		return this.planemodel;
	}

	public void setPlanemodel(String planemodel) {
		this.planemodel = planemodel;
	}

	public String getTailnumber() {
		return this.tailnumber;
	}

	public void setTailnumber(String tailnumber) {
		this.tailnumber = tailnumber;
	}

	public Integer getTotalnumberofseats() {
		return this.totalnumberofseats;
	}

	public void setTotalnumberofseats(Integer totalnumberofseats) {
		this.totalnumberofseats = totalnumberofseats;
	}

	public Set<Flight> getFlights() {
		return this.flights;
	}

	public void setFlights(Set<Flight> flights) {
		this.flights = flights;
	}

	public Set<Seat> getSeats() {
		return this.seats;
	}

	public void setSeats(Set<Seat> seats) {
		this.seats = seats;
	}

}