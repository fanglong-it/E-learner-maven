<!-- Sidebar Start -->
<div class="sidebar mr-3 p-3" style="width: 20%">
    <nav class="navbar bg-light navbar-light">
        <div class="navbar-nav px-3">
            <a href="${pageContext.request.contextPath}/admin" class="navbar-brand mb-3 text-info">
                <i class="fa fa-hashtag me-2"></i>DASHMIN
            </a>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-item nav-link "><i class="fas fa-chart-line me-2"></i>Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/courses" class="nav-item nav-link"><i class="fab fa-product-hunt me-2"></i>Course</a>
            <a href="${pageContext.request.contextPath}/admin/accounts" class="nav-item nav-link"><i class="fas fa-newspaper me-2"></i>Account</a>
            <a href="manager-bad-word" class="nav-item nav-link"><i class="fa-regular fa-text-slash me-2"></i>Manage Bad Words</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                <div class="dropdown-menu bg-transparent border-0">
                    <a href="signin.html" class="dropdown-item">Sign In</a>
                    <a href="signup.html" class="dropdown-item">Sign Up</a>
                    <a href="404.html" class="dropdown-item">404 Error</a>
                    <a href="blank.html" class="dropdown-item">Blank Page</a>
                </div>
            </div>
        </div>
    </nav>
</div>
<!-- Sidebar End -->