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
import com.savanna.model.command.paging.ListPaging;
import com.savanna.model.dao.MemberDAO;
import com.savanna.model.vo.BuyVO;
import com.savanna.model.vo.MemPagingVO;
import com.savanna.model.vo.MemPagingVO2;
import com.savanna.model.vo.MemberVO;

public class AdminMemSearchCommand implements Command {
	
	public AdminMemSearchCommand() {
	
	}


	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println(">> SearchController doGet() 실행~~~");
		
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		String cPage = request.getParameter("cPage");
		String command = "memsearch";
		System.out.println("> idx: "+ idx + ", keyword: " + keyword + ", cpage: " + cPage);
		
		String path = "";
		if (keyword == null || keyword.equals("")) { 
			path = "controller?type=memList"; // 검색값 없으면 리턴할 페이지로 이동
		} else { //검색값이 입력되었으니 DB에서 검색처리
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");

			MemPagingVO2 p = new MemPagingVO2();
			Map<String, String> map = new HashMap<String, String>();
			
			p = p.paging(MemberDAO.getSearchCount(idx, keyword), 15, 7, cPage);
			map = p.idx_keyword(p, idx, keyword);


		
			// 현재 페이지에 표시할 데이터 조회
			List<MemberVO> list = MemberDAO.getsearchList(map);
//			System.out.println("> 현재 페이지 글목록(list) : " + list);

			request.setAttribute("list", list); // 최종 데이터 리스트
			request.setAttribute("pvo", p); // 페이지 정보
			request.setAttribute("cPage", cPage); // 현재 페이지
			request.setAttribute("idx", idx); // idx값 유지를 위해 jsp 페이지로 전달
			request.setAttribute("keyword", keyword); // keyword값 유지를 위해 jsp 페이지로 전달
			request.setAttribute("command", command);

			path = "member/adminMemList.jsp"; // 최종적으로 리턴할 페이지
		}
		
		return path;
	}

}
