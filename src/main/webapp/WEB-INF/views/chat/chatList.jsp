<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>19시 :: 문의하기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<style>
.green {
	color:#3FC32C;
}

.blue {
	color:#2C8BC3;
}

.red {
	color:#B31E1E;
}
</style>
</head>

<body>
	<!--전체 wrap-->
	<div id="chat-wrap">

		<!------------------------ [chat-side]------------------------------------->
		<jsp:include page="/WEB-INF/views/chat/chat-side.jsp" />
		<!------------------------ [chat-side]------------------------------------->

		<!------------------------ content 시작 ------------------------------------->
		<div class="content">

			<!-- chatlist가 not null -->
			<c:if test="${not empty room }">
				<!-- 문의 리스트 -->
				<!-- 새로운 메세지 표시 span- color:orange 로 변경-->

				<div class="content-list">
					<div id="content-title">문의 리스트</div>
					<div id="chat-list">
						<ul>
							<c:forEach items="${room }" var="r">
								<!-- 일반 채팅내용 -->
								<c:if test="${r.freeId ne 'admin'}">
									<li class="list">
										<div class="list-wrap">
											<!-- 마지막 메세지가 내가 보낸게 아니고, status=1일때 -->
											<c:if test="${r.read eq 1 }">
												<c:if test="${r.sender ne sessionScope.loginMember.MId }">
													<span class="new"></span>
												</c:if>
											</c:if>
											<div id="chat-preview">
												<p>
													<b id="name"> <c:if test="${r.freeId eq null }">(탈퇴한 회원)</c:if>
														<c:if test="${r.freeId ne null }">
															<c:if test="${ loginMember.MGrade eq 1}">[${r.brandName }]<br>${r.serviceTitle }</c:if>
															<c:if test="${ loginMember.MGrade eq 2}">${r.freeId}-${r.serviceTitle }</c:if>
															<span id="tradeStatus"> <c:if
																	test="${r.status eq -1 }">
																	<span class="green">(문의중)</span>
																</c:if> <c:if test="${r.status eq 0 }">
																	<span class="green">(결제전)</span>
																</c:if> <c:if test="${r.status eq 1 }">
																	<span class="blue">(진행중)</span>
																</c:if> <c:if test="${r.status eq 2 }">
																	<span class="red">(작업완료)</span>
																</c:if>
															</span>
														</c:if>
													</b><span id="time" style="float: right;">${r.lastDate }<br>${r.lastTime}</span>
												</p>
												<p id="preview">${r.lastMsg }</p>
												<input type="hidden" class="cNo" value="${r.cNo }">
												<input type="hidden" class="sNo" value="${r.sNo }">
												<input type="hidden" class="freeId" value="${r.freeId }">
											</div>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>

			</c:if>
			<!-- chatlist가 not null -->


			<!-- chatlist가 null -->
			<c:if test="${empty room}">
				<div class="empty-page">
					<div id="content-title">문의 리스트</div>
					<div id="empty-content">
						<br> <br> <br> <br> <br> <br> <img
							src="/img/icon/exclamation_black.png">
						<h3>
							아직 문의 내역이 <br>없습니다!
						</h3>
						<c:if test="${loginMember.MGrade eq 1 }"><a href="#"><u>나에게 맞는 서비스 검색 ></u></a></c:if>
						<c:if test="${loginMember.MGrade eq 2 }"><a href="#"><u>의뢰서 보러가기 ></u></a></c:if>
					</div>
				</div>
			</c:if>
			<!-- chatlist가 null -->

			<!-- 문의리스트 끝 -->
		</div>
		<!------------------------ content 끝 ------------------------------------->

	</div>
	<!-- chat-wrap 끝-->
	<script>
		$(".list").click(
				function() {
					var cNo = $(this).find(".cNo").val();
					var sNo = $(this).find(".sNo").val();
					cNo = Number(cNo);
					sNo = Number(sNo);
					/* 상대방아이디 */
					var freeId = $(this).find(".freeId").val();
					/* 탈퇴한회원일때 */
					if (freeId == '(탈퇴한 회원)') {
						return;
					}
					console.log(cNo);
					console.log(sNo);
					console.log(freeId);
					location.href = "/enterRoom.do?cNo=" + cNo + "&sNo=" + sNo
							+ "&yourId=" + freeId;
				});
	</script>

</body>
</html>