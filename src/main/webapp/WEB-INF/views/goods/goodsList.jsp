<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/nav.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/goods/goods.css" />

<!-- 인코딩 설정 -->
<fmt:requestEncoding value="utf-8"/>

<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ITFF" name="title" />
</jsp:include>

<!-- 소메뉴 네비게이션 -->
<div id="snb">
	<div class="container-xl">
		<ul class="list-inline snb_ul" id="snbul1">
			<li class="current "><a href="#" target="_top">ITFF 2022</a></li>
			<li class="on_"><a href="#" target="_top">전체상품</a></li>
			<li class="on_"><a href="#" target="_top">묻고 답하기</a></li>
			<li class="on_"><a href="#" target="_top">판매자 정보</a></li>
		</ul>
	</div>
</div>

<!-- 메인 콘텐츠 섹션 -->
<section class="goods-container">

	<!-- 굿즈 배너 이미지 -->
	<img src="${pageContext.request.contextPath }/resources/images/goods/goods_banner.png" id="goods-banner-img" alt="굿즈배너"/>
	
	<hr />
	
	<!-- 상품 목록 부분 -->
	<div id="goods-list-div">
		<p id="title_text">ITFF 2022</p>
		
		<!-- 상품 정렬 리스트 -->
		<ul id="goods-sort-ul">
			<li><a href="#">인기도순</a></li>
			<li><a href="#">낮은가격순</a></li>
			<li><a href="#">높은가격순</a></li>
			<li><a href="#">평점높은순</a></li>
		</ul>
		<br /><br /><br />
		
		<!-- 상품 목록 카드 -->
		<div class="card-list">
		<%-- <c:forEach items="${list}" var="board"> --%>
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
		<%-- </c:forEach> --%>	
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
			
			<div class="card" style="width: 18rem;">
			  <img src="${pageContext.request.contextPath }/resources/images/goods/goods1.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <p class="card-text">Limited Edition 페리리크 머그잔</p>
			    <p class="card-text">29,900원</p>
			  </div>
			</div>
		</div>
		
		
		
	</div>
</section>

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>