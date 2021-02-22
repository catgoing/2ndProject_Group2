package com.savanna.model.command.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.MemberVO;
import com.savanna.model.vo.Paging;

public class MemDetailCommand implements Command{
	String id;
	
	public MemDetailCommand(String id) {
		System.out.println(id);
		this.id = id;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		

		
		MemberVO vo = MemberDAO.memDetail(id);
//		System.out.println(vo);

		request.setAttribute("vo", vo);

		
		
		return "member/memDetail.jsp";
	}


}
