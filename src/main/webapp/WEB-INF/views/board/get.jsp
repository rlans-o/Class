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
		<h1 class="page-header">Board Read</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		
		<div class="panel-heading">
			Board Read page
		</div> 
		
		<div class="panel-body">
			<div class="form_group">
				<label>bno</label>
				<input class="from-control" name='bno' value='${board.bno }' readonly>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="form_group">
				<label>Title</label>
				<input class="from-control" name='title' value='${board.title }' readonly>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="form_group">
				<label>Content</label>
				<input class="from-control" name='content' value='${board.content }' readonly>
			</div>
		</div>
		
		<div class="panel-body">
			<div class="form_group">
				<label>Writer</label>
				<input class="from-control" name='writer' value='${board.writer }' readonly>
			</div>
		</div>
		
		<button data-oper='modify' class="btn btn-info">Modify</button>
		<button data-oper='list' class="btn btn-info">List</button>
		
	</div>
</div>

<div class='row'>
	
	<div class="col-lg-12">
		<div class="panel panel-default">
		   <div class="panel-heading">
        		<i class="fa fa-comments fa-fw"></i> Reply
        	<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
      	   </div>    
			
			<div class="panel-body">
				<ul class="chat">
				<c:forEach items="${chat }" var="board">
					<li class="left clearfix" data-rno="1">
						<div>
							<div class="header"><strong>${board.replyer }</strong>
								<small class="pull-right text-muted">${board.replydate }</small>
							</div>
							<p>${board.reply }</p>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
			
		</div>
	</div>

</div>

<form id="operForm" action="/board/modify" method="get">
	<input type="hidden" id="bno" name="bno" value="${board.bno }" /> 
</form>

<script type="text/javascript">
	$(document).ready(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.submit();
		});
		
		$("button[data-oper='list']").on("click", function(e) {
			operForm.attr("action","/board/list").submit();
		});
		
	});
</script>


</body>
</html>

<%@include file="../includes/footer.jsp" %>
