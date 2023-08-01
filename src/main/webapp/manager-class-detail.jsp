<%@ page import="utils.DatetimeUtils"%>
<%@ page import="model.Course"%>
<%@ page import="base.Base"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>HAPPY PROGRAMMING - Admin</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<jsp:include page="components/admin/head.jsp"></jsp:include>
</head>
<%@include file="components/admin/header.jsp"%>
<body>
	<jsp:include page="components/admin/navbar.jsp"></jsp:include>
	<div class="position-relative bg-white d-flex p-0">
		<jsp:include page="components/admin/slidebar.jsp"></jsp:include>
		<!-- Content Start -->
		<div class="content w-100">
			<jsp:include page="components/alert.jsp"></jsp:include>
			<!-- Sale & Revenue Start -->
			<div class="container pt-4 flex-1" style="width: 100%">
				<div class="card w-100">
					<div class="card-body">

						<div class="row">
							<h3>${clazz.className}</h3>
						</div>
						<img class="img-fluid" src="${clazz.image}" />
						<div>
							<h4 class="mb-3">Details</h4>
							<div class="my-3">
								<p>Name: ${clazz.className}</p>
								<p>Max student: ${clazz.maxStudent}</p>
								<p>Status: ${clazz.status}</p>
								<p>Created at: ${clazz.dateCreate}</p>
								<p>
									Teacher: <a href="#">${clazz.account.fullname}</a>
								</p>
								<p>
									Course: <a
										href="${pageContext.request.contextPath}/admin/course-detail?courseId=${clazz.course.id}">${clazz.course.courseName}</a>
								</p>
							</div>
						</div>
						<div class="d-flex">
							<!-- Button trigger modal -->
							<div class="me-2">
								<button type="button" class="btn btn-warning mb-3"
									data-bs-toggle="modal" data-bs-target="#updateCourseModel">
									Update class</button>
								<!-- Modal -->
								<div class="modal fade" id="updateCourseModel" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<form class=""
												action="${pageContext.request.contextPath}/admin/class-detail"
												method="post">
												<input type="hidden" name="classId" value="${clazz.id}" />
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Modal
														title</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label>Class Name</label> <input class="form-control"
															type="text" name="className" value="${clazz.className}">
													</div>
													<div class="form-group">
														<label>Max Student</label> <input class="form-control"
															type="number" name="maxStudent"
															value="${clazz.maxStudent}">
													</div>
													<div class="form-group">
														<label>Image</label> <input class="form-control"
															type="text" name="image" value="${clazz.image}">
													</div>
													<div class="form-group">
														<label>User</label> <select class="form-select"
															name="teacherId">
															<c:forEach var="tea" items="${teachers}">
																<option value="${tea.id}"
																	${tea.id==clazz.account.id ? 'selected': ''}>${tea.fullname}-${tea.username}</option>
															</c:forEach>
														</select>
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
							</div>
							<div>
								<a class="btn btn-danger"
									href="${pageContext.request.contextPath}/admin/delete-class?classId=${clazz.id}">Delete
									class</a>
							</div>
						</div>
					</div>
					<div class="row align-content-center">
						<div class="">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Full Name</th>
										<th scope="col">Request time</th>
										<th scope="col">Status</th>
										<th scope="col" style="width: 10%">Reason</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="registration" items="${registrations}"
										varStatus="counter">
										<tr>
											<th scope="row">${counter.count}</th>
											<td>${registration.account.fullname}</td>
											<td>${registration.requestDate}</td>
											<td><span class="badge bg-primary">${registration.requestStatus}</span>
											</td>
											<td class="text-nowrap">${registration.reason}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Sales Chart End -->

	</div>
	</div>
	<jsp:include page="components/admin/footer.jsp"></jsp:include>
</body>
</html>