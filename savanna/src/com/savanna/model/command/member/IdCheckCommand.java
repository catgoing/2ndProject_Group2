package com.savanna.model.command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;


public class IdCheckCommand implements Command{
	
	String id;
	
	public IdCheckCommand(String id) {
		
		this.id = id;
	}
	

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
//		String id = req.getParameter("id");
		System.out.println("id: " + id);
		MemberVO vo1 = new MemberVO();
		vo1.setId(id);
		
		
		int result = MemberDAO.idCheck(vo1);
//		System.out.println(result);

		
		req.setAttribute("result", result);	
		out.print(result);
		
		return "member/signUp.jsp";
	}

}
