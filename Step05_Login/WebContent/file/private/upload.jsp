<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//업로드 설정
	final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	
	//실제로 업로드한 파일이 있는지 체크 한다.
	if (!ServletFileUpload.isMultipartContent(request)) {
		//에러페이지 응답
	    response.sendError(HttpServletResponse.SC_NO_CONTENT,
	    		"파일을 첨부하지 않아 처리가 불가능합니다.");
	    return;//메소드 종료
	}
	
	// configures upload settings
	DiskFileItemFactory factory = new DiskFileItemFactory();
	// sets memory threshold - beyond which files are stored in disk
	factory.setSizeThreshold(MEMORY_THRESHOLD);
	// sets temporary location to store files
	factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	ServletFileUpload upload = new ServletFileUpload(factory);
	// sets maximum size of upload file
	upload.setFileSizeMax(MAX_FILE_SIZE);
	// sets maximum size of request (include file + form data)
	upload.setSizeMax(MAX_REQUEST_SIZE);
	
	//업로드된 파일을 저장할 절대경로(서버 파일시스템의) 얻어오기
	String uploadPath=application.getRealPath("/upload"); //"WebContent/upload"이다.
	System.out.println("파일이 저장될 경로 : "+uploadPath);
	//전송된 파라미터 한글 인코딩 설정
	upload.setHeaderEncoding("utf-8");
	
	//작업 성공여부
	boolean isSuccess=false;
	//파일의 정보를 담을 FileDto객체생성
	FileDto dto=new FileDto();
	try{
		List<FileItem> formItems=upload.parseRequest(request);
		if(formItems!=null && formItems.size()>0){
			
			//반복문돌면서 전송된 아이템을 불러온다
			for(FileItem item:formItems){
				if(!item.isFormField()){
					//input type="file"일때
					//원본파일명
					String orgFileName=new File(item.getName()).getName();
					
					//파일의사이즈
					long fileSize=item.getSize();
					
					//저장할 파일명을 겹치지않게 지정
					String saveFileName=System.currentTimeMillis()+
					orgFileName;
					
					//파일 시스템에 저장할 전체 경로를 구성
					String filePath=uploadPath+File.separator+saveFileName;
					
					//파일을 위의 경로에 실제로 저장
					File storeFile=new File(filePath);
					item.write(storeFile);
					
					//Filedto에 정보저장
					dto.setOrgFileName(orgFileName);
					dto.setFileSize(fileSize);
					dto.setSaveFileName(saveFileName);
					
				}else{
					//input type="file"이 아닐때
					if(item.getFieldName().equals("title")){
						//제목읽기
						String title=item.getString("utf-8");
						
						//제목담기
						dto.setTitle(title);
					}//if()
				}//else
			}//for
			//작성자
			String id=(String)session.getAttribute("id");
			dto.setWriter(id);
					
			//DB에 파일정보 저장
			isSuccess=FileDao.getInstance().insert(dto);
			
		}//if()
	}catch(Exception e){
		//예외가 발생하면 에러페이지 응답
		response.sendError(500, e.getMessage());
		return;
	}
	request.setAttribute("isSuccess", isSuccess);
	request.setAttribute("orgFileName", dto.getOrgFileName());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업로딩</title>
</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
		<h1>Alert</h1>
		<p class="alert alert-success">
			<strong><%=dto.getOrgFileName() %></strong>
			파일을 저장했습니다.
			<a class="alert-link" href=
			"${pageContext.request.contextPath }/file/list.jsp">
				목록보기	
			</a>
		</p>	
	<%}else{ %>
		<p class="alert alert-danger">
			파일 정보를 DB에 저장하다가 오류발생			
			<a class="alert-link" href=
			"${pageContext.request.contextPath }/file/private/upload_form.jsp">
				다시시도
			</a>
		</p>
	<%} %>
</div>
</body>
</html>