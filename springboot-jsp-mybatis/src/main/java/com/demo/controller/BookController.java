package com.demo.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.demo.model.Book;
import com.demo.model.Type;
import com.demo.service.BookService;
import com.demo.service.TypeService;
import com.github.pagehelper.PageInfo;

@Controller
@MultipartConfig

public class BookController {

	@Autowired
	@Qualifier(value = "bookService")
	private BookService bookService;

	@Autowired
	@Qualifier(value = "typeService")
	private TypeService typeService;
	private List<Type> ls;

	@RequestMapping(value = "/saveBook")
	public String saveBook(@Valid @ModelAttribute Book book, BindingResult result,
			@RequestParam(value = "file") MultipartFile file, HttpServletRequest request, Model model)
			throws IOException, ParseException {

		if (result.hasErrors()) {
			ls = typeService.findAll();
			request.setAttribute("typeList", ls);
			return "bookInput";
		}

		String fileName = file.getOriginalFilename();
		// 解决IE下路径问题
		fileName = fileName.lastIndexOf("\\") == -1 ? fileName : fileName.substring(fileName.lastIndexOf("\\") + 1);

		// 解决名字重复问题
		String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);

		String newFileName = UUID.randomUUID() + "." + ext;

		// fileName.transferTo(new
		// File(request.getServletContext().getRealPath("WEBINF/upload/" +
		// newFileName)));

		OutputStream output = new FileOutputStream(
				request.getServletContext().getRealPath("/WEB-INF/upload/" + newFileName));
		IOUtils.copy(file.getInputStream(), output);
		output.close();

		book.setPhoto(newFileName);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		book.setPubdate(sdf.parse(book.getDate()));

		int ret = bookService.saveBook(book);

		if (ret > 0) {
			model.addAttribute("msg", "添加成功");
			toInput(model);
			return "redirect:toInput";
		} else {
			model.addAttribute("msg", "添加失败");
			toInput(model);
			return "redirect:toInput";
		}
	}
	
	/*
	 * 
	 */

	@RequestMapping(value = "/toInput")
	public String toInput(Model model) {
		ls = typeService.findAll();
		Book book = new Book();
		model.addAttribute("book", book);
		model.addAttribute("typeList", ls);
		return "bookInput";
	}

	/*
	 * 
	 */
	@RequestMapping("/bookList")
	public String showBook(Model model, @RequestParam(defaultValue = "1", required = false) int pageNo,
			@RequestParam(defaultValue = "", required = false) String name,
			@RequestParam(defaultValue = "-1", required = false) int tid) {

		List<Type> types = typeService.findAll();
		model.addAttribute("types", types);


		PageInfo<Book> pageInfo = bookService.findAllBook(pageNo, name, tid);
		model.addAttribute("pageInfo", pageInfo);
		return "bookList";
	}

	/*
	 * 
	 */
	@RequestMapping("/bookDel")
	public String delBook(@RequestParam int id) {

		@SuppressWarnings("unused")
		int ret = bookService.delBookById(id);
		return "redirect:bookList";
	}

	
	/*
	 * 
	 */
	@RequestMapping("/toBookEdit")
	public String editBook(@RequestParam int id,Model model){
		
		Book book = bookService.findById(id);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		book.setDate(formatter.format(book.getPubdate()));
		ls = typeService.findAll();
		model.addAttribute("book", book);
		model.addAttribute("typeList", ls);
		return "bookEdit";
		
	}
	
	/*
	 * 
	 */
	@RequestMapping("/editBook")
	public String bookEdit(@Valid @ModelAttribute Book book, BindingResult result,
			@RequestParam(value = "file") MultipartFile file, HttpServletRequest request, Model model,HttpSession session) throws IOException, ParseException {
		
		String serverVcode = (String) session.getAttribute(ValidateController.serverVCodeName);
		if(!serverVcode.equalsIgnoreCase(book.getVcode())) {
			result.rejectValue("vcode","book.vcode", "验证码错误");
		}
		
		if (result.hasErrors()) {
			ls = typeService.findAll();
			request.setAttribute("typeList", ls);
			
			return "bookEdit";
		}
		
		System.out.println(book+"+++++++++++++++++++++++++++++++++++++++++++++++");
		if(!file.isEmpty()) {
			
			String fileName = file.getOriginalFilename();
			System.out.println(fileName + "+++++++++++++++++++++++++++++++++++++++++++++++++++");
			// 解决IE下路径问题
			fileName = fileName.lastIndexOf("\\") == -1 ? fileName : fileName.substring(fileName.lastIndexOf("\\") + 1);

			// 解决名字重复问题
			String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);

			String newFileName = UUID.randomUUID() + "." + ext;

			OutputStream output = new FileOutputStream(
					request.getServletContext().getRealPath("/WEB-INF/upload/" + newFileName));
			IOUtils.copy(file.getInputStream(), output);
			output.close();

			book.setPhoto(newFileName);
		}

		

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		book.setPubdate(sdf.parse(book.getDate()));

		int ret = bookService.editBook(book);

		if (ret > 0) {
			
			return "redirect:bookList";
		} else {
			
			return "redirect:bookList";
		}
		
	}

}
