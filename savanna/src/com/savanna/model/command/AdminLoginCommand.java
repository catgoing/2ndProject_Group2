package com.savanna.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.BookDAO;
import com.savanna.model.vo.BookVO;

public class AdminLoginCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!isLoginValidate()) {
			System.out.println("invalid login attempt");
			return null;
		}

		System.out.println("login success");
		List<BookVO> list = BookDAO.getBookList();
		request.setAttribute("list", list);
		return "bookList.jsp";
	}
	
	public boolean isLoginValidate() {
		return true;
	}
}
