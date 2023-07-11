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
<title>All Class</title>
</head>
<jsp:include page="components/header.jsp"></jsp:include>
<body id="page-top">
	<jsp:include page="components/navBarComponent.jsp"></jsp:include>
	<div class="container">
		<h1>Manage Class</h1>
		<div class="row align-content-center">
			<div class="">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">className</th>
							<th scope="col">maxStudent</th>
							<th scope="col">Image</th>
							<th scope="col">User</th>
							<th scope="col">dateCreate</th>
							<th scope="col">Image</th>
							<th scope="col">Status</th>
							<th scope="col">Course</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${requestScope.classes}"
							varStatus="counter">
							<tr>
								<th scope="row">${counter.count}</th>
								<td>${c.className}</td>
								<td>${c.maxStudent}</td>
								<td>${c.image}</td>
								<td>${c.account.fullname}</td>
								<td>${c.dateCreate}</td>
								<td>${c.image}</td>
								<td>${c.status}</td>
								<td>${c.course.courseName}</td>
								<td>
									<button type="button" class="btn btn-primary mb-3"
										data-bs-toggle="modal"
										data-bs-target="#updateCourseModel-${counter.count}">
										Update class</button> <!-- Modal --> 
										
									<a class="btn btn-warning mb-3"
										href="view-request?classId=${c.id}">View Request</a>

									<div class="modal fade" id="updateCourseModel-${counter.count}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<form class=""
													action="${pageContext.request.contextPath}/teacher/class-detail"
													method="post">
													<input type="hidden" name="classId" value="${c.id}" />
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Modal
															title</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="form-group">
															<label>Class Name</label> <input class="form-control"
																type="text" name="className" value="${c.className}">
														</div>
														<div class="form-group">
															<label>Max Student</label> <input class="form-control"
																type="number" name="maxStudent"
																value="${c.maxStudent}">
														</div>
														<div class="form-group">
															<label>Image</label> <input class="form-control"
																type="text" name="image" value="${c.image}">
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Save
															changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


	</div>

</body>


<jsp:include page="components/footer.jsp"></jsp:include>
</html>
