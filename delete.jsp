<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>본격! 게시판 - 게시글 삭제</title>
</head>
<%
	String idx = request.getParameter("idx");
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "board","board");
		out.println("Oracle DataBase Connection Success.");
		
		Statement stmt = con.createStatement();
		String sql = "delete from board where idx = " + idx;
		stmt.executeQuery(sql);
		con.close();
	}catch(Exception e){
		out.println("Oracle Database Connection Something Probem.<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
		
	}
%>
<script>
	alert("게시글이 삭제 되었습니다.");
	location.href="index.jsp";
	
</script>
<body>

</body>
</html>