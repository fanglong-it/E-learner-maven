

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navbar Start -->
<style>
/* CSS */
@
keyframes ringing { 0%, 100% {
	transform: rotate(0);
	color: red;
	/* Set the color to red at the start and end of the animation */
}

50
%
{
transform
:
rotate(
15deg
);
color
:
inherit;
	/* Set the color to the default color (inherit) at the middle of the animation */
}
}
.bell-icon {
	animation-name: ringing;
	animation-duration: 1s;
	animation-timing-function: ease-in-out;
	animation-iteration-count: infinite;
}

.long-text-item {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 400px;
	/* You can adjust this value based on your preference */
}
</style>
<nav
	class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
	<a href="index.html"
		class="navbar-brand d-flex align-items-center px-4 px-lg-5">
		<h2 class="m-0 text-primary">
			<img
				src="https://i.chungta.vn/2017/12/22/LogoFPT-2017-copy-3042-1513928399.jpg"
				width="50px" height="50px" alt="alt" />Happy Learning
		</h2>
	</a>
	<button type="button" class="navbar-toggler me-4"
		data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<div class="navbar-nav ms-auto p-4 p-lg-0">
			<a href="HomeController" class="nav-item nav-link">Home</a> <a
				href="about.jsp" class="nav-item nav-link">About</a> <a
				href="list-course?courseName=" class="nav-item nav-link">Courses</a>
			<c:choose>
				<c:when test="${sessionScope.account != null}">
					<c:if test="${sessionScope.account.role.role_name == 'ADMIN'}">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">Manager</a>
							<div class="dropdown-menu fade-down m-0">
								<a href="admin/courses" class="dropdown-item">MANAGE COURSE</a>
								<a href="admin/classes" class="dropdown-item">MANAGE CLASS</a>
							</div>
						</div>
					</c:if>

					<%-- <c:if test="${sessionScope.account.role.role_name == 'TEACHER'}">
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">Manager</a>
							<div class="dropdown-menu fade-down m-0">
								<a href="manager-class" class="dropdown-item">View class</a>
							</div>
						</div>
					</c:if> --%>


					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fas fa-bell bell-icon"></i>
						</a>
						<div class="dropdown-menu fade-down m-0">
							<c:choose>
								<c:when test="${sessionScope.notifications.size() > 0}">
									<c:forEach var="noti" items="${sessionScope.notifications}">
										<a href="request-history"
											class="dropdown-item mr-5 long-text-item">${noti.content}</a>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<a href="#" class="dropdown-item">Not have any
										Notification!</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">Your Class</a>
						<div class="dropdown-menu fade-down m-0">
							<c:if test="${sessionScope.account.role.role_name == 'TEACHER'}">
								<a href="manager-class" class="dropdown-item">View class</a>
								<a href="manager-course" class="dropdown-item">View course</a>
							</c:if>
							<a href="view-group-chat" class="dropdown-item">View group
								chat</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>
			<div class="d-flex" style="margin-left: 10px">
				<c:choose>
					<c:when test="${sessionScope.account != null}">
						<div class="dropdown">
							<button class="btn btn-outline-light dropdown-toggle text-dark"
								type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
								aria-expanded="false">
								${sessionScope.account.username} <img width="50px" height="50px"
									src="images/${sessionScope.account.avatar}" alt="alt" />
							</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/profile">Information</a></li>

								<c:if test="${sessionScope.account.role.role_name == 'STUDENT'}">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath}/request-history">History</a></li>
								</c:if>
								<li><a class="dropdown-item bg-danger"
									href="${pageContext.request.contextPath}/Logout">Logout</a></li>
							</ul>
						</div>

					</c:when>
					<c:otherwise>
						<a class="btn btn-primary py-4 px-lg-5 d-none d-lg-block"
							href="Login">Join Now</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>

<!-- Navbar End -->



