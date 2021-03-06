<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<form action="" method="post" enctype="multipart/form-data" name="frm" >

<input type="hidden" id="userid" value="${sessionId }"/>
<input type="hidden" id="userpw" value="${memdata.dto.userpw }"/>
<input type="hidden" id="userpnum" value="${memdata.dto.userpnumM }"/>
 
 <div class="modal fade" data-backdrop="static" data-keyboard="false" id='inforDelete1'>
    <div class="modal-dialog">
    <div class="modal-content"></div>
 	</div>
 </div>
 
 <div class="modal fade" data-backdrop="static" data-keyboard="false" id='changePnum1'>
    <div class="modal-dialog">
    <div class="modal-content"></div>
 	</div>
 </div>
 
<h2>개인정보 수정</h2>
	<div class = "idouter">
		<div class = "nameouter">아이디</div>
		<div>
			<c:if test="${memdata.dto.kind == '일반' }">
				<div class = "dataouter">${sessionId }(가입일 : ${memdata.dto.joindayM })</div>
				<input type="button" class="changeButt" id="inforDelete" value="회원탈퇴" data-target="#inforDelete1"/>
			</c:if>
			<c:if test="${memdata.dto.kind == '네이버' }">
				<div class = "dataouter"><small>${sessionId }</small>(가입일 : ${memdata.dto.joindayM })</div>
				<input type="button" class="changeButt" id="inforDeleteNaver" value="회원탈퇴" />
			</c:if>
		</div>
	</div>
	
	<h3>기본정보</h3>
	<div class = "changeouter">
		<div class = "mideouter">
			<div class = "nameouter">이름</div>
			<div>
				<div class = "dataouter">${memdata.dto.username }</div>
			</div>
		</div>
		
		<div class = "mideouter">
			<div class = "nameouter">생년월일</div>
			<div>
				<div class = "dataouter">${memdata.dto.userbirthM }</div>
			</div>
		</div>
		
		
		<div class = "mideouter" id ="pumMidouter">
			<div class = "nameouter" id ="pumnameouter" >휴대폰</div>
			<div>
				<div class = "dataouter" id="pnumouter">${memdata.dto.userpnumM }</div>
				<div class="emailouter">
					<input type="button" class="changeButt topB" id="pumnchangGo" value="휴대폰번호 변경"/>
					<span class="spanMM"></span>
				</div>
			</div>
		</div>
		
		
		<div class = "mideouter">
			<div class = "nameouter">이메일</div>
			<div class="emailouter"><input type="text" id="useremail" value="${memdata.dto.useremail }" /></div>
		</div>
			
		<div class = "mideouter">
			<div class = "nameouter">비밀번호</div>	
			<div class="emailouter">
				<c:choose>
					<c:when test="${memdata.dto.kind == '일반' }">
						<input type="button" class="changeButt" id="changepw" value="비밀번호 변경" />
					</c:when>
					<c:when test="${memdata.dto.kind == '네이버' }">
						<input type="button" class="changeButt" id="changepw" disabled="disabled" value="비밀번호 변경" />
						<p class = "naverMess">네이버로그인 비밀번호 변경 불가.</p>
					</c:when>
				</c:choose>
			
			</div>
		</div>
	</div>
	
	<div>
		<input type="button" id="mainGo" value="취소"/>
		<input type="button" id="informodifyGo" value="등록"/>
	</div>
</form>