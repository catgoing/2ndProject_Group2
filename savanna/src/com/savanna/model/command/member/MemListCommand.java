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

public class MemListCommand implements Command{
	String cPage;
	
	public MemListCommand(String cPage) {
		this.cPage = cPage;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Paging p = new Paging();

		//1. 전체 게시물의 수를 구하기
		p.setTotalMember(MemberDAO.getTotalCount());
		p.setTotalPage();
//		System.out.println("> 전체 회원 수 : " + p.getTotalMember());
//		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		
//		System.out.println("cpage: " + cPage);
		
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당 글수
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1); 
		
		//(선택적)3-1 끝 글번호가 데이터건수보다 많은경우 데이터건수와 일치
		if (p.getEnd() > p.getTotalMember()) {
			p.setEnd(p.getTotalMember());
		}
//		System.out.println("--------------");
//		System.out.println(">> 현재 페이지 : " + p.getNowPage());
//		System.out.println(">> 시작글번호(begin) : " + p.getBegin());
//		System.out.println(">> 끝 글번호(end) : " + p.getEnd());
		
		//----- 블록(block) 계산하기 -----------
		//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		//시작페이지 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		//4-1. 끝페이지(endPage)가 전체 페이지수(totalPage) 보다 크면
		// 끝페이지 값을 전체페이지수로 변경처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
//		System.out.println(">>시작페이지(beginPage) : " + p.getBeginPage());
//		System.out.println(">>끝페이지(endPage) : " + p.getEndPage());
		
		
		//=====================================
		//현재 페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝글번호 저장용 Map 만들기(전달할 파라미터 저장용)
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		
		//DB에서 현재페이지 표시할 게시글 조회
		List<MemberVO> list = MemberDAO.getList(map);
//		System.out.println("> 현재 페이지 글목록(list) : " + list);
		

//		List<MemberVO> list = DAO.getMemList();
//		
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		request.setAttribute("cPage", cPage);
		
		
		return "member/memList.jsp";
	}


}
