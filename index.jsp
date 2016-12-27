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
	int idx = 1;
	String title = "제목입니다.";
	String writer = "작성자이름";
	String regdate = "120610";
	int count = 10000;
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
		<tr>
			<td><%=idx %></td>
			<td><%=title %></td>
			<td><%=writer %></td>
			<td><%=regdate %></td>
			<td><%=count %></td>
		</tr>
	</table>
	<a href="write.html">글쓰기</a>
</body>
</html>