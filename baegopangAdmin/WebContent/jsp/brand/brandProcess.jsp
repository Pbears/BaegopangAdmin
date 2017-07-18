<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="gopang.bean.BrandBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.BrandDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		BrandDao brand = new BrandDao();
		
		String brandNo = request.getParameter("brandNo");
		String brandName = request.getParameter("brandName");
		String brandImg = request.getParameter("brandImg");

		int maxNo = brand.selectAllBrandNo(brandNo.charAt(0));
			
		BrandBean bean = new BrandBean(String.valueOf(++maxNo),brandName,brandImg);

		
		String realFolder = "";
		String saveFolder = "upload";
		String encType = "UTF-8";
		// 5MByte
		int maxSize=5*1024*1024;
		
		// 서버에서(서블릿) 어디에 어느 폴더에서 서블릿으로 변환되나
		ServletContext context = this.getServletContext();
		
		// 서블릿상의 upload폴더 경로를 가져온다.
		realFolder = context.getRealPath(saveFolder);
		
		// 파일 받아서 폴더에 업로드
		MultipartRequest multi = null;
		
		try{
			multi = new MultipartRequest(
					request,
					realFolder,
					maxSize,
					encType,
					new DefaultFileRenamePolicy()
					);
			Enumeration en = multi.getParameterNames();
			while(en.hasMoreElements()){
				String name = (String)en.nextElement();
				String value = multi.getParameter(name);
				out.print("<br>"+name+":"+value);
			}
			out.print("<hr>");
			
			// 전솔된 파일이름 
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		//brand.insertBrand(bean);
		//response.sendRedirect("/baegopangAdmin/jsp/brand.jsp");
	%>
</body>
</html>