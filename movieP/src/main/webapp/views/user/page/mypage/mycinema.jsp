<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<form action ="" method="get" name="qq">
		<input type="hidden" name="detail" id="detail" />
	</form>
<input type="hidden" id="userid" value="${sessionId }" />	
<div class="modal fade" data-backdrop="static" data-keyboard="false" id='inforpurchase2'>
	<div class="modal-dialog">
   		<div class="modal-content"></div>
	</div>
</div>	
<div>
	<div class = "cimemaouter">
		<div>
			<div>${memdata.dto.username }님의 마이페이지 입니다</div>
			<c:choose>
				<c:when test="${memdata.dto.kind == '일반' }">
					<a href="/member/mypage/myinfor">개인정보수정 ></a>
				</c:when>
				<c:when test="${memdata.dto.kind == '네이버' }">
					<a href="/member/mypage/myinforchange">개인정보수정 ></a>
				</c:when>
			</c:choose>
			
		</div>
	</div>

	<div>
		<div class="mycinemaRecordouter">
			<h4>나의 무비스토리</h4>
		</div>
	
		<div class="cimemastory">
			<a href="/member/mypage/mymoviestroy?kind=seemovie">
				<div class="myrecord">
					<div class="recordinner">${memdata.cnt.sc }</div>
					<div class="recordinner">본 영화</div>
				</div>
			</a>
			<a href="/member/mypage/mymoviestroy?kind=writemovie">
				<div class="myrecord">
					<div class="recordinner">${memdata.cnt.wc }</div>
					<div class="recordinner">관람평</div>
				</div>
			</a>
			<a href="/member/mypage/mymoviestroy?kind=likemovie">
				<div class="myrecord">
					<div class="recordinner">${memdata.cnt.lc }</div>
					<div class="recordinner">좋아요</div>
				</div>		
			</a>
		</div>
	</div>

<div>
	<div class="mycinemaRecordouter">
		<h4>나의 예매내역</h4>	
		<div class = "seemore"><a href="/member/mypage/mypurchase">더보기 ></a></div>
	</div>
	<div class="mycinemapuouter">
		<c:forEach items="${memdata.purchase }" var ="pp" end="1" > 
				<div class="writeouter" id="writeouter">
					<a href="/user/movie/moviedetail?sub=info&ind=${pp.m_index }">
						<div class="writeimg">
							<c:choose>
								<c:when test="${pp.imgname!=null }">
									<img src="/moviedata/${pp.imgname }" alt="${pp.movietitle } 이미지" />
								</c:when>
								<c:otherwise>
									이미지 없음
								</c:otherwise>
							</c:choose>
						</div>
					</a>
					<div class="puinfor">
						<div class="sales_time">
							결제일시 : ${pp.sales_time }
						</div>
						<div class="puinforText">
							<span class="saleslink">${pp.saleslink }</span> | ${pp.movietitle }
						</div>
						<div class="puinforText">
							${pp.sectorNo }
						</div>
						<div>
							${pp.starttime }
						</div>
					<div class="purchasespaceButt">
						<button class="changeButt qwer" id="inforpurchase" dd="${pp.salesprice}" cc="${pp.sales_time3 }" tt="${pp.sales_type }" >결제정보</button>
						<c:if test="${pp.checktime > memdata.dto.nowDate }">
						<button class="changeButt" onclick="ticketCancel(${pp.saleslink })">예매취소</button>		
						</c:if>
					</div>
					</div>
				</div>
		</c:forEach>
	</div>	
	</div>
</div>

<div>
	<div class="mycinemaRecordouter" id = "mycinemaQnaouter">
		<h4>나의 문의내역</h4>
		<div class = "seemore"><a href="/member/mypage/myqna">더보기 ></a></div>
	</div>

	<div class="cimeminfor"  id = "mycinemaQnaouter">
		<div id="titleinner">
			<div class="puchaseinner">작성자</div>
			<div class="puchaseinner">제목</div>
			<div class="puchaseinner">작성일</div>
			<div class="puchaseinner">답변일(답변상태)</div>
		</div>
		<c:forEach items="${memdata.qna }" var ="pp" end="1" > 
			<div>
				<div class="puchaseinner">${pp.persid }</div>
				<a class="qnaDetailGo" value="${pp.persindex }" dd="${pp.persindex }" ><div class="puchaseinner">${pp.perstitle }</div></a>
				<div class="puchaseinner">${pp.persqtime }</div>
				<div class="puchaseinner">${pp.persatime }(${pp.persstate })</div>
			</div>
		</c:forEach>
	</div>
</div>


</div>