package com.walker.PennyPowerwashing.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.walker.PennyPowerwashing.models.Login;
import com.walker.PennyPowerwashing.models.User;
import com.walker.PennyPowerwashing.repositories.UserRepository;

@Service
public class UserService {
	@Autowired 
	UserRepository userRepo;
	
	
	//REGISTER
	public User createUser(User newUser, BindingResult form) {
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
		
		if(optionalUser.isPresent()) {
			form.rejectValue("email", "Matches", "Email is already taken.");
		}
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			form.rejectValue("confirmPassword", "Matches", "Passwords do not match!");
		}
		if (form.hasErrors()) {
			return null;
		}
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return userRepo.save(newUser);
	}
	
	//LOGIN
	public User login(Login newLogin, BindingResult form) {
		Optional<User> maybeUser = userRepo.findByEmail(newLogin.getEmail());
	if (!maybeUser.isPresent()) {
		form.rejectValue("email", "matches", "User not found...");
		return null;
	}
	User user = maybeUser.get();
	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    form.rejectValue("password", "Matches", "Password isn't correct.");
	}
	if (form.hasErrors()) {
		return null;
	}
	return user;
	}
	
	public User findById(Long id) {
		Optional<User> maybeUser = userRepo.findById(id);
		if (maybeUser.isPresent()) {
			return maybeUser.get();
		}
		return null;
	}
}

