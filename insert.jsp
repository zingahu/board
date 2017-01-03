<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%  
    request.setCharacterEncoding("euc-kr");
	int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String regdate = request.getParameter("regdate");
	int count = 10000;
	String content = request.getParameter("content");
	
	if(title == "" ||title == null) out.println("title이 null입니다.");
	 
	if(writer == "" ||writer == null)
	    out.println("writer가 null입니다.");   
	else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
	    out.println("이메일 형식이 아닙니다.");
	 
	if(regdate == "" ||regdate == null)
	    out.println("regdate가 null입니다.");
	else if(!Pattern.matches("^[0-9]*$", regdate))
	    out.println("숫자형식이 아닙니다.");
	 
	if(content == "" ||content == null) out.println("content가 null입니다.");
	
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver";//데이터베이스에 접속하기 위한 드라이버 로드
		String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
		
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "board","board");  //디비 접근정보 , id, pass
		out.println("Oracle db connected.....success...");
		
		Statement stmt = con.createStatement();
		String sql = "INSERT INTO BOARD "+
		             "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
				     "VALUES( board_seq.nextval', '"+title+"','" + writer+"', '"  + regdate + "','1', '"+content+"')";
		out.println(sql);
		stmt.executeUpdate(sql);
		
		con.close();
	} catch(Exception e){
		out.println("Oracle db 접속에 문제가 있습니다. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>

</body>
</html>