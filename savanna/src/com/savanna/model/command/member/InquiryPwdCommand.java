package com.savanna.model.command.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;


public class InquiryPwdCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");

		MemberVO vo1 = new MemberVO();
		vo1.setId(id);
		vo1.setName(name);
		
		String pwd = MemberDAO.inquiryPwd(vo1);
		
		if(pwd != null) {
			request.setAttribute("pwd", pwd);
			
			return "member/inquiryPwdResult.jsp";
		}
		
		else {
			return "member/error.jsp";
		}
		
		
	}
	
	

}
