<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page
	import="org.springframework.security.core.context.SecurityContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/nav.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/common/footer.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/question/questionList.css" />

<fmt:requestEncoding value="utf-8" />
<!-- 이거 없으면 이 밑에 jsp: -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1문의" name="title" />
</jsp:include>

<!-- 메뉴 아래 nav? 영역입니다. nav 메뉴 가지고 있는 페이지는 전부 복사해주세요. -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="on_"><a
				href="${pageContext.request.contextPath }/notice/noticeList.do"
				target="_top">공지사항</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/review/reviewList.do" target="_top">네티즌리뷰</a></li>
			<li class="on_"><a
				href="${pageContext.request.contextPath}/sharing/boardList.do"
				target="_top">티켓나눔터</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/faq.do" target="_top">자주찾는 질문</a></li>
			<li class="on_"><a href="${pageContext.request.contextPath}/question/questionList.do" target="_top">1:1 문의</a></li>
		</ul>
	</div>
</div>
<!-- 여기까지 nav 입니다. -->

<section class="ink_board guest_mode">
	<div class="bd_header">
		<h2 class="bd_title">
			<img src="${pageContext.request.contextPath}/resources/upload/board/리뷰게시판 타이틀 로고.png" alt="" />
			<a href="${pageContext.request.contextPath}/question/questionList.do">1:1 문의</a>
		</h2>
	</div>
	<sec:authorize access="hasRole('ROLE_USER') && !hasRole('ROLE_ADMIN')">
		<div class="list_wrap">
			<div class="ink_list ldn">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					summary="List of Articles">
					<thead>
						<!-- LIST HEADER -->
						<tr>
							<th class="no" scope="col">번호</th>
							<th scope="col" class="title">제목</th>
							<th scope="col">글쓴이</th>
							<th class="date" scope="col">날짜</th>
						</tr>
						<!-- /LIST HEADER -->
					</thead>
					<tbody class="">
	
						<!-- LIST -->
						<c:forEach items="${questionList}" var="question" varStatus="vs">
							<tr>
								<td class="no text_en">${question.questionNo}</td>
								<td class="list_left list_title" style="display: flex;">
									<div class="article_type">
										<c:choose>
											<%-- 첨부파일 유무에 따라 다른 이미지 표시 --%>
											<c:when test="${question.attachCount eq 0}">
												<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 없음.png" style="position: relative; top: 3px;" alt="" /></span>
											</c:when>
											<c:otherwise>
												<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 있음.png" style="position: relative; top: 3px;" alt="" /></span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="title_area">
											<a href="${pageContext.request.contextPath}/question/questionDetail.do?no=${question.questionNo}"
												class="title_link"> ${question.questionTitle}
											</a>
										<c:if test="${question.answer eq 'Y'}">
											<a href="#" class="cmt_num updated">1</a>
										</c:if>
									</div>
								</td>
								<td class="list_left list_author has_profile">
									<a href="#popup_menu_area" class="member_66300686" onclick="return false">${question.memberId}</a>
								</td>
								<td class="date text_en">
									<span class="ink_time"><fmt:formatDate value="${question.regDate}" pattern="MM-dd"/></span>
									
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="bt_area bt_left clearfix">
			<sec:authorize access="isAuthenticated()">
				<a class="ib ib2 ib_color bt_write" href="${pageContext.request.contextPath}/question/questionForm.do" style="color: white">
					<i class="fas fa-pen"></i>
					<span>글쓰기</span>
				</a>
			</sec:authorize>	
		</div>
		
		<div class="pagenation">${pagebar}</div>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN') && hasRole('ROLE_USER')">
		<div class="list_wrap">
			<div class="ink_list ldn">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					summary="List of Articles">
					<thead>
						<!-- LIST HEADER -->
						<tr>
							<th class="no" scope="col">번호</th>
							<th scope="col" class="title">제목</th>
							<th scope="col">글쓴이</th>
							<th class="date" scope="col">날짜</th>
						</tr>
						<!-- /LIST HEADER -->
					</thead>
					<tbody class="">
	
						<!-- LIST -->
						<c:forEach items="${qlByAdmin}" var="question" varStatus="vs">
							<tr>
								<td class="no text_en">${question.questionNo}</td>
								<td class="list_left list_title" style="display: flex;">
									<div class="article_type">
										<c:choose>
											<%-- 첨부파일 유무에 따라 다른 이미지 표시 --%>
											<c:when test="${question.attachCount eq 0}">
												<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 없음.png" style="position: relative; top: 3px;" alt="" /></span>
											</c:when>
											<c:otherwise>
												<span><img src="${pageContext.request.contextPath}/resources/upload/board/첨부파일 있음.png" style="position: relative; top: 3px;" alt="" /></span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="title_area">
											<a href="${pageContext.request.contextPath}/question/questionDetail.do?no=${question.questionNo}"
												class="title_link"> ${question.questionTitle}
											</a>
										<!-- 댓글수가 0이 아니면 글제목 옆에 댓글수 표시 -->
										<c:if test="${question.answer eq 'Y'}">
											<a href="#" class="cmt_num updated">1</a>
										</c:if>
									</div>
								</td>
								<td class="list_left list_author has_profile">
									<a href="#popup_menu_area" class="member_66300686" onclick="return false">${question.memberId}</a>
								</td>
								<td class="date text_en">
									<span class="ink_time"><fmt:formatDate value="${question.regDate}" pattern="MM-dd"/></span>
									
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="bt_area bt_left clearfix">
			<sec:authorize access="isAuthenticated()">
				<a class="ib ib2 ib_color bt_write" href="${pageContext.request.contextPath}/question/questionForm.do" style="color: white">
					<i class="fas fa-pen"></i>
					<span>글쓰기</span>
				</a>
			</sec:authorize>	
		</div>
		
		<div class="pagenation">${pagebarByAdmin}</div>
	</sec:authorize>
	
	
</section>



<!-- 페이지 제일 위로 가는 버튼 -->
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<script>
//페이지 제일 위로 가는 버튼
//Get the button:
mybutton = document.getElementById("myBtn");

//When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	  mybutton.style.opacity = 1;
	} else {
	  mybutton.style.opacity = 0;
	}
}

//When the user clicks on the button, scroll to the top of the document
function topFunction() {
document.body.scrollTop = 0; // For Safari
document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}
</script>


<!-- </body> -->



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>