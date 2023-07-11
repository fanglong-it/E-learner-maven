<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="fu.swp.model.Account"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="css/profile.css" rel="stylesheet" type="text/css" />
<title>Profile Teacher</title>
</head>
<jsp:include page="components/header.jsp"></jsp:include>
<body>
	<jsp:include page="components/navBarComponent.jsp"></jsp:include>

	<div class="container">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">

					<div class="row">
						<div class="col-sm-5">
							<div class="row">
								<div id="avatar"
									class="rounded d-flex justify-content-center align-items-center">
									<img id="img" class="rounded-circle" src="images/${acc.avatar}"
										alt="Avatar" width="200" height="200">
								</div>
							</div>
						</div>
						<div class="col-sm-7">
							<form action="profile" class="form-control m-1 bg-white"
								method="POST" onsubmit="" enctype="multipart/form-data">
								<h3>Teacher Profile</h3>
								<c:if test="${isNoti != null}">
									<span>Profile has been changed successfully!</span>
								</c:if>
								<div class="col-sm-12">
									<label for="fullname" class="font-weight-bold">Full
										name</label> <input class="form-control" id="fullname" type="text"
										readonly="" name="fullname" value="${acc.fullname}" required />
									<input class="form-control" id="fullname" type="hidden"
										name="accountId" value="${acc.id}" />

								</div>
								<div class="col-sm-12">
									<label for="fullname" class="font-weight-bold">Phone</label> <input
										class="form-control" type="tel" readonly="" name="phone"
										value="${acc.phone}" required />
								</div>
								<div class="col-sm-12">
									<label for="fullname" class="font-weight-bold">Email</label> <input
										class="form-control" type="text" name="email" readonly=""
										value="${acc.email}" disabled="disabled" />
								</div>
								<div class="col-sm-12 mt-3">
									<label for="fullname" class="font-weight-bold">Address</label>
									<input class="form-control" readonly="" type="text"
										name="address" value="${acc.address}" />
								</div>
								<div class="row p-3"></div>
							</form>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">

							<div class="card">
								<div class="card-body">
									<section>
										<div class="my-5 py-5">
											<div class="row d-flex justify-content-center">
												<div class="col-md-12 col-lg-10 col-xl-8">
													<div class="card">

														<c:if test="${requestScope.ERROR != null }">
															<p class="text-danger">${requestScope.ERROR}</p>
														</c:if>

														<c:if test="${requestScope.feedbacks.size()<= 0}">
															<div class="card">
																<p class="mt-3 mb-4 pb-2">Not have any feedback</p>
															</div>
														</c:if>
														<c:forEach var="feed" items="${requestScope.feedbacks}">
															<div class="card-body">
																<div class="d-flex flex-start align-items-center">
																	<img class="rounded-circle shadow-1-strong me-3"
																		src="img/${feed.userId.avatar}" alt="avatar"
																		width="60" height="60" />
																	<div>
																		<h6 class="fw-bold text-primary mb-1">${feed.userId.fullname}</h6>
																		<p class="text-muted small mb-0">${feed.date}</p>
																	</div>
																</div>
																<p class="mt-3 mb-4 pb-2">${feed.content}</p>
															</div>
														</c:forEach>

														<c:if test="${sessionScope.account != null}">
															<form class="" action="feedback" method="post"
																accept-charset="UTF-8">
																<div class="card-footer py-3 border-0"
																	style="background-color: #f8f9fa;">

																	<div class="d-flex flex-start w-100">
																		<img class="rounded-circle shadow-1-strong me-3"
																			src="img/${sessionScope.account.avatar }"
																			alt="avatar" width="40" height="40" />

																		<div class="form-outline w-100">
																			<div class="form-group">
																				<label>Stars</label> <select name="star"
																					class="form-select">
																					<option value="1">1</option>
																					<option value="2">2</option>
																					<option value="3">3</option>
																					<option value="4">4</option>
																					<option value="5">5</option>
																				</select>
																			</div>
																			<label class="form-label" for="textAreaExample">Message</label>
																			<textarea name="message" class="form-control"
																				id="textAreaExample" rows="4"
																				style="background: #fff;"></textarea>
																		</div>
																		<input type="hidden" name="teacherId"
																			value="${acc.id}">
																	</div>

																	<div class="float-end mt-2 pt-1">
																		<button type="submit" class="btn btn-primary btn-sm">Post
																			comment</button>
																		<button type="button"
																			class="btn btn-outline-primary btn-sm">Cancel</button>
																	</div>
																</div>
															</form>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</section>

								</div>
							</div>


						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="components/footer.jsp"></jsp:include>
</html>