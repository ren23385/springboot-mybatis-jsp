package com.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.demo.model.Type;

@Repository("typeDao")
@Mapper
public interface TypeDao {

	@Select("select * from type")
	List<Type> findAll();
}
