<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(document).ready(function() {

		$(".btn1").click(function() {
			const togo = $(this).val()
			location.replace("/admin/" + togo + "/list");
		})
		$(".menugobtn").click(function() {
			const togo = $(this).val()
			location.replace("/admin/" + togo );
		})

	})
   $(document).ready(function () { //
        $("#admin").click(function() {location.replace("/admin");
       })
   })	
</script>



	<div class="d-flex flex-column flex-md-row align-items-center px-20 px-md-10 mb-6 bg-white border-bottom box-shadow">
	<nav class="mx-auto">
		<button type="button" id="admin" class="btn btn-success menugobtn">메인</button>
		<button id="pageedit" value="pageedit/banner" type="button" class="btn btn-success menugobtn">홈페이지설정</button>
		<button id="movietime" value="movietime/list" type="button" class="btn btn-success menugobtn">상영시간표관리</button>
		<button id="persqna" value="persqna/persqnanew" type="button" class="btn btn-success menugobtn">고객문의처리</button>
		<button id="sales" value="sales/main" type="button" class="btn btn-success menugobtn">매출/정산</button>
	</nav>

	<a class="btn btn-outline-primary" href="/adminlogout">로그아웃</a>

	</div>
