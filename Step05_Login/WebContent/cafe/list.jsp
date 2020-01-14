<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFE LIST</title>
</head>
<body>
<%
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=10;
	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}	


	//1. DB에서 글목록을 얻어오기
	List<CafeDto> list=CafeDao.getInstance().getList();
	//2. 글목록을 응답.
%>
<div class="container">
	<a href="private/insertform.jsp">새글 작성</a>
	<h1>글 목록입니다</h1>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%for(CafeDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><%=tmp.getViewCount() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>		
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>