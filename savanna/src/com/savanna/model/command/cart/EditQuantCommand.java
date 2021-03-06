package com.savanna.model.command.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.savanna.model.command.Command;
import com.savanna.model.dao.CartDAO;
import com.savanna.model.vo.MemberVO;

public class EditQuantCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//id, 책번호, 수량을 가져옴
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		String id = mvo.getId();

		int book_no = Integer.parseInt(request.getParameter("book_no"));
		int quant = Integer.parseInt(request.getParameter("quant"));
		
		//map에 추가하여 작업
		Map<String, Object> map = new HashMap<>();
		map.put("cart_quan", quant);	
		map.put("id", id);
		map.put("book_no", book_no);
		
		// 수량변경
		CartDAO.setQuant(map);
		
		return "controller?type=cartList";
	}

}
