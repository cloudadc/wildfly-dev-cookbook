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
 * The persistent class for the val_seatclass database table.
 * 
 */
@Entity
@Table(name = "val_seatclass")
public class ValSeatclass implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "class", unique = true, nullable = false, length = 10)
	private String class_;

	// bi-directional many-to-one association to Seat
	@OneToMany(mappedBy = "valSeatclass")
	private Set<Seat> seats;

	public ValSeatclass() {
	}

	public String getClass_() {
		return this.class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public Set<Seat> getSeats() {
		return this.seats;
	}

	public void setSeats(Set<Seat> seats) {
		this.seats = seats;
	}

}