package com.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.springframework.stereotype.Repository;

import com.demo.SQLProvider.BookSqlProvider;
import com.demo.model.Book;


@Repository("bookDao")
@Mapper
public interface BookDao {

	
	@Insert("insert into book (name,tid,descri,factor,pubdate,price,photo)"
			+ "values (#{name},#{tid},#{descri},#{factor},#{pubdate},#{price},#{photo})")
	int saveBook(Book book);

	@Select("select * from book")
	List<Book> findAllBook();

	@SelectProvider(type=BookSqlProvider.class,method="createFindAllBook")
	List<Book> findAll(@Param("name") String name, @Param("tid")int tid);

	@Delete("delete from book where id = #{id}")
	int delBookById(int id);

	@UpdateProvider(type=BookSqlProvider.class,method="createEditBook")
	int editBook(Book book);

	@Select("select * from book where id = #{id}")
	Book findById(int id);
}
