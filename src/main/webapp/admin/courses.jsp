<%-- 
    Document   : CilentPage
    Created on : May 11, 2023, 1:01:06 AM
    Author     : toden
--%>


<%-- 
    Document   : CilentPage
    Created on : May 11, 2023, 1:01:06 AM
    Author     : toden
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Admin</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <jsp:include page="../components/admin/head.jsp"></jsp:include>
        </head>
    <%@include file="../components/admin/header.jsp" %>
    <body>
        <jsp:include page="../components/admin/navbar.jsp"></jsp:include>
            <div class="position-relative bg-white d-flex">
            <jsp:include page="../components/admin/slidebar.jsp"></jsp:include>
                <!-- Content Start -->
                <div class="content w-100" style="width: 90%;">
                    <jsp:include page="../components/alert.jsp"></jsp:include>
                    <!-- Sale & Revenue Start -->
                    <div class="container px-3" style="">
                        <div class="row d-flex justify-content-between">
                            <h3 class="mb-3">Manager Course</h3>
                            <button type="button" class="mb-3 btn btn-primary me-auto" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Create course
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form class="" action="${pageContext.request.contextPath}/admin/courses"
                                              method="post">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label>Course Name</label>
                                                    <input class="form-control" type="text" name="name" value="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Course image</label>
                                                    <input class="form-control" type="text" name="image" value="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <textarea class="form-control" type="text" name="description" value=""></textarea>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Close
                                                </button>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card" style="">
                                <div class="card-body">

                                    <div class="row align-content-center">
                                        <div class="">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">courseName</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Image</th>
                                                        <th scope="col">Description</th>
                                                        <th scope="col">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="c" items="${requestScope.courses}" varStatus="counter">
                                                    <tr>
                                                        <th scope="row">${counter.count}</th>
                                                        <td>${c.courseName}</td>
                                                        <td>${c.status}</td>
                                                        <td>${c.image}</td>
                                                        <td>${c.description}</td>
                                                        <td>
                                                            <a class="btn btn-success" href="${pageContext.request.contextPath}/admin/course-detail?courseId=${c.id}">Detail</a>
                                                        </td>
                                                    </tr>                             
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sales Chart End -->

            </div>
        </div>
        <jsp:include page="../components/admin/footer.jsp"></jsp:include>
    </body>

</html>