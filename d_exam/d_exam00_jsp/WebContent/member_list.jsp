<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/DBconnection.jsp"%>

<%
	String sql="select sno, sname, "
		+ " substr(sno,1,1) s_grade, substr(sno,2,2) s_class, substr(sno,4,2) s_number, "
		+ " decode(sgender, "
		+ " 'M','남', "
		+ " 'F','여') sgender, "
		+ " sphone, saddress from student_tbl_03";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver1.1.1.2">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 class="title">학생목록</h2>
		<table class="table_line">
			<tr>
				<td><b>학번</b></td>
				<td><b>이름</b></td>
				<td><b>학년</b></td>
				<td><b>반</b></td>
				<td><b>번호</b></td>
				<td><b>성별</b></td>
				<td><b>전화번호</b></td>
				<td><b>주소</b></td>
			</tr>
			<% while(rs.next()){ %>
			<tr align="center">
				<td><%=rs.getString("sno") %></td>
				<td><%=rs.getString("sname") %></td>
				<td><%=rs.getString("s_grade") %></td>
				<td><%=rs.getString("s_class") %></td>
				<td><%=rs.getString("s_number") %></td>
				<td><%=rs.getString("sgender") %></td>
				<td><%=rs.getString("sphone") %></td>
				<td><%=rs.getString("saddress") %></td>
			</tr>
			<% } %>

		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>