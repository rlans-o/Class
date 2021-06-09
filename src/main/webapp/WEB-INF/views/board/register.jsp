<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Register</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">

			<div class="panel-heading">Board Register page</div>

			<form id="form1" action="/board/register" method="post">
				<div class="panel-body">
					<div class="form_group">
						<label>Title</label> <input class="from-control" id="title"
							name='title' value=''>
					</div>
				</div>

				<div class="panel-body">
					<div class="form_group">
						<label>Content</label>
						<textarea class="from-control" rows="3" id="content"
							name='content'></textarea>
					</div>
				</div>

				<div class="panel-body">
					<div class="form_group">
						<label>Writer</label> <input class="from-control" id="writer"
							name='writer' value=''>
					</div>
				</div>

			</form>

			<button type="submit" class="btn btn-default">Submit Button</button>
			<button type="reset" class="btn btn-default">Reset Button</button>
			<button type="button" class="btn btn-default" data-oper="list">List
				Button</button>
			<button type="button" class="btn btn-default" data-oper="insert">insert</button>

		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.submit();
		});
		
		var form1 = $("#form1");
		
		$("button[data-oper='insert']").on("click", function(e) {
			
			if(!confirm("등록 하시겠습니까?")) {
				
				return;
			}
			
				var title = $("#title").val();
				var content = $("#content").val();
				var writer = $("#writer").val();
			
				if(title == '') {
					alert("제목을 입력해주세요.");
					
					return;
				}
				
				if(content == '') {
					alert("내용을 입력해주세요");
					
					return;
					
				}
				
				if(writer == '') {
					alert("등록자을 입력해주세요");
					
					return;
					
				}
				
			$.ajax({
					
					type:"post",
					url:"/board/register2",
					dataType:"html",
					data:{
						title : title,
						content : content,
						writer : writer
					}
					
				}).done(function(data) {
					if(data == "success") {
						alert("정상 처리 되었습니다.");
						form1.attr("action", "/board/list").submit();
					} else {
						alert("삭제 실패");
					}
					
				});
				
	});

});
</script>


</body>
</html>

<%@include file="../includes/footer.jsp"%>
