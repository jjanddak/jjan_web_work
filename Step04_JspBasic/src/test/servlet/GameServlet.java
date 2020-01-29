package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test1/game")
public class GameServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cPath=req.getContextPath();
		resp.sendRedirect(cPath+"/test1/study.jsp");//게임페이지 요청에 공부페이지로 리다이렉트
		
	}
}
