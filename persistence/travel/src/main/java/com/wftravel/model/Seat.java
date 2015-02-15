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
 * The persistent class for the seat database table.
 * 
 */
@Entity
@Table(name = "seat")
public class Seat implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer seatid;

	@Column(nullable = false, length = 4)
	private String seatname;

	// bi-directional many-to-one association to Reservation
	@OneToMany(mappedBy = "seat")
	private Set<Reservation> reservations;

	// bi-directional many-to-one association to Plane
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "planeid", nullable = false)
	private Plane plane;

	// bi-directional many-to-one association to ValSeatclass
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "seatcategory", nullable = false)
	private ValSeatclass valSeatclass;

	// bi-directional many-to-one association to ValSeattype
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "seatposition", nullable = false)
	private ValSeattype valSeattype;

	public Seat() {
	}

	public Integer getSeatid() {
		return this.seatid;
	}

	public void setSeatid(Integer seatid) {
		this.seatid = seatid;
	}

	public String getSeatname() {
		return this.seatname;
	}

	public void setSeatname(String seatname) {
		this.seatname = seatname;
	}

	public Set<Reservation> getReservations() {
		return this.reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

	public Plane getPlane() {
		return this.plane;
	}

	public void setPlane(Plane plane) {
		this.plane = plane;
	}

	public ValSeatclass getValSeatclass() {
		return this.valSeatclass;
	}

	public void setValSeatclass(ValSeatclass valSeatclass) {
		this.valSeatclass = valSeatclass;
	}

	public ValSeattype getValSeattype() {
		return this.valSeattype;
	}

	public void setValSeattype(ValSeattype valSeattype) {
		this.valSeattype = valSeattype;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((seatid == null) ? 0 : seatid.hashCode());
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
		Seat other = (Seat) obj;
		if (seatid == null) {
			if (other.seatid != null)
				return false;
		} else if (!seatid.equals(other.seatid))
			return false;
		return true;
	}

}