<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">
	<title>19시 :: 일 구하고 시퍼</title>
	<!-- favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="favicon_io/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="favicon_io/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="favicon_io/favicon-16x16.png">
	


</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<h1>여러분 화이팅~~!!~</h1>
	<h2>해피뉴이어~~</h2>
	<hr>
	<h3>본인 페이지 테스트</h3>
	소현
	<a href="/chatList.do?mGrade=${loginMember.MGrade}&mId=${loginMember.MId}"
		onClick="window.open(this.href, '', 'width=530, height=630, left=1000,location=no,scrollbars=no,location=no, resizable=no'); return false;">채팅하기</a>
	<a href="/manageMember.do?reqPage=1&grade=all&keyword=&order=new">관리자-회원관리+페이징+검색+정렬</a>
	<a href="/manageService.do?reqPage=1&status=waiting&keyword1=&keyword2=&order=old">관리자-서비스관리+페이징+검색+정렬</a>
	<br> 영재
	<a href="/introduceFrm.do?mId=newy10&reqPage=1">프리랜서소개글</a>
	<a href="/serviceJoinFrm.do?MId=${loginMember.MId}">서비스등록</a>
	<a href="/freelancerMypage.do?MNo=${loginMember.MNo}">프리랜서 마이페이지</a>
	<br> 문정
	<a href="/requestList.do?reqPage=1&order=new&subject=all&keyword=">의뢰게시판 리스트 </a> /
	<a href="/userMypage.do">사용자 마이페이지</a>
	<br> 다솜
	<a href="/noticeList.do">공지사항 게시판</a> /
	<a href="/serviceList.do">서비스리스트</a> /
	<a href="/serviceView.do">서비스 상세보기</a> <br>
	<a href="/serviceList.do?cNo=10&reqPage=1">리스트테스트</a>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>