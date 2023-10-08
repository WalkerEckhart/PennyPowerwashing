package com.walker.PennyPowerwashing.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class Login {
    @NotEmpty
    @Email(message = "")
    private String email;
    
    @NotEmpty
    @Size(min=8, max=128, message="Password must be between 8 and 48 characters")
    private String password;
    
    public Login() {}

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
}

