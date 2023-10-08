package com.walker.PennyPowerwashing.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walker.PennyPowerwashing.models.Estimate;
import com.walker.PennyPowerwashing.repositories.EstimateRepository;

@Service
public class EstimateService {
	@Autowired
	private EstimateRepository eRepo;
	public Estimate findById(Long id) {
		Optional<Estimate> result = eRepo.findById(id);
		if (result.isPresent() ) {
			return result.get();
		}
		return null;
	}
	public List<Estimate> allEstimates() {
		return eRepo.findAll();
	}
	public Estimate createEstimate(Estimate estimate) {
		return eRepo.save(estimate);
	}
	public Estimate updateEstimate(Estimate estimate) {
		return eRepo.save(estimate);
	}
	public void deleteEstimate(Long id) {
		Optional<Estimate> oEstimate = eRepo.findById(id);
		if (oEstimate.isPresent()) {
			eRepo.deleteById(id);
		}
	}
}
