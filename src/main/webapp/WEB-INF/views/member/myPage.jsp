<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		
			<div class="column">
				<div class="mp_profile">
					<div style="height:70px;"class="profile_title">
						<h2>프로필</h2>
					</div>
					<div class="profile_body">
						<dl id="currentInfo">
							<dt style="height: 50px;">이름</dt>
							<dd style="height: 50px;">${sessionScope.loginMember.m_name}</dd>
							<dt style="height: 50px;">성별</dt>
							<dd style="height: 50px;">${sessionScope.loginMember.m_gender}</dd>
							<dt style="height: 50px;">휴대전화</dt>
							<dd style="height: 50px;">${sessionScope.loginMember.m_number}</dd>
							<dt style="height: 50px;">이메일</dt>
							<dd style="height: 50px;">${sessionScope.loginMember.m_email}</dd>
							<dd align="center"><button onclick="modify();">수정</button></dd>
						</dl>
						
						<dl id="modifyInfo" style="display: none;">
							<dt style="height: 50px;">이름</dt>
							<dd style="height: 50px;"><input id="m_name" value="${sessionScope.loginMember.m_name}"></dd>
							<dt style="height: 50px;">성별</dt>
							<dd style="height: 50px;"><input id="m_gender" value="${sessionScope.loginMember.m_gender}"></dd>
							<dt style="height: 50px;">휴대전화</dt>
							<dd style="height: 50px;"><input id="m_number" value="${sessionScope.loginMember.m_number}"></dd>
							<dt style="height: 50px;">이메일</dt>
							<dd style="height: 50px;"><input id="m_email" value="${sessionScope.loginMember.m_email}"></dd>
							<dd align="center">
							<button onclick="modifyInfo();">확인</button>
							<button onclick="modifyCancel();">취소</button>
							</dd>
						</dl>
					</div>
				</div>
				


				<div class="mp_tour" style="margin-top: 50px;">
					<div class="profile_title">
						<h2>투어 목록</h2>
					</div>
				</div>
				
			</div>
			<div style="text-align: center;">
				<div class="" style="display:inline-block; width: 1200px;">
				<c:forEach var="c" items="${mypage_bookmark}" varStatus="status">
					<div>
						<form id="list${status.index }" action="tour.list.detail"
							method="post">
							<div class="list_item" id="dd"
								onclick="document.forms['list${status.index }'].submit();">
								<div class="item_img">
									<img src="${c.b_image }"
										style="width: 100%; height: 180px; object-fit: cover;">
								</div>
		
								<div class="item_title check_attr">
									<div class="mark_btn"
										style="float: right; margin-right: 5px; z-index: 4;">
										<span>★</span>
									</div>
		
									<div>
										<img src="resources/img/neogul.png"
											style="position: absolute; width: 100px; height: 80px; left: -50px; top: -18px">
									</div>
									<div class="list_title">${c.b_title }</div>
									<div class="list_title">${c.b_addr1 }</div>
									
	
									<input type="hidden" id="contentTypeId" name="contentTypeId" value="${c.b_contentTypeId }">
									
									<input type="hidden" class="check_mapx" name="x" value="${c.b_mapx }">
									<input type="hidden" class="check_mapy" name="y" value="${c.b_mapy }">
									<input type="hidden" class="check_title" name="title" value="${c.b_title }">
									<input type="hidden" class="check_contentid" name="contentid" value="${c.b_contentid }">
									<input type="hidden" class="check_addr1" name="addr1" value="${c.b_addr1 }">
									<input type="hidden" class="check_image" name="image" value="${c.b_image }">
		
								</div>
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>