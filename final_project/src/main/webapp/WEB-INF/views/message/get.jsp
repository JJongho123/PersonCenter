<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<link href="${path}/resources/css/read.css" rel="stylesheet">
<link href="${path}/resources/css/gun_custom.css" rel="stylesheet">

<title>메세지 읽기</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

<!-- Custom styles for this template -->
</head>
<script>
function deleteMessage(){
	if(confirm('메세지를 삭제하시겠습니까?')){
			$.ajax({
				method : "post",
				url : "delete",
				data : {
					"message_num" : ${message.message_num},
					"category":"${category}"
				},
				success : function(result) {
					if(result==1){
					alert('메세지가 삭제되었습니다.');
					location.href = "${pageContext.request.contextPath}/message/management?category=${category}";
					}
				}
			});}
}
</script>

<body>
	<div id="nt_body" class="nt-body">
		<div class="nt-container px-0 px-sm-4 px-xl-0 pt-0 pt-sm-4">
			<div class="ArticleTopBtns">
				<div class="right_area">
					<c:if test="category=='read'">
							<h1>Read Message</h1>
							<span class="subheading">Read your Message </span>
						</c:if>
						<c:if test="category=='read'">
							<h1>Read Message</h1>
							<span class="subheading">Read message you sent </span>
						</c:if>
				
						<a>
						</a>
						<input type="button" value="삭제"
								onClick="deleteMessage();" class="BaseButton BaseButton--skinGray size_default"> <input
								type="button" value="목록"
								onclick="location.href='${pageContext.request.contextPath}/message/management?category=${category}&page=${page}'"
								class="BaseButton BaseButton--skinGray size_default">
								
						<a href="${pageContext.request.contextPath}/message/messageView?board_num=${message.board_num}" 
								class="link_talk win_password_lost BaseButton BaseButton--skinGray size_default">답장</a>
						</div>
				<div class="right_area"></div>
			</div>

			<div class="ArticleContentBox">
				<div class="article_header">
					<div class="ArticleTitle">
						
						<a class="link_board"> 보낸이 : ${message.friend_id }</a>
						<div class="title_area">
							
							<h3 class="title_text">${message.message_title}</h3>
						</div>
					</div>
					<div class="WriterInfo">
						<a href="/ca-fe/cafes/10050146/members/prkQguvG11zjC0KAkeAh_A"
							class="thumb"><img
							src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png?type=c77_77"
							alt="프로필 사진" width="36" height="36"></a>
						<div class="profile_area">
							<div class="profile_info">
								<div class="nick_box">
									<button id="writerInfodeancho0618" class="nickname">
										${board.board_nickname}</button>
								</div>
								<em class="nick_level"> 열심회원 <i data-v-d34938e2=""
									class="LevelIcon icon_level"
									style="background-image: url(&quot;https://ca-fe.pstatic.net/web-pc/static/img/sprite_levelicon_9dbde2.svg#1_1-usage&quot;);"></i></em>
								
							</div>
							<div class="article_info">

								<span class="date"> 
								<fmt:formatDate value="${message.message_date }" pattern="yyyy-MM-dd HH:mm:ss" />

								</span> <span class="count">조회 ${board.board_hits }</span>
							</div>
						</div>
					</div>
				
				</div>
				<div class="article_container">
					<!---->
					<!---->
					<!---->
					<!---->
					<div class="article_viewer">
						<div class="SaleInfo">
							<div class="WarningNotice">
							</div>
						
						</div>
						</div >
						<!---->
					</div>
					<!---->
					<!--글 내용-->
					${message.message}
			
					<div class="ReplyBox">
						<div class="box_left">
							<div class="like_article">
								<!---->
								<!---->
							</div>
						</div>
						<div class="box_right"></div>
					</div>
					
				</div>
			</div>
		</div>
	
	<!-- .nt-body -->
	<h3>ㅤ</h3>
</body>

</html>
<%@ include file="../include/footer.jsp"%>