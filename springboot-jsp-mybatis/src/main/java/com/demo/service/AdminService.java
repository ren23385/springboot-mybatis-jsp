package com.demo.service;

import org.springframework.transaction.annotation.Transactional;

import com.demo.model.Admin;

public interface AdminService {

	@Transactional(readOnly=true)
	Admin find(Admin admin);
	
}
