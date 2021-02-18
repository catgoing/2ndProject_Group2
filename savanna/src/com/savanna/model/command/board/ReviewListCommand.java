package com.savanna.model.command.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.ReviewDAO;
import com.savanna.model.vo.ReviewVO;

public class ReviewListCommand implements Command{
	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, Integer> map = null;
		List<ReviewVO> list = ReviewDAO.getList(map);
		request.setAttribute("list", list);

		return "list.jsp";
	}

}