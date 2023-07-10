<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
  <div class="alerts">
    <c:if test="${message!=null}">
      <div class="">
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            ${message}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <c:remove var="message" scope="session"/>
      </div>
    </c:if>

    <c:if test="${error!=null}">
      <div class="">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${error}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <c:remove var="error" scope="session"/>
      </div>
    </c:if>
  </div>
</div>