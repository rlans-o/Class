<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
