package com.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.demo.dao.AdminDao;
import com.demo.model.Admin;
import com.demo.service.AdminService;
import com.demo.service.util.Md5Util;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	@Qualifier("adminDao")
	private AdminDao adminDao;
	
	@Override
	public Admin find(Admin admin) {
		// TODO Auto-generated method stub
		
		admin.setPassword(Md5Util.getMD5String(admin.getPassword()));
		//System.out.println(admin.getPassword());
		return adminDao.find(admin);
	}

}
