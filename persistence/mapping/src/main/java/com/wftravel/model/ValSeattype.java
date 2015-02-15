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
 * The persistent class for the val_seattype database table.
 * 
 */
@Entity
@Table(name = "val_seattype")
public class ValSeattype implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false, length = 10)
	private String seatposition;

	// bi-directional many-to-one association to Seat
	@OneToMany(mappedBy = "valSeattype")
	private Set<Seat> seats;

	public ValSeattype() {
	}

	public String getSeatposition() {
		return this.seatposition;
	}

	public void setSeatposition(String seatposition) {
		this.seatposition = seatposition;
	}

	public Set<Seat> getSeats() {
		return this.seats;
	}

	public void setSeats(Set<Seat> seats) {
		this.seats = seats;
	}

}