package com.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.demo.model.Admin;


@Repository("adminDao")
@Mapper
public interface AdminDao {

	@Select("select * from user where name = #{name} and password = #{password}")
	Admin find(Admin admin);
}
