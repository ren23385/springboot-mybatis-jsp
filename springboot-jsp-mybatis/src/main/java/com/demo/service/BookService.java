package com.demo.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.demo.model.Book;
import com.github.pagehelper.PageInfo;


public interface BookService {

	@Transactional(readOnly=false)
	public int saveBook(Book book);

	@Transactional(readOnly=false)
	public List<Book> findAllBook();

	@Transactional(readOnly=true)
	public PageInfo<Book> findAllBook(int pageNo, String name, int tid);

	@Transactional(readOnly=false)
	public int delBookById(int id);

	@Transactional(readOnly=false)
	public int editBook(Book book);

	@Transactional(readOnly=true)
	public Book findById(int id);
}
