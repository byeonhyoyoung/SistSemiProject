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
<title>Insert title here</title>
<style type="text/css">

label{
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
						$("span.idsuccess").text("not ok!!");
					} else {
						$("span.idsuccess").text("ok!!");
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
	<div style="margin: 0 auto; width: 350px;">
		<form action="member/addaction.jsp" method="post"
			onsubmit="return check(this)">

			<h3>
				<strong>KyotoInside<strong> 회원가입
						<h3>
							<label for="id">아이디</label><br>
							<div class="d-inline-flex">
								<input type="text" name="id" id="id" maxlength="8"
									class="form-control" required="required" style="width: 120px; background-color: #eeeeee;">
								<button type="button" class="btn btn-warning" id="btnIdCheck"
									style="margin-left: 10px; background-color: #F8BBD0; border-color: #F8BBD0; color: white;">중복체크</button>
								<span class="idsuccess" style="color: blue; margin-left: 10px;"></span>

							</div>
							<br>
							<label for="pass">비밀번호</label><br>
							
							<div class="d-inline-flex">
								<input type="password" name="pass" class="form-control"
									required="required" style="width: 120px; background-color: #eeeeee;" placeholder="비밀번호">
								<input type="password" name="pass2" class="form-control"
									required="required" style="width: 150px; margin-left: 5px;background-color: #eeeeee;"
									placeholder="비밀번호 확인">
							</div>
							<br>
							<label for="name">이름</label>
							<input type="text" name="name" class="form-control"
								required="required" style="width: 120px; background-color: #eeeeee;">


							<label for="hp">핸드폰</label>
							<input type="text" name="hp" class="form-control"
								required="required" style="width: 120px;">
							<label for="addr">주소</label>
							<input type="text" name="addr" class="form-control"
								required="required" style="width: 120px;">
							<label for="email">이메일</label>
							<div class="d-inline-flex">
								<input type="text" name="email1" class="form-control"
									required="required" style="width: 80px; background-color: #eeeeee;"> <b
									style="margin-left: 10px; margin-right: 10px;">@</b> <input
									type="text" name="email2" id="email2" class="form-control"
									required="required" style="width: 80px;"> <select
									id="selemail" class="form-control" style="margin-left: 10px; background-color: #eeeeee;">
									<option value="-">직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="gmail.com">구글</option>
									<option value="nate.com">네이트</option>
									<option value="daum.net">다음</option>
								</select>
							</div>

							<div>
								<button type="submit" class="btn btn-outline-info"
									style="background-color: #EEEEEE; border-color: #EEEEEE;">저장하기</button>
								<button type="reset" class="btn btn-outline-info"
									style="background-color: #EEEEEE; border-color: #EEEEEE;">초기화</button>



							</div>
		</form>
	</div>
</body>
</html>