<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dongle&family=Gowun+Dodum&family=Nanum+Pen+Script&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Insert title here</title>
<style type="text/css">
label {
	font-size: 11pt;
}
</style>

<script type="text/javascript">
	$(function() {
		//아이디 중복체크

		$("#btnIdCheck").click(function() {

			//id읽기
			var id = $("#id").val();
			alert(id);
			$.ajax({
				type : "get",
				url : "member/idCheck.jsp",
				dataType : "json",
				data : {
					"id" : id
				},
				success : function(res) {
					if (res.count == 1) {
				
						Swal.fire({
							  position: "center",
							  icon: "error",
							  title: "중복 아이디가 존재합니다.",
							  showConfirmButton: true,
							  
							});
						
					} else {
						Swal.fire({
							  position: "center",
							  icon: "success",
							  title: "ok!",
							  showConfirmButton: true,
							 
							});
					
					}
				}
			});
		});

		//위치가 중요해!!!! 
		//$(function(){})안에 있어야 하는데 밖에 있었다.
		//이메일 선택 이벤트
		$("#selemail").change(function() {

			if ($(this).val() == '-') {
				$("#email2").val('');
			} else {
				$("#email2").val($(this).val());
			}
		})
	})

	function check(f) {
		if (f.pass.value != f.pass2.value) {
			alert("비밀번호가 서로 다릅니다.");
			//초기화
			f.pass.value = "";
			f.pass2.value = "";

			return false; //액션호출하지 않는다.
		}
	}
</script>




</head>
<body>
	<div style="margin: 0 auto; width: 320px; border: 1px solid pink;">
		<form action="member/addaction.jsp" method="post"
			onsubmit="return check(this)">

			<h3 align="center">
				<strong>KyotoInside</strong> 회원가입
				<h3>
					<label for="id">아이디</label><br>
					<div class="d-inline-flex">
						<input type="text" name="id" id="id" maxlength="8"
							class="form-control" required="required"
							style="width: 200px; background-color: #eeeeee;">
						<button type="button" class="btn btn-warning" id="btnIdCheck"
							style="width: 105px; margin-left: 10px; background-color: #F8BBD0; border-color: #F8BBD0; color: white;">중복체크</button>
						<span class="idsuccess" style="color: blue; margin-left: 10px;"></span>

					</div>
					<br> <label for="pass">비밀번호</label><br>

					<div class="d-inline-flex">
						<input type="password" name="pass" class="form-control"
							required="required"
							style="width: 150px; background-color: #eeeeee;"
							placeholder="비밀번호"> <input type="password" name="pass2"
							class="form-control" required="required"
							style="width: 150px; margin-left: 15px; background-color: #eeeeee;"
							placeholder="비밀번호 확인">
					</div>
					<br> <label for="name">이름</label> <input type="text"
						name="name" class="form-control" required="required"
						style="width: 315px; background-color: #eeeeee;"> <label
						for="hp">핸드폰</label> <input type="text" name="hp"
						class="form-control" required="required"
						style="width: 315px; background-color: #eeeeee;"> <label
						for="addr">주소</label> <input type="text" name="addr"
						class="form-control" required="required"
						style="width: 315px; background-color: #eeeeee;"> <label
						for="email">이메일</label><br>
					<div class="d-inline-flex">
						<input type="text" name="email1" class="form-control"
							required="required"
							style="width: 90px; background-color: #eeeeee;">&nbsp;<label>@</label>&nbsp;

						<input type="text" name="email2" id="email2" class="form-control"
							required="required"
							style="width: 90px; background-color: #eeeeee;"> <select
							id="selemail" class="form-control"
							style="margin-left: 10px; background-color: #eeeeee; width: 90px;">
							<option value="-">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="nate.com">네이트</option>
							<option value="daum.net">다음</option>
						</select>
					</div>


					<br>
					<br>

					<div align="center">
						<button type="submit" class="btn btn-info"
							style="background-color: pink; border: pink; color: white;">저장하기</button>
						<button type="reset" class="btn btn-info"
							style="background-color: pink; border: pink; color: white;">초기화</button>
					</div>
		</form>
	</div>
</body>
</html>