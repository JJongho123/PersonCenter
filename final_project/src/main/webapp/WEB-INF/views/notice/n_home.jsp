<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>파이널</title>

<meta http-equiv="content-language" content="kr">
<meta name="apple-mobile-web-app-title">
</head>
<body class="responsive is-round">
	<script>
		// Page Loader
		$(window).on('load', function() {
			$("#nt_loader").delay(100).fadeOut("slow");
		});
		$(document).ready(function() {
			$('#nt_loader').on('click', function() {
				$('#nt_loader').fadeOut();
			});
		});

	</script>
	<div id="nt_loader">
		<div class="loader">
			<i class="fa fa-spinner fa-spin text-primary"></i> <span
				class="sr-only">Loading...</span>
		</div>
	</div>


	<style>
.nt-container {
	max-width: 1100px;
}

.nt-container-wide {
	max-width: 1980px;
}

.boxed.wrapper, .boxed.wrapper #nt_menu_wrap.me-sticky nav {
	max-width: 1100px;
}

.no-responsive .wrapper {
	min-width: 1100px;
}
</style>


	<div id="nt_body" class="nt-body">

		<div class="nt-container px-0 px-sm-4 px-xl-0 pt-0 pt-sm-4">
			<div class="row na-row">
				<!-- 메인 영역 -->

				<!-- 게시판 목록 시작 { -->
				<div id="bo_list_wrap" class="mb-4">

					<!-- 검색창 시작 { -->
					<div id="bo_search" class="collapse">
						<div class="alert bg-light border p-2 p-sm-3 mb-3 mx-3 mx-sm-0">
							<!-- 검색창 폼 만들어야함 -->
							<form
								action="${pageContext.request.contextPath}/notice/findNotice"
								name="findNotice" method="post" class="m-auto"
								style="max-width: 600px;">

								<div class="form-row mx-n1">
									<div class="col-6 col-sm-3 px-1">
										<label for="sfl" class="sr-only">검색대상</label> <select
											name="searchType" id="searchType" class="custom-select">
											<option value="all">전체</option>
											<option value="board_no_title">제목</option>
											<option value="board_no_nickname">작성자</option>
											<option value="board_no_content">내용</option>
										</select>
									</div>

									<div class="col-12 col-sm-6 pt-2 pt-sm-0 px-1">
										<label for="stx" class="sr-only">검색어</label>
										<div class="input-group">
											<input type="text" id="searchContent" name="searchContent"
												value="" placeholder="검색어를 입력해 주세요.">
											<div class="input-group-append">
												<button type="submit" class="btn btn-primary" title="검색하기">
													<img src="${path}/resources/img/search_white.png"
														width="18px"> <span class="sr-only">검색하기</span>
												</button>
											</div>
										</div>
									</div>
								</div>
							</form>

						</div>
					</div>
					<!-- } 검색창 끝 -->


					<!-- 게시판 페이지 정보 및 버튼 시작 { -->
					<div id="bo_btn_top" class="clearfix f-de font-weight-normal mb-2">
						<div class="d-sm-flex align-items-center">
							<div id="bo_list_total" class="flex-sm-grow-1">
								<div class="px-3 px-sm-0">${page} / ${endPage} 페이지</div>
								<div class="d-block d-sm-none border-top my-2"></div>
							</div>
							<div class="px-3 px-sm-0 text-right">
								<div class="btn-group" role="group">
									<button type="button"
										class="btn btn_b01 nofocus dropdown-toggle dropdown-toggle-empty dropdown-toggle-split p-1"
										data-toggle="dropdown" data-display="static"
										aria-haspopup="true" aria-expanded="false" title="게시물 정렬">
										<i class="fa fa-sort-numeric-desc fa-fw fa-md"
											aria-hidden="true"></i> <span class="sr-only">게시물 정렬</span>
									</button>
									
								</div>
								<button type="button" class="btn btn_b01 nofocus p-1"
									title="게시판 검색" data-toggle="collapse" data-target="#bo_search"
									aria-expanded="false" aria-controls="bo_search">
									<i class="fa fa-search fa-fw fa-md" aria-hidden="true"> <img
										src="${path}/resources/img/search2.png" width="18px">
									</i> <span class="sr-only">게시판 검색</span>

								</button>


								<a href="${pageContext.request.contextPath}/notice/insert"
									class="btn btn-primary nofocus py-1 ml-2" role="button"> <i
									class="fa fa-pencil" aria-hidden="true"></i>쓰기
								</a>

							</div>
						</div>
					</div>
					<!-- } 게시판 페이지 정보 및 버튼 끝 -->

					<!-- 게시물 목록 시작 { -->
					<section id="bo_list" class="mb-4">

						<!-- 목록 헤드 -->
						<div class="d-block d-md-none w-100 mb-0 bg-primary"
							style="height: 4px;"></div>

						<div class="na-table d-none d-md-table w-100 mb-0">
							<div class="na-table-head border-primary d-md-table-row">
								<div class="d-md-table-cell nw-5 px-md-1">번호</div>
								<div class="d-md-table-cell pr-md-1">제목</div>
								<div class="d-md-table-cell nw-10 pl-2 pr-md-1">작성자</div>
								<div class="d-md-table-cell nw-6 pr-md-1">날짜</div>
								<div class="d-md-table-cell nw-4 pr-md-1">조회</div>
							</div>
						</div>

						<ul class="na-table d-md-table w-100">
							<c:forEach var="item" items="${boards}">

								<li
									class="d-md-table-row px-3 py-2 p-md-0 text-md-center text-muted border-bottom">
									<div
										class="d-none d-md-table-cell nw-5 f-sm font-weight-normal py-md-2 px-md-1">
										<span class="sr-only">번호</span>${item.board_num}</div>
									<div class="d-md-table-cell text-center py-md-2 pr-md-1">
										<div class="na-title float-md-left">
											<div class="na-item">

												<a
													href="${pageContext.request.contextPath}/notice/get?board_num=${item.board_num}&page=${page}">${item.board_no_title }
												</a> <span class="na-ticon na-file"></span>
											</div>

										</div>
									</div>
									<div
										class="float-right float-md-none d-md-table-cell nw-10 nw-md-auto text-center f-sm font-weight-normal pl-2 py-md-2 pr-md-1">
										<span class="sr-only">등록자</span> <span class="sv_member">${item.board_no_nickname }</span>
									</div>
									<div
										class="float-left float-md-none d-md-table-cell nw-6 nw-md-auto f-sm font-weight-normal py-md-2 pr-md-1">
										<i class="fa fa-clock-o d-md-none" aria-hidden="true"></i> <span
											class="sr-only">등록일</span>
										<fmt:formatDate pattern="MM.dd" value="${item.board_no_date}" />
									</div>
									<div
										class="float-left float-md-none d-md-table-cell nw-4 nw-md-auto f-sm font-weight-normal py-md-2 pr-md-1">
										<i class="fa fa-eye d-md-none" aria-hidden="true"></i> <span
											class="sr-only">조회</span>${item.board_no_seq}</div>
									<div class="clearfix d-block d-md-none"></div>
								</li>

							</c:forEach>
						</ul>
					</section>
				</div>

			</div>

		</div>

		<div class="font-weight-normal px-3 px-sm-0">
			<ul class="pagination justify-content-center en mb-0">
				<li class="page-item"><a
					href="${pageContext.request.contextPath}/notice?page=${page-1}&friend_id=${friend_id}">&laquo;</a></li>
				<c:forEach var="page" begin="${page}" end="${endPage }">
					<li><a
						href="${pageContext.request.contextPath}/notice?page=${page}&friend_id=${friend_id}">${page}</a></li>
				</c:forEach>
				<li class="page-item"><a
					href="${pageContext.request.contextPath}/notice?page=${page+1}&friend_id=${friend_id}">&raquo;</a></li>

			</ul>
		</div>
	</div>

</body>
</html>

<%@ include file="../include/footer.jsp"%>
