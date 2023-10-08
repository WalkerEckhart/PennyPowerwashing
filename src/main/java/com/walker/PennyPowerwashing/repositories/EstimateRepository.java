package com.walker.PennyPowerwashing.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.walker.PennyPowerwashing.models.Estimate;

public interface EstimateRepository extends CrudRepository <Estimate, Long>{
		List<Estimate> findAll();

}
