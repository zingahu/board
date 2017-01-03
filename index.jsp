<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		ResultSet rs = null;
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "board","board");
		out.println("Oracle Database Connection Success.");
		
		Statement stmt = con.createStatement();
		String sql = "select * from board order by idx desc";
		rs = stmt.executeQuery(sql);
%>
	<h1>게시글리스트</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조히수</th>
		</tr>
	<%
	
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>" + rs.getString(1) + "</td>");		
			out.print("<td>" + rs.getString(2) + "</td>");		
			out.print("<td>" + rs.getString(3) + "</td>");		
			out.print("<td>" + rs.getString(4) + "</td>");		
			out.print("<td>" + rs.getString(5) + "</td>");	
			out.print("</tr>");
		}	
	
	%>


	</table>
	<a href="write.jsp">글쓰기</a>
	
	<%

	
		con.close();
	}catch(Exception e){
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	
	%>
</body>
</html>