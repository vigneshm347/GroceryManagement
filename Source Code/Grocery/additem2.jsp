
<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<html>
<head>
</head>
<body>
<%
Thread.sleep(100);
ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Items\\");
		String paramname=null;
	     int id=0;
		String image=null,iname=null,mes=null;
		
		int qua=0,cost=0,scat=0;
   		  File file1 = null;
			
		
		try {
			 
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("pname"))
				{
					iname=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("qua"))
				{
					qua=Integer.parseInt(multi.getParameter(paramname));
				}

				if(paramname.equalsIgnoreCase("mes"))
				{
					mes=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("cost"))
				{
					cost=Integer.parseInt(multi.getParameter(paramname));
				}

				if(paramname.equalsIgnoreCase("scat"))
				{
					scat=Integer.parseInt(multi.getParameter(paramname));
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				
				}
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Items\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
				
	        FileInputStream fs1 = null;
            
			Connection con=databasecon.getconnection(); 
            Statement st=con.createStatement();
            st.executeUpdate("insert into item(iname,qua,mes,cost,pic,subcat,datee) values('"+iname+"','"+qua+"','"+mes+"','"+cost+"','"+image+"','"+scat+"',now())");
            
            response.sendRedirect("amsg.jsp?msg=Item Added Successfully");
        } 
		catch (Exception e) 
		{ 
			response.sendRedirect("amsg.jsp?msg=Item Name Already Exist");
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>