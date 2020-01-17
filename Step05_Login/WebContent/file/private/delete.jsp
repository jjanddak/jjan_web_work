<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 파일의 번호를읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 삭제할 파일의 정보를 읽어와서 삭제할 파일의 저장된 파일명을 얻어낸다.
	FileDto dto=FileDao.getInstance().getData(num);
	String saveFileName=dto.getSaveFileName();
	//3. DB에서 파일 정보 삭제
	boolean isSuccess=FileDao.getInstance().delete(num);
	//4. 파일 시스템에서 파일 삭제.
	String path=application.getRealPath("/upload")+
		File.separator+saveFileName;
	File f=new File(path);
	f.delete();
	//5. 리다이렉트 이동 응답.
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleting.....</title>
</head>
<body>

</body>
</html>