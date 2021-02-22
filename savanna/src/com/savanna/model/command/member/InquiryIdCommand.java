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


public class InquiryIdCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		MemberVO vo1 = new MemberVO();
		vo1.setName(name);
		vo1.setPhone(phone);
		
		
		String id = MemberDAO.inquiryId(vo1);
		
		if(id != null) {
			request.setAttribute("id", id);
			
			return "member/inquiryIdResult.jsp";
		}
		
		else {
			return "member/error.jsp";
		}
		
		
	}
	
	

}
