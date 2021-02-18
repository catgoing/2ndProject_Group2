package com.savanna.model.command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< Updated upstream
=======
import com.savanna.model.command.Command;
>>>>>>> Stashed changes
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;

public class DoPwdCheckCommand implements Command{
	String id;
	String pwd;
	
	public DoPwdCheckCommand(String id) {
	
		this.id = id.substring(14);
	
		
	}


	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
				
		int result = 0;
		
		MemberVO vo1 = new MemberVO();
		vo1.setId(id);
		vo1.setPwd(pwd);
//		System.out.println(vo1);
		
		result = MemberDAO.pwdCheck(vo1);
//		System.out.println("pwdcheck: " + result);

		
		req.setAttribute("result", result);	
		out.print(result);
		
		return "member/pwdCheck.jsp";
	}

}
