package com.savanna.model.command.book;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.BookDAO;
import com.savanna.model.command.Command;
import com.savanna.model.vo.BookVO;
import com.savanna.model.vo.PageVO;

public class ListPagingCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!isLoginValidate()) {
			System.out.println("invalid login attempt");
			return "";
		}
		
		PageVO page = new PageVO();

		page.setTotalRecord(BookDAO.getBookCount());
		page.setTotalPage();
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			page.setCurPage(Integer.parseInt(cPage));
		}
		
		page.initPage();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", page.getCurPageRecordBeginIdx());
		map.put("end", page.getCurPageRecordEndIdx());
		
		//DB에서 현재페이지 표시할 게시글 조회
		List<BookVO> list = BookDAO.getPagedList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("pvo", page);
		return "bookList.jsp";
	}
	
	public boolean isLoginValidate() {
		return true;
	}
}