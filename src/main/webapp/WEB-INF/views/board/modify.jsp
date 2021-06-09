<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     

<%@include file="../includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
<body>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		
		<div class="panel-heading">
			Board Modify page
		</div>
		
	<form id="form1" action="" method="post">
		<div class="panel-body">
			<div class="form_group">
				<label>bno</label>
				<input class="from-control" id="bno" name='bno' value='${board.bno }' readonly>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="form_group">
				<label>Title</label>
				<input class="from-control" id="title" name='title' value='${board.title }' >
			</div>
		</div>
		
		<div class="panel-body">
			<div class="form_group">
				<label>Content</label>
				<textarea class="form-control" rows="3" id="content" name="content">${board.content }</textarea>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="form_group">
				<label>Writer</label>
				<input class="from-control" name='writer' value='${board.writer }' readonly>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="form_group">
				<label>RegDate</label>
				<input class="from-control" name='regdate' value='<fmt:formatDate pattern="yyyy/MM/dd" value='${board.regdate }' />' readonly>
			</div>
		</div>
		
		
	</form>
		
		<button data-oper='list' class="btn btn-info">List</button>
		<button data-oper='modify' class="btn btn-info">Modify</button>
		<button data-oper='modify2' class="btn btn-danger">Modify2</button>
		<button data-oper='remove' class="btn btn-info">Remove</button>
		<button data-oper='remove2' class="btn btn-danger">Remove2</button>
	
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var form1 = $("#form1");
		
		$("button").on("click", function(e) {
			var oper = $(this).data("oper");
			
			if(oper == 'list') {
				form1.attr("action", "/board/list").submit();
			} else if(oper == 'modify') {
				form1.attr("action", "/board/modify").attr("method", "post").submit();
			} else if(oper == 'remove') {
				form1.attr("action", "/board/remove").attr("method", "post").submit();
			} else if(oper == 'remove2') {
				if(!confirm("삭제 하시겠습니까?")) {
					
					return;
				}
			// var bno = form1.bno.value;
				var bno = $("#bno").val();
				
				$.ajax({
					
					type:"post",
					url:"/board/remove2",
					dataType:"html",
					data:{
						bno : bno
					}
					
				}).done(function(data) {
					if(data == "success") {
						alert("정상 처리 되었습니다.");
						form1.attr("action", "/board/list").submit();
					} else {
						alert("삭제 실패");
					}
					
				});
				
			} else if(oper == "modify2") {
				
				if(!confirm("수정 하시겠습니까?")) {
					
					return;
				}
				
				var bno = $("#bno").val();
				var title = $("#title").val();
				var content = $("#content").val();
				
				console.log("title : " + title);
				console.log("content : " + content);
				
				
				
				if(title == '') {
					alert("제목을 입력해주세요.");
					
					return;
				}
				
				if(content == '') {
					alert("내용을 입력해주세요");
					
					return;
					
				}
				
				$.ajax({
					
					type:"post",
					url:"/board/modify2",
					dataType:"html",
					data:{
						bno : bno,
						title : title,
						content : content
					}
					
				}).done(function(data) {
					if(data == "success") {
						alert("정상 처리 되었습니다.");
						form1.attr("action", "/board/list").submit();
					} else {
						alert("삭제 실패");
					}
					
				});
				
				
			}
			
		});
		
	});
</script>

</body>
</html>

<%@include file="../includes/footer.jsp" %>
