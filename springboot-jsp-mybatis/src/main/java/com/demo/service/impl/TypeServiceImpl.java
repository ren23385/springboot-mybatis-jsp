package com.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.demo.dao.TypeDao;
import com.demo.model.Type;
import com.demo.service.TypeService;


@Service("typeService")
public class TypeServiceImpl implements TypeService {

	@Autowired
	@Qualifier("typeDao")
	private TypeDao typeDao;
	
	@Override
	public List<Type> findAll() {
		// TODO Auto-generated method stub
		return typeDao.findAll();
	}

}
