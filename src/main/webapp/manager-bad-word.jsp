<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10-07-2023
  Time: 11:36 SA
  To change this template use File | Settings | File Templates.
--%>
<%--
    Document   : Home
    Created on : May 23, 2022, 10:15:28 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>All Bad Word</title>
</head>
<jsp:include page="components/header.jsp"></jsp:include>
<body id="page-top">
	<jsp:include page="components/admin/navbar.jsp"></jsp:include>
	<div class="position-relative bg-white d-flex p-0">
		<jsp:include page="components/admin/slidebar.jsp"></jsp:include>
		<div class="content">
			<div class="container">
				<div class="col-sm-3">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal">
						Add Bad Word</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<form action="manager-bad-word" method="post">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Add Bad
											Word</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label for="lessonName">Bad Word</label> <input type="text"
												class="form-control" value="" min="5" id="lessonName"
												name="txtBadWord">
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Add</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Declare</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${requestScope.badwords}">
							<form method="GET" action="manager-bad-word">
								<tr>

									<td><input type="hidden" name="id" value="${c.id}">
										<input type="text" name="editBadword" value="${c.badWord}">
									</td>

									<td>
										<button class="btn btn-primary">Edit</button> <a
										class="btn btn-success" href="manager-bad-word?id=${c.id}">Delete</a>
									</td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>


<jsp:include page="components/footer.jsp"></jsp:include>
</html>
