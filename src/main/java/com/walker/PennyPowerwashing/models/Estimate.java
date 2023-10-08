package com.walker.PennyPowerwashing.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name= "estimates")
public class Estimate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Double price;
	@NotNull(message = "Please input a number")
	private Integer windows;
	@NotNull(message = "Please provide a rough estimate of your home's exterior square footage")
	private Integer squareFootage;
	@NotNull(message = "Please provide the number of floors")
	private Integer floors;
	@NotNull(message = "Please select Yes or no")
	private String hasPlants;
	@NotEmpty
	@Size(min = 3, max = 50, message = "Please enter the address of the site.")
	private String address;
	@NotEmpty
	@Size(min = 3, max = 155, message = "Please include extra details in your request.")
	private String details;

	public String getDetails() {
		return details;
	}
	

	@Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    
    public Estimate() {}
    
    public Estimate(Integer windows, Integer squareFootage, Integer floors, String hasPlants, String address) {
    	this.windows = windows;
    	this.squareFootage = squareFootage;
    	this.floors = floors;
    	this.hasPlants = hasPlants;
    	this.address = address;
    }
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getWindows() {
		return windows;
	}

	public void setWindows(Integer windows) {
		this.windows = windows;
	}

	public Integer getSquareFootage() {
		return squareFootage;
	}

	public void setSquareFootage(Integer squareFootage) {
		this.squareFootage = squareFootage;
	}

	public Integer getFloors() {
		return floors;
	}

	public void setFloors(Integer floors) {
		this.floors = floors;
	}

	public String getHasPlants() {
		return hasPlants;
	}

	public void setHasPlants(String hasPlants) {
		this.hasPlants = hasPlants;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
}
