<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>

<body>
<div id="sideBar">
	<ul>
		<li><a href="serviceHome">고객센터</a></li>
		<li><a href="serviceHome">고객센터 홈</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">상담내역 확인</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="serviceHistory">상담내역 확인</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceQna">자주 묻는 질문</a></li>
		<c:choose>
			<c:when test="${empty data.onesfdto.persid }">
				<li><a href="../../member/login/loginForm">1대1 문의</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="servicePersonal">1대1 문의</a></li>
			</c:otherwise>
		</c:choose>
		<li><a href="serviceNotice">공지사항</a></li>
	</ul>
</div>

<div id="content">
	<h2>공지사항</h2>
	<form action="" name="frm">
		<input type="hidden" name="page" id="pageIN" value="${data.snpdto.page}" />
		<input type="hidden" name="noticeindex" id="detailId" />
		
		
		<c:if test="${data.onesfdto.noticecate != null}">
			<input type="hidden" name="noticecate" id="noticeCate" value="${data.onesfdto.noticecate }" />
		</c:if>
		
		
		
		
		<div class="notice_cate">
			<ul>
				<li><a href="serviceNotice" class="
					<c:if test="${empty data.onesfdto.noticecate }">notice_cate_sel</c:if>
				">전체</a></li>
				<li><a href="?noticecate=system" class="
					<c:if test="${data.onesfdto.noticecate =='system' }">notice_cate_sel</c:if>
				">시스템</a></li>
				<li><a href="?noticecate=movie" class="
					<c:if test="${data.onesfdto.noticecate =='movie' }">notice_cate_sel</c:if>
				">영화관</a></li>
				<li><a href="?noticecate=etc" class="
					<c:if test="${data.onesfdto.noticecate =='etc' }">notice_cate_sel</c:if>
				">기타</a></li>
			</ul>
		</div>
		
		<div class="search">
		<a href="serviceNotice" class="search_reset">초기화</a>
			<select name="kind2"  
				<c:if test="${data.onesfdto.noticecate != null }"> class="block_search"</c:if>
			>
				<option value="noticetitle" <c:if test="${data.onesfdto.kind2 == 'noticetitle' }"> selected="selected"</c:if>>제목</option>
				<option value="noticecont" <c:if test="${data.onesfdto.kind2 == 'noticecont' }"> selected="selected"</c:if>>내용</option>
			</select>
			<input type="text" name="schkey" value="${data.onesfdto.schkey }" class="inputText 
				<c:if test="${data.onesfdto.noticecate != null }"> block_search"  placeholder="초기화를 해주세요</c:if>
			" />
			<input type="submit" value="" class="smtGo  
				<c:choose>
				<c:when test="${data.onesfdto.noticecate != null }"> block_search block_inputButton</c:when>
				<c:otherwise> inputButton</c:otherwise>
				</c:choose>
			" />
		</div>
		
		
		
		<div class="search_result">
			<p>총 <span>${data.snpdto.ttt }</span>건이 검색되었습니다.</p>
		</div>
		
		
		
		<div class="notice_tb">
			<!-- 구분 시스템, 영화관, 기타 -->
			<table class="td1">
				<tr>
					<td>번호</td>
					<td>구분</td>
					<td>제목</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>
			<c:forEach items="${data.sfdto }" var="sfDTO" varStatus="no" >
				<tr>
					<td>${sfDTO.noticeindex }</td>
					<td>${sfDTO.noticecateKr }</td>
					<td class="shotcut">
						<a href="javascript:detailGo(${sfDTO.noticeindex })"><span>${sfDTO.noticetitle }</span></a>
					</td>
					<td>					
						<fmt:formatDate value="${sfDTO.noticetime}" type="both" pattern="yyy.MM.dd"/>					
					</td>
					<td>${sfDTO.noticeview }</td>
				</tr>
			</c:forEach>
			
			
			
			
			
			
			
				<tr>
					<td colspan="5" align="center">
					
						<c:if test="${data.snpdto.startPage > 1 }">
							<input type="button" class="btnnn pagebtn pagebtn_lr" dd="${data.snpdto.startPage-1 }" value="&lt" />	
						</c:if>
						
						<c:forEach begin="${data.snpdto.startPage }" end="${data.snpdto.endPage }" step="1" var="i">
							<c:choose>
								<c:when test="${i==data.snpdto.page }">
									<input type="text" class="pagebtn_sel" dd="${i }" value="${i }" readonly/>
								</c:when>
								<c:otherwise>
									<input type="button" class="btnnn pagebtn" dd="${i }" value="${i }" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${data.snpdto.endPage < data.snpdto.total }">
							<input type="button" class="btnnn pagebtn pagebtn_lr" dd="${data.snpdto.endPage+1 }" value="&gt" />
						</c:if>
					
					
					
					</td>
				</tr>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			</table>
		</div>
	</form>
</div>

<div class="clear"></div>
</body>
</html>