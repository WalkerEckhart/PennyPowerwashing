package com.walker.PennyPowerwashing.models;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty
	@Size(min = 3, max = 30, message = "Your name must be atleast 5 characters.")
	private String username;
	
	@NotEmpty
	@Email(message = "Not a valid email. Please use '@' and '.com'")
	private String email;
	
	@NotEmpty
	@Size(min = 8, max = 128, message = "Password must be between 8 and 48 characters.")
	private String password;
	
	@Transient
	@NotEmpty
	@Size(min = 8, max = 48, message = "Password confirmation must match.")
	private String confirmPassword;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<Estimate> estimates;
	
	public User() {}

	public Long getId() {
		return id;
	}

	public List<Estimate> getEstimates() {
		return estimates;
	}

	public void setEstimates(List<Estimate> estimates) {
		this.estimates = estimates;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
}