package com.savanna.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.savanna.model.command.Command;
import com.savanna.model.command.member.AdminUpdateCommand;
import com.savanna.model.command.member.AdminWithdrawalCommand;
import com.savanna.model.command.member.DoPwdCheckCommand2;
import com.savanna.model.command.member.DoSignInCommand;
import com.savanna.model.command.member.DoSignUpCommand;
import com.savanna.model.command.member.IdCheckCommand;
import com.savanna.model.command.member.InquiryIdCommand;
import com.savanna.model.command.member.InquiryPwdCommand;
import com.savanna.model.command.member.LogoutCommand;
import com.savanna.model.command.member.MemDetailCommand;
import com.savanna.model.command.member.MemListCommand;
import com.savanna.model.command.member.MyInfoCommand;
import com.savanna.model.command.member.PwdCheckCommand;
import com.savanna.model.command.member.SignInCommand;
import com.savanna.model.command.member.SignUpCommand;
import com.savanna.model.command.member.UpdateCommand;
import com.savanna.model.command.member.WithdrawalCommand;




@WebServlet("/controller")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파라미터 값 확인
		String type = request.getParameter("type");
		String pwd = request.getParameter("pwd");
		System.out.println("pwd: " + pwd);
		System.out.println("type: " + type);
		
		//작업 요청에 대한 처리
		Command command = null;
		if ("signUp".equals(type)) {
			command = new SignUpCommand();
WithdrawalCommand();
		}
		else if (type.indexOf("memList") == 0) {
			if(type.length()==7) {
				command = new MemListCommand("1");
			} else
			comman
		else if ("inquiryPwd".equals(type)) {
			command = new InquiryPwdCommand();
		}
		else if (type.indexOf("memDetail") == 0) {
			command = new MemDetailCommand(type.substring(13));
		}
		
		else if ("adminUpdate".equals(type)) {
			command = new AdminUpdateCommand();
		}
		else if ("adminWithdrawal".equals(type)) {
			command = new AdminWithdrawalCommand();
		}
		
		else if (type.indexOf("idCheck") == 0) {
			command = new IdCheckCommand(type.substring(11));
		}
		
		else if (type.indexOf("doPwdCheck") == 0) {
			command = new DoPwdCheckCommand2(type.substring(14), pwd);
		}
		
		String path = command.execute(request, response); // path 위치에 response 데이터만 넘기는 것
		
		if(type.indexOf("idCheck") != 0 && type.indexOf("doPwdCheck") != 0) {
			request.getRequestDispatcher(path).forward(request, response); // 데이터 포워딩하는 부분
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
