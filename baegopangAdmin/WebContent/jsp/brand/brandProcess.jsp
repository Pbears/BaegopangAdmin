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
		
		// ��������(����) ��� ��� �������� �������� ��ȯ�ǳ�
		ServletContext context = this.getServletContext();
		
		// �������� upload���� ��θ� �����´�.
		realFolder = context.getRealPath(saveFolder);
		
		// ���� �޾Ƽ� ������ ���ε�
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
			
			// ���ֵ� �����̸� 
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		//brand.insertBrand(bean);
		//response.sendRedirect("/baegopangAdmin/jsp/brand.jsp");
	%>
</body>
</html>