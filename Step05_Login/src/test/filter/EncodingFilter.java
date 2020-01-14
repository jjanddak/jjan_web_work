package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*
 * 필터클래스 만드는 원데이클래스
 * 
 * 1. Filter 인터페이스를 implements한다
 * 2. 어떤 요청에대해서 Filter가 작동할지
 * 	  @WebFilter(요청경로패턴)  어노테이션을 지정.
 * 3. doFilter메소드에서 원하는 동작읋나다
 * 
 */
@WebFilter("/*")
public class EncodingFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 인코딩잉 설정되지 않았다면
		if(request.getCharacterEncoding()==null) {
			//post 방식 한글 인코딩
			request.setCharacterEncoding("utf-8");
		}
		
		//요청흐름 이어가기
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
