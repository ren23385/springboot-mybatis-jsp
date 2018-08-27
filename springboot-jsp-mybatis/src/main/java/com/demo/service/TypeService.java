package com.demo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.demo.model.Type;



public interface TypeService {

	@Transactional(readOnly=true)
	List<Type> findAll();
}
