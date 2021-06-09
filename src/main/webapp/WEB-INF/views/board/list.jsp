<%@page import="com.korea.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"
				style="text-align: center; font-weight: 900; color: red;">게
				&nbsp;&nbsp;&nbsp; 시 &nbsp;&nbsp;&nbsp; 판</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel-heading" style="font-size: 20px; color: blue;">
				Board List Page^_^
				
				<select id="gubun">
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
				</select>
				
				<input type="text" id="keyword" />
				<button id="search" class="btn btn-defalut" onclick="fnSearch()">search</button>
				<button id="show" class="btn btn-defalut">show</button>
				<button id="close" class="btn btn-defalut">close</button>
				<button id="regBtn" type="button" class="btn btn-xs pull-right"
					style="font-size: 20px;">Register</button>
			</div>
			<div class="panel-body">
				<div id="tabledata">
				<table class="table table-striped table-bordered table-hovor">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

					<c:choose>
						<c:when test="${list.size()>0 }">
							<c:forEach items="${list }" var="board">
								<tr>
									<td><a href="/board/get?bno=${board.bno }">${board.bno }</a></td>
									<td>${board.title }</td>
									<td>${board.writer }</td>
									<td>${board.regdate2 }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.updateDate }" /></td>
								</tr>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<tr>
								<td colspan="5">검색된 자료가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>

				</table>
				</div>
			</div>
			
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			
		</div>
	</div>
	
	<input type="text" id="temp" value="999" >

<script type="text/javascript">
	
	$(document).ready(function() {
		
		//var result = ${result};
		
		//$("#temp").val(result);
		
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
			
		});
		
		$("#show").on("click", function() {
			
			$("#myModal").modal("show");
			
		});
		
		$("#close").on("click", function() {
			
			$("#myModal").modal("hide");
			
		});
		
	});
	
	function fnSearch() {
		
		var keyword = $("#keyword").val();
		var gubun = $("#gubun").val();
		
		var pageView = "list_table";
		
		if(keyword == '') {
			alert("한글자 이상 검색어를 입력하세요");
			
			return;
			
		}
		
		$.ajax({
			
			type:"post",
			url:"/board/list",
			dataType:"html",
			data:{
				keyword : keyword,
				pageView : pageView,
				gubun : gubun
			}
			
		}).done(function(data) {
		
			$("#tabledata").html("");
			$("#tabledata").html(data);
			
			
			
		});
		
	}
	
</script>


</body>
</html>

<%@ include file="../includes/footer.jsp"%>