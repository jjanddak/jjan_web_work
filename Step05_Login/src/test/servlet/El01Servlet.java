package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/el01")
public class El01Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		//"myName" 키값으로 "김구라" 저장
		req.setAttribute("myName","김구라");
		//jsp페이지로 forward
		RequestDispatcher rd=req.getRequestDispatcher("/el/test01.jsp");
		rd.forward(req,res);
		
	}
}
