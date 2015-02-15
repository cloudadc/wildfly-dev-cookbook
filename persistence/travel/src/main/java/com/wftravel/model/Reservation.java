package com.wftravel.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * The persistent class for the reservation database table.
 * 
 */
@Entity
@Table(name = "reservation")
public class Reservation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer reservationid;

	@Column(nullable = false)
	private Integer checkedin;

	@Column(length = 500)
	private String comment;

	// bi-directional many-to-one association to Flight
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "flightid", nullable = false)
	private Flight flight;

	// bi-directional many-to-one association to Seat
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "seatid", nullable = false)
	private Seat seat;

	// bi-directional many-to-one association to User
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid", nullable = false)
	private User user;

	// bi-directional many-to-one association to ValMealtype
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "meal")
	private ValMealtype valMealtype;

	public Reservation() {
	}

	public Integer getReservationid() {
		return this.reservationid;
	}

	public void setReservationid(Integer reservationid) {
		this.reservationid = reservationid;
	}

	public Integer getCheckedin() {
		return this.checkedin;
	}

	public void setCheckedin(Integer checkedin) {
		this.checkedin = checkedin;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Flight getFlight() {
		return this.flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public Seat getSeat() {
		return this.seat;
	}

	public void setSeat(Seat seat) {
		this.seat = seat;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ValMealtype getValMealtype() {
		return this.valMealtype;
	}

	public void setValMealtype(ValMealtype valMealtype) {
		this.valMealtype = valMealtype;
	}

}