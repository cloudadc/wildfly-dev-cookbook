package com.wftravel.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
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
 * The persistent class for the flight database table.
 * 
 */
@Entity
@Table(name = "flight")
public class Flight implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer flightid;

	@Column(nullable = false)
	private Timestamp arrivaldate;

	@Column(nullable = false)
	private Timestamp departuredate;

	@Column(precision = 10, scale = 2)
	private BigDecimal firstclassprice;

	@Column(nullable = false)
	private Integer flightnumber;

	@Column(nullable = false, precision = 10, scale = 2)
	private BigDecimal price;

	@Column(nullable = false)
	private Integer seatstaken;

	// bi-directional many-to-one association to Plane
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "planeid", nullable = false)
	private Plane plane;

	// bi-directional many-to-one association to Route
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "routeid", nullable = false)
	private Route route;

	// bi-directional many-to-one association to Reservation
	@OneToMany(mappedBy = "flight")
	private Set<Reservation> reservations;

	public Flight() {
	}

	public Integer getFlightid() {
		return this.flightid;
	}

	public void setFlightid(Integer flightid) {
		this.flightid = flightid;
	}

	public Timestamp getArrivaldate() {
		return this.arrivaldate;
	}

	public void setArrivaldate(Timestamp arrivaldate) {
		this.arrivaldate = arrivaldate;
	}

	public Timestamp getDeparturedate() {
		return this.departuredate;
	}

	public void setDeparturedate(Timestamp departuredate) {
		this.departuredate = departuredate;
	}

	public BigDecimal getFirstclassprice() {
		return this.firstclassprice;
	}

	public void setFirstclassprice(BigDecimal firstclassprice) {
		this.firstclassprice = firstclassprice;
	}

	public Integer getFlightnumber() {
		return this.flightnumber;
	}

	public void setFlightnumber(Integer flightnumber) {
		this.flightnumber = flightnumber;
	}

	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getSeatstaken() {
		return this.seatstaken;
	}

	public void setSeatstaken(Integer seatstaken) {
		this.seatstaken = seatstaken;
	}

	public Plane getPlane() {
		return this.plane;
	}

	public void setPlane(Plane plane) {
		this.plane = plane;
	}

	public Route getRoute() {
		return this.route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public Set<Reservation> getReservations() {
		return this.reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer(100);
		sb.append("Flight #");
		sb.append(this.flightnumber);
		sb.append(" from ");
		sb.append(this.route.getAirport1().getAirportcode());
		sb.append(" to ");
		sb.append(this.route.getAirport2().getAirportcode());
		sb.append(" departing ");
		sb.append(this.departuredate);
		sb.append(" arriving ");
		sb.append(this.arrivaldate);
		return sb.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((flightid == null) ? 0 : flightid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Flight other = (Flight) obj;
		if (flightid == null) {
			if (other.flightid != null)
				return false;
		} else if (!flightid.equals(other.flightid))
			return false;
		return true;
	}

}