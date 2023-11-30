<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/DBconnection.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver1.1.1.3">
	<script type="text/javascript">
		function checkValue() {
			var cv=document.data;
			
			if(!cv.sno.value){
				alert("학번이 입력되지 않았습니다.")
				cv.sno.focus();
				return false;
			}
			if(!cv.ekor.value){
				alert("국어점수가 입력되지 않았습니다.")
				cv.ekor.focus();
				return false;
			}
			if(!cv.emath.value){
				alert("수학점수가 입력되지 않았습니다.")
				cv.emath.focus();
				return false;
			}
			if(!cv.eeng.value){
				alert("영어점수가 입력되지 않았습니다.")
				cv.eeng.focus();
				return false;
			}
			if(!cv.ehist.value){
				alert("역사점수가 입력되지 않았습니다.")
				cv.ehist.focus();
				return false;
			}	
			alert("학생 성적이 모두 입력되었습니다.")
		}
	</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 class="title">성적입력</h2>
		<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
		<table class="table_line">
			<tr>
				<th><b>학번</b></th>
				<td><input type="text" name="sno"  autofocus></td>
			</tr>
			<tr>
				<td><b>국어점수</b></td>
				<td align="left"><input type="text" name="ekor" size="5" autofocus></td>
			</tr>
			<tr>
				<td><b>수학점수</b></td>
				<td align="left"><input type="text" name="emath" size="5" autofocus></td>
			</tr>
			<tr>
				<td><b>영어점수</b></td>
				<td align="left"><input type="text" name="eeng" size="5" autofocus></td>
			</tr>
			<tr>
				<td><b>역사점수</b></td>
				<td align="left"><input type="text" name="ehist" size="5" autofocus></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록하기">
					<input type="button" value="다시입력" onclick="location.href='join.jsp'">
					<input type="button" value="학생목록조회" onclick="location.href='member_list.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>