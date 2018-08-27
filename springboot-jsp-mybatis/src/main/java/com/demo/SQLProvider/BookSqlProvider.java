package com.demo.SQLProvider;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

import com.demo.model.Book;

public class BookSqlProvider {

	public String createFindAllBook(@Param(value="name") final String name,@Param(value="tid") final int tid) {
		
		return new SQL() {
			{
				
				SELECT("*");
				FROM("book");
				if(tid != -1) {
					WHERE("tid = #{tid}");
				}
				if(name != null && !name.equals("")) {
					WHERE("name like concat('%',#{name},'%')");
				}
			}
		}.toString();
	}
	
	
public String createEditBook(@Param(value = "book") final Book book) {
		
		return new SQL() {
			{
				
				UPDATE("book");
				SET("name = #{name},tid = #{tid},descri = #{descri},factor = #{factor},pubdate = #{pubdate},price = #{price}");
				if (book.getPhoto() != null) {
					SET("photo = #{photo}");
				}
				WHERE("id = #{id}");
			}
		}.toString();
	}
	

}
