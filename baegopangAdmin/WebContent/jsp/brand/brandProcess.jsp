<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="gopang.bean.BrandBean"%>
<%@page import="java.util.List"%>
<%@page import="gopang.dao.BrandDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		BrandDao brand = new BrandDao();
		
		String brandNo = request.getParameter("brandNo");
		String brandName = request.getParameter("brandName");
		String brandImg = request.getParameter("brandImg");

		// GitHub을 사용하기 때문에 경로를 바꿔줘야함.
		String pathUpload = "C:\\test\\";
		BrandBean bean = new BrandBean();
		String job=request.getParameter("job");
		try {
			if (FileUpload.isMultipartContent(request)) {
				DiskFileUpload fileUpload = new DiskFileUpload();
				fileUpload.setSizeMax(1048576 * 5);
				List<FileItem> list = fileUpload.parseRequest(request);
				String fileName = "";

				for (FileItem file : list) {
					String name = file.getFieldName();
					if (name.equals("brandNo")) {
						int maxNo = brand.selectAllBrandNo(file.getString("UTF-8").charAt(0));
						bean.setBrandno(String.valueOf(++maxNo));
					}
					if (name.equals("brandName")) {
						bean.setBrandname(file.getString("UTF-8"));
					}
					if (!file.isFormField()&& file.getName().length()!=0) {						
						File f = new File(pathUpload + file.getName());
						bean.setPicture(file.getName());
						file.write(f);
					}
				}//for
			}//if
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		//brand.insertBrand(bean);
		response.sendRedirect("/baegopangAdmin/jsp/brand.jsp");
		
	%>
</body>
</html>