package com.savanna.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.dao.DAO;
import com.savanna.model.vo.MemberVO;

public class MyInfoCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		
		MemberVO vo1 = new MemberVO();
		vo1.setId(id);

		MemberVO vo = DAO.signIn(vo1);

		request.setAttribute("vo", vo);

		return "myInfo.jsp";

	}


}
