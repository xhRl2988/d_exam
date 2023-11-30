<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ include file="layout/DBconnection.jsp"%>

<%
	String sql = "select a.sname, "
			+ " substr(a.sno,1,1) sno_1, substr(a.sno,2,2) sno_2, substr(a.sno,4,2) sno_3, "
			+ " nvl(b.ekor,0) ekor, nvl(b.emath,0) emath, nvl(b.eeng,0) eeng, nvl(b.ehist,0) ehist, "
			+ " (nvl(b.ekor,0) + nvl(b.emath,0) + nvl(b.eeng,0) + nvl(b.ehist,0)) etot "
			+ " from student_tbl_03 a, exam_tbl_03 b "
			+ " where a.sno = b.sno(+) "
			+ " order by etot desc, a.sno asc";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	//개인 과목별 성적
	int ekor     = 0;  //과목별 합 국어
	int emath    = 0;  //과목별 합 수학
	int eeng     = 0;  //과목별 합 영어
	int ehist    = 0;  //과목별 합 역사
	int etot     = 0;  //과목별 합계
	
	int etot_temp = 0;
	
	//개인별 합계로 순위 계산
	int e_rank         = 0;  //개인별 순위
	int e_rank_equal   = 0;  //같은 인원 수
	int e_tot          = 0;  //처음 개인별 합계
	double e_count     = 0;  //전체인원 카운트
	
	//전체 과목별 합계 및 평균
	int ekor_t     = 0;  //과목별 합 국어
	int emath_t    = 0;  //과목별 합 수학
	int eeng_t     = 0;  //과목별 합 영어
	int ehist_t    = 0;  //과목별 합 역사
	double eavg_t  = 0;  //과목별 합 평균
	int etot_t     = 0;  //과목별 합계
	
		
	DecimalFormat df = new DecimalFormat("###.#"); //평균	
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
		<h2 class="title">학생성적</h2>
		<table class="table_line">
			<tr>
				<td>학년</td>
				<td>반</td>
				<td>번호</td>
				<td>이름</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
				<td>역사</td>
				<td>합계</td>
				<td>평균</td>
				<td>순위</td>
			</tr>
			<% while(rs.next()){ 
				ekor	= rs.getInt("ekor");	//국어
				emath	= rs.getInt("emath");	//수학
				eeng	= rs.getInt("eeng");	//영어
				ehist	= rs.getInt("ehist");	//역사
				etot	= rs.getInt("etot");	//합계
				
				ekor_t	+= ekor;	//총합 국어
				emath_t	+= emath;	//총합 수학
				eeng_t	+= eeng;	//총합 영어
				ehist_t	+= ehist;	//총합 역사
				etot_t	+= etot;	//총합 합계
				
				if( etot > 0){
					e_rank++;
					e_count++;
				}
				//같은 성적 시 인원 count
				if(etot == etot_temp){
					e_rank_equal++;
				}else{
					etot_temp = etot;
					e_rank_equal = 0;
				}

			%>
			<tr align="center">
				<td><%=rs.getString("sno_1") %></td>
				<td><%=rs.getString("sno_2") %></td>
				<td><%=rs.getString("sno_3") %></td>
				<td><%=rs.getString("sname") %></td>
			<% if(etot !=0){ %>
				<td><%= ekor %></td>
				<td><%= emath %></td>
				<td><%= eeng %></td>
				<td><%= ehist %></td>
				<td><%= etot %></td>
				<td><%= df.format(etot/4.0) %></td>
				<td><%= e_rank - e_rank_equal %></td>
			<% }else { %>
				<td><%= ' ' %></td>
				<td><%= ' ' %></td>
				<td><%= ' ' %></td>
				<td><%= ' ' %></td>
				<td><%= ' ' %></td>
				<td><%= ' ' %></td>
				<td><%= ' ' %></td>
			<% } %>
			</tr>
		<% } %> 

			<tr align="center">
				<td colspan="4"> 총 합 </td>
				<td><%= ekor_t %></td>
				<td><%= emath_t %></td>
				<td><%= eeng_t %></td>
				<td><%= ehist_t %></td>
				<td><%= etot %></td>
				<td><%= df.format(etot_t/4.0/e_count) %></td>
				<td><%= ' '  %></td>
			</tr>
			<tr  align="center">
				<td colspan="4"> 총평균 </td>
				<td><%= df.format(ekor_t/e_count) %></td>
				<td><%= df.format(emath_t/e_count) %></td>
				<td><%= df.format(eeng_t/e_count) %></td>
				<td><%= df.format(ehist_t/e_count) %></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			

		</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>