<%@ page import="utils.DatetimeUtils" %>
<%@ page import="model.Course" %>
<%@ page import="base.Base" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
<%@include file="components/admin/header.jsp" %>
<body>
<jsp:include page="components/admin/navbar.jsp"></jsp:include>
<div class="position-relative bg-white d-flex p-0">
    <jsp:include page="components/admin/slidebar.jsp"></jsp:include>
    <!-- Content Start -->
    <div class="content w-100">
        <jsp:include page="components/alert.jsp"></jsp:include>
        <!-- Sale & Revenue Start -->
        <div class="container pt-4 " style="width: 100%">
            <div class="card w-100">
                <div class="card-body">

                    <div class="row">
                        <h3>Manager Class for ${requestScope.course.courseName}</h3>
                    </div>
                    <div>
                        <h4 class="mb-3">Details</h4>
                        <div class="my-3">
                            <p>
                                Name: ${course.courseName}
                            </p>
                            <p>
                                Description: ${course.description}
                            </p>
                            <%--              CreatedAt: <%= DatetimeUtils.toString(((Course)request.getAttribute("course")).getCreateDate(), Base.DATE_TIME_FORMAT) %>--%>
                        </div>
                    </div>
                    <div class="d-flex">
                        <!-- Button trigger modal -->
                        <div class="me-2">
                            <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                Create Class
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form class="" action="${pageContext.request.contextPath}/admin/add-class"
                                              method="post">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label>Class Name</label>
                                                    <input class="form-control" type="text" name="className" value="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Max Student</label>
                                                    <input class="form-control" type="text" name="maxStudent" value="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Image</label>
                                                    <input class="form-control" type="text" name="image" value="">
                                                </div>
                                                <div class="form-group">
                                                    <label>User</label>
                                                    <select class="form-select" name="teacherId">
                                                        <c:forEach var="tea" items="${requestScope.accounts}">
                                                            <option value="${tea.id}">${tea.fullname}-${tea.username}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label>Course</label>
                                                    <input class="form-control" type="hidden" name="courseId"
                                                           value="${requestScope.course.id}">
                                                    <input class="form-control" type="text" readonly=""
                                                           name="courseName" value="${requestScope.course.courseName}">
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
                        <div class="me-2">
                            <button type="button" class="btn btn-warning mb-3" data-bs-toggle="modal"
                                    data-bs-target="#updateCourseModel">
                                Update course
                            </button>
                            <!-- Modal -->
                            <div class="modal fade" id="updateCourseModel" tabindex="-1"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form class="" action="${pageContext.request.contextPath}/admin/course-detail"
                                              method="post">
                                            <input  type="hidden" name="courseId" value="${course.id}" />
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="">Update course</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label>Course Name</label>
                                                    <input class="form-control" type="text" name="name" value="${course.courseName}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Course Image</label>
                                                    <input class="form-control" type="text" name="image" value="${course.image}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Course description</label>
                                                    <input class="form-control" type="text" name="description" value="${course.description}">
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
                        <div>
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/delete-course?courseId=${course.id}">Delete course</a>
                        </div>
                    </div>
                </div>
                <div class="row align-content-center">
                    <div class="">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">className</th>
                                <th scope="col">maxStudent</th>
                                <th scope="col">Image</th>
                                <th scope="col" style="width: 10%">User</th>
                                <th scope="col" style="width: 10%">dateCreate</th>
                                <th scope="col">Status</th>
                                <th scope="col">Course</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${requestScope.classes}" varStatus="counter">
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${c.className}</td>
                                    <td>${c.maxStudent}</td>
                                    <td>${c.image}</td>
                                    <td class="text-nowrap">${c.account.fullname}</td>
                                    <td class="text-nowrap">${c.dateCreate}</td>
                                    <td>${c.status}</td>
                                    <td>${c.course.courseName}</td>
                                    <td class="d-flex gx-3">
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/class-detail?classId=${c.id}">Detail</a>
<%--                                        <button type="button" class="btn btn-warning me-2 d-inline-block"--%>
<%--                                                data-bs-toggle="modal" data-bs-target="#updateModal-${counter.count}">--%>
<%--                                            Update--%>
<%--                                        </button>--%>
<%--                                        <!-- Update -->--%>
<%--                                        <div class="modal fade" id="updateModal-${counter.count}" tabindex="-1"--%>
<%--                                             aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--                                            <div class="modal-dialog">--%>
<%--                                                <div class="modal-content">--%>
<%--                                                    <form action="manager-class" method="post">--%>
<%--                                                        <input type="hidden" value="${course.id}" name="courseId"/>--%>
<%--                                                        <div class="modal-header">--%>
<%--                                                            <h5 class="modal-title">Update Class</h5>--%>
<%--                                                            <button type="button" class="btn-close"--%>
<%--                                                                    data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="modal-body">--%>
<%--                                                            <div class="form-group">--%>
<%--                                                                <label>Class Name</label>--%>
<%--                                                                <input class="form-control" type="text" name="className"--%>
<%--                                                                       value="${c.className}">--%>
<%--                                                                <input class="form-control" type="hidden" name="classId"--%>
<%--                                                                       value="${c.id}">--%>
<%--                                                            </div>--%>
<%--                                                            <div class="form-group">--%>
<%--                                                                <label>Max Student</label>--%>
<%--                                                                <input class="form-control" type="text"--%>
<%--                                                                       name="maxStudent" value="${c.maxStudent}">--%>
<%--                                                            </div>--%>
<%--                                                            <div class="form-group">--%>
<%--                                                                <label>Image</label>--%>
<%--                                                                <input class="form-control" type="text" name="image"--%>
<%--                                                                       value="${c.image}">--%>
<%--                                                            </div>--%>
<%--                                                            <div class="form-group">--%>
<%--                                                                <label for="teacher-select">User</label>--%>
<%--                                                                <select class="form-select" name="teacherId"--%>
<%--                                                                        id="teacher-select">--%>
<%--                                                                    <option selected=""--%>
<%--                                                                            value="${c.account.id}">${c.account.fullname}-${c.account.username}</option>--%>
<%--                                                                    <c:forEach var="tea"--%>
<%--                                                                               items="${requestScope.accounts}">--%>
<%--                                                                        <option value="${tea.id}">${tea.fullname}-${tea.username}</option>--%>
<%--                                                                    </c:forEach>--%>
<%--                                                                </select>--%>
<%--                                                            </div>--%>

<%--                                                            <div class="form-group">--%>
<%--                                                                <label>Course</label>--%>
<%--                                                                <input class="form-control" type="hidden"--%>
<%--                                                                       name="courseId" value="${c.course.id}">--%>
<%--                                                                <input class="form-control" type="text" readonly=""--%>
<%--                                                                       name="courseName" value="${c.course.courseName}">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="modal-footer">--%>
<%--                                                            <button type="button" class="btn btn-secondary"--%>
<%--                                                                    data-bs-dismiss="modal">Close--%>
<%--                                                            </button>--%>
<%--                                                            <button type="submit" class="btn btn-primary">Save changes--%>
<%--                                                            </button>--%>
<%--                                                        </div>--%>
<%--                                                    </form>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"--%>
<%--                                                data-bs-target="#exampleModal-${counter.count}">--%>
<%--                                            Assign--%>
<%--                                        </button>--%>
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
    <!-- Sales Chart End -->

</div>
</div>
<jsp:include page="components/admin/footer.jsp"></jsp:include>
</body>
</html>