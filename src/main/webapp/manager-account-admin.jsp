
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DASHMIN - Admin</title>
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
		<div class="content">

			<!-- Sale & Revenue Start -->
			<div class="container pt-4 ">
				<div class="row">
					<h3>Manager Account</h3>
				</div>
				<div class="row">
					<div class="card">
						<div class="card-body">
							<div class="text-center mt-3 mb-3">
								<form class="form-group" method="get"
									action="${pageContext.request.contextPath}/admin/manager-account">
									<div class="row">
										<div class="col-8">
											<div class="col-sm-12">
												<label for="courseName" style="float: left"
													class="font-weight-bold">Search teacher name</label> <input
													id="courseName" class="form-control" type="text"
													name="name" value="${param.name}" />
											</div>
											<div class="col-sm-12">
												<label for="courseName" style="float: left"
													class="font-weight-bold">Role</label> <select name="role"
													class="form-control">
													<c:if test="${param.role != ''}">
														<option value="${param.role}" selected="selected">${param.role}</option>													
													</c:if>
													<option value="">All</option>
													<option value="STUDENT">Student</option>
													<option value="TEACHER">Teacher</option>
												</select>
											</div>

										</div>
										<div class="col-4">
											<div class="col-sm-12 mb-3 mt-4">
												<button class="btn btn-primary animated" type="submit">Search</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#createModal">
									Create Account</button>

								<!-- Modal -->
								<div class="modal fade" id="createModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<form
												action="${pageContext.request.contextPath}/admin/manager-account"
												enctype="multipart/form-data" method="post">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Update
														account</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<input type="hidden" name="accountId" value="0"
															class="form-control">
													</div>
													<div class="form-group">
														<label class="form-label">username</label> <input
															type="text" name="username" value="" class="form-control"
															required="required">
													</div>
													<div class="form-group">
														<label class="form-label">password</label> <input
															type="text" name="password" value="123456"
															readonly="readonly" class="form-control"
															required="required">
													</div>
													<div class="form-group">
														<label class="form-label">email</label> <input type="text"
															name="email" value="" class="form-control"
															required="required">
													</div>
													<div class="form-group">
														<label class="form-label">phone</label> <input type="text"
															name="phone" value="" class="form-control"
															required="required">
													</div>
													<div class="form-group">
														<label class="form-label">fullname</label> <input
															type="text" name="fullname" value="" class="form-control"
															required="required">
													</div>
													<div class="form-group">
														<label class="form-label">address</label> <input
															type="text" name="address" value="" class="form-control"
															required="required">
													</div>
													<div class="form-group">
														<label class="form-label">image</label> <input type="file"
															name="photo" value="" class="form-control"
															required="required">
													</div>
													<div class="form-group">
														<label class="form-label">Status</label> <select
															class="form-select" name="status" required="required">
															<option value="1" selected="selected">Active</option>
															<option value="0">In Active</option>
														</select>
													</div>
													<div class="form-group">
														<label class="form-label">Role</label> <select
															class="form-select" name="role">
															<option value="${c.role.role_name}" selected="selected">${c.role.role_name}</option>
															<c:forEach var="role" items="${sessionScope.roles}">
																<option value="${role}">${role}</option>
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
							<div class="row align-content-center">
								<div class="">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">username</th>
												<th scope="col">status</th>
												<th scope="col">email</th>
												<th scope="col">phone</th>
												<th scope="col">fullname</th>
												<th scope="col">address</th>
												<th scope="col">avatar</th>
												<th scope="col">role</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="c" items="${requestScope.accounts}"
												varStatus="counter">
												<tr>
													<th scope="row">${counter.count}</th>
													<td>${c.username}</td>
													<td><c:if test="${c.status == 1}">
															<p class="text-success">Active</p>
														</c:if> <c:if test="${c.status == 0}">
															<p class="text-danger">Inactive</p>
														</c:if></td>
													<td>${c.email}</td>
													<td>${c.phone}</td>
													<td>${c.fullname}</td>
													<td>${c.address}</td>
													<td>${c.avatar}</td>
													<td>${c.role.role_name}</td>
													<td>
														<div class="form-group">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-primary"
																data-bs-toggle="modal"
																data-bs-target="#exampleModal-${counter.count}">
																Update</button>

															<!-- Modal -->
															<div class="modal fade"
																id="exampleModal-${counter.count}" tabindex="-1"
																aria-labelledby="exampleModalLabel" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<form
																			action="${pageContext.request.contextPath}/admin/manager-account"
																			enctype="multipart/form-data" method="post">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">Update
																					account</h5>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal" aria-label="Close"></button>
																			</div>
																			<div class="modal-body">
																				<div class="form-group">
																					<label class="form-label">Id</label> <input
																						type="text" name="accountId" value="${c.id}"
																						class="form-control">
																				</div>
																				<div class="form-group">
																					<label class="form-label">username</label> <input
																						type="text" name="username" readonly="readonly"
																						value="${c.username}" class="form-control">
																				</div>
																				<div class="form-group">
																					<label class="form-label">email</label> <input
																						type="text" name="email" value="${c.email}"
																						class="form-control">
																				</div>
																				<div class="form-group">
																					<label class="form-label">phone</label> <input
																						type="text" name="phone" value="${c.phone}"
																						class="form-control">
																				</div>
																				<div class="form-group">
																					<label class="form-label">fullname</label> <input
																						type="text" name="fullname" value="${c.fullname}"
																						class="form-control">
																				</div>
																				<div class="form-group">
																					<label class="form-label">address</label> <input
																						type="text" name="address" value="${c.address}"
																						class="form-control">
																				</div>
																				<div class="form-group">
																					<label class="form-label">image</label> <input
																						type="file" name="photo" value="${c.avatar}"
																						class="form-control">
																				</div>
																				<div class="form-group">
																					<label class="form-label">Status</label> <select
																						class="form-select" name="status">
																						<option value="1" selected="selected">Active</option>
																						<option value="0">In Active</option>
																					</select>
																				</div>
																				<div class="form-group">
																					<label class="form-label">Role</label> <select
																						class="form-select" name="role">
																						<option value="${c.role.role_name}"
																							selected="selected">${c.role.role_name}</option>
																						<c:forEach var="role"
																							items="${sessionScope.roles}">
																							<option value="${role}">${role}</option>
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
														</div> <c:choose>
															<c:when test="${c.status == 1}">
																<a class="btn btn-danger"
																	href="${pageContext.request.contextPath}/admin/delete-account?accountId=${c.id}&status=0">Inactive</a>
															</c:when>
															<c:otherwise>
																<a class="btn btn-success"
																	href="${pageContext.request.contextPath}/admin/delete-account?accountId=${c.id}&status=1">Active</a>
															</c:otherwise>
														</c:choose>

														<div class="form-group"></div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:set var="pagination_url"
										value="${pageContext.request.contextPath}/admin/manager-account?"
										scope="request"></c:set>
									<div class="text-center mt-5">
										<nav class="text-center" aria-label="Page navigation example">
											<c:choose>
												<c:when test="${requestScope.paging.getTotalPage() < 2}">
													<nav aria-label="Page navigation example"
														class="d-flex justify-content-center">
														<ul class="pagination">
															<c:forEach begin="1"
																end="${requestScope.paging.getTotalPage()}" var="i">
																<li class="page-item ${i == requestScope.paging.page?"active":""}"><a
																	class="page-link"
																	href="${pagination_url}page=${i}&name=${param.name}&role=${param.role}">${i}</a></li>
															</c:forEach>
														</ul>
													</nav>
												</c:when>
												<c:when test="${requestScope.paging.page < 2}">
													<nav aria-label="Page navigation example"
														class="d-flex justify-content-center">
														<ul class="pagination">
															<c:forEach begin="1"
																end="${requestScope.paging.getTotalPage()}" var="i">
																<li class="page-item ${i == requestScope.paging.page?"active":""}"><a
																	class="page-link"
																	href="${pagination_url}page=${i}&name=${param.name}&role=${param.role}">${i}</a></li>
															</c:forEach>
															<li class="page-item"><a class="page-link"
																href="${pagination_url}page=${requestScope.paging.page+1}&name=${param.name}&role=${param.role}">Next</a></li>
														</ul>
													</nav>
												</c:when>
												<c:when
													test="${requestScope.paging.page+1 > requestScope.paging.getTotalPage()}">
													<nav aria-label="Page navigation example"
														class="d-flex justify-content-center">
														<ul class="pagination">
															<li class="page-item"><a class="page-link"
																href="${pagination_url}page=${requestScope.paging.page-1}&name=${param.name}&role=${param.role}">Previous</a></li>
															<c:forEach begin="1"
																end="${requestScope.paging.getTotalPage()}" var="i">
																<li class="page-item ${i == requestScope.paging.page?"active":""}"><a
																	class="page-link"
																	href="${pagination_url}page=${i}&name=${param.name}&role=${param.role}">${i}</a></li>
															</c:forEach>
														</ul>
													</nav>
												</c:when>
												<c:otherwise>
													<nav aria-label="Page navigation example"
														class="d-flex justify-content-center">
														<ul class="pagination">
															<li class="page-item"><a class="page-link"
																href="${pagination_url}page=${requestScope.paging.page-1}&name=${param.name}&role=${param.role}">Previous</a></li>
															<c:forEach begin="1"
																end="${requestScope.paging.getTotalPage()}" var="i">
																<li class="page-item ${i == requestScope.paging.page?"active":""}"><a
																	class="page-link"
																	href="${pagination_url}page=${i}&name=${param.name}&role=${param.role}">${i}</a></li>
															</c:forEach>
															<li class="page-item"><a class="page-link"
																href="${pagination_url}page=${requestScope.paging.page+1}&name=${param.name}&role=${param.role}">Next</a></li>
														</ul>
													</nav>
												</c:otherwise>
											</c:choose>
										</nav>
									</div>
								</div>
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