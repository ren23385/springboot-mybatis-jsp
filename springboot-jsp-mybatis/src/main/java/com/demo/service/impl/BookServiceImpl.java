package com.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.demo.dao.BookDao;
import com.demo.model.Book;
import com.demo.service.BookService;
import com.demo.service.util.PageConstent;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("bookService")
public class BookServiceImpl implements BookService {

	@Autowired
	@Qualifier("bookDao")
	private BookDao bookDao;
	
	
	@Override
	public int saveBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.saveBook(book);
	}


	@Override
	public List<Book> findAllBook() {
		// TODO Auto-generated method stub
		
		return bookDao.findAllBook();
	}


	@Override
	public PageInfo<Book> findAllBook(int pageNo, String name, int tid) {
		
		PageHelper.offsetPage((pageNo - 1)*PageConstent.PAGE_SIZE+1-1,PageConstent.PAGE_SIZE,true);
		List<Book> ls  = bookDao.findAll(name,tid);
		PageInfo<Book> pageInfo = new PageInfo<>(ls);
		
		System.out.println(pageInfo);
		
		return pageInfo;
	}


	@Override
	public int delBookById(int id) {
		
		return bookDao.delBookById(id);
	}


	@Override
	public int editBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.editBook(book);
	}


	@Override
	public Book findById(int id) {
		// TODO Auto-generated method stub
		return bookDao.findById(id);
	}

}
