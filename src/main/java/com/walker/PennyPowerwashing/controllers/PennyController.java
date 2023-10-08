package com.walker.PennyPowerwashing.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.walker.PennyPowerwashing.models.Estimate;
import com.walker.PennyPowerwashing.models.Login;
import com.walker.PennyPowerwashing.models.User;
import com.walker.PennyPowerwashing.services.EstimateService;
import com.walker.PennyPowerwashing.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class PennyController {
	@Autowired
	private EstimateService eService;
	@Autowired
	private UserService uService;
	
	//REGISTER 
		@GetMapping("/")
	    public String index(Model model) {
	        return "dashboard.jsp";
	    }
		@GetMapping("/signin")
		public String signIn(Model model) {
	        model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new Login());
	        return "index.jsp";
		}
		
		@PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
	    	User user = uService.createUser(newUser, result);
	    	
	        
	        if(result.hasErrors()) {
	            model.addAttribute("newLogin", new Login());
	            return "index.jsp";
	        }
	        session.setAttribute("user_id", user.getId());
	    
	        return "redirect:/dashboard";
	    }
		@PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") Login newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        
	        User user = uService.login(newLogin, result);
	    
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "index.jsp";
	        }
	        session.setAttribute("user_id", user.getId());
	    
	        return "redirect:/dashboard";
	    }
		@GetMapping("/logout")
	    public String logout(HttpSession session) {
	    	session.invalidate();
	    	return "redirect:/";
	    }
		@GetMapping("/dashboard")
	    public String home(Model model, HttpSession session) {
	    	
	    	return "dashboard.jsp";
	    }
		@GetMapping("/addEstimate")
	    public String add(@ModelAttribute("estimate") Estimate estimate, Model model, HttpSession session) {
	    	
			if(session.getAttribute("user_id") == null) {
	    		return "redirect:/dashboard";
	    	}
	    	User user = uService.findById((Long)session.getAttribute("user_id"));
	    	model.addAttribute("user", user);
	    			
	    	return "addEstimate.jsp";
		}
		@PostMapping("/estimate/create")
	    public String createEstimate(@Valid @ModelAttribute("estimate") Estimate estimate, BindingResult result) {

	    	if (result.hasErrors()) {
	    		return "addEstimate.jsp";
	    	}
	    	eService.createEstimate(estimate);
	    	return "redirect:/estimates/self";
	    }
		
		@GetMapping("/estimate/{id}")
		public String showEstimate(Model model, @PathVariable("id") Long id, HttpSession session) {
			if(session.getAttribute("user_id") == null) {
	    		return "redirect:/dashboard";
	    	}
	    	Estimate estimate = eService.findById(id);
	    	model.addAttribute("estimate", estimate);
	    	model.addAttribute("user", uService.findById((Long)session.getAttribute("user_id")));
	    	
	    	return "estimate.jsp";
		}
		@RequestMapping(value="/estimate/{id}/delete", method=RequestMethod.DELETE)
		public String deleteEstimate(@PathVariable("id") Long id, HttpSession session) {
			if(session.getAttribute("user_id") == null) {
	    		return "redirect:/dashboard";
	    	}
			eService.deleteEstimate(id);
			return "redirect:/estimates/self";
		}
		@GetMapping("/estimate/{id}/edit")
		public String edit(@PathVariable("id")Long id, Model model) {
			Estimate estimate = eService.findById(id);
			model.addAttribute("estimate", estimate);
			return "edit.jsp";
		}
		@RequestMapping(value="/estimate/{id}", method=RequestMethod.PUT)
		public String update(
				@Valid
				@ModelAttribute("estimate") Estimate estimate,
				BindingResult result,
				Model model) {
			if (result.hasErrors()) {
				model.addAttribute("estimate", estimate);
				return "edit.jsp";
			} else {
				eService.updateEstimate(estimate);
				return "redirect:/estimates/self";
			}
		}
		@GetMapping("/estimates/self")
		public String userEstimates(Model model, HttpSession session) {
			
			if(session.getAttribute("user_id") == null) {
	    			return "redirect:/dashboard";}
			
			model.addAttribute("estimates", eService.allEstimates());
			model.addAttribute("user", uService.findById((Long)session.getAttribute("user_id")));
			
			return "userEstimates.jsp";
		}
	}

	
