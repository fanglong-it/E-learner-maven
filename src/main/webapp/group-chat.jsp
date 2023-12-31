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
<title>Group Chat</title>
<style>
.button-as-p {
	display: inline-block;
	background-color: transparent;
	border: none;
	padding: 0;
	margin: 0;
	cursor: pointer;
	color: #0dcaf0;
}

.button-as-p:hover {
	text-decoration: underline;
}
</style>
</head>
<jsp:include page="components/header.jsp"></jsp:include>
<body id="page-top">
	<jsp:include page="components/navBarComponent.jsp"></jsp:include>
	<div class="container" id="app">
		<h1>Your Group Chat</h1>
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-10"></div>
		</div>

		<div class="row">
			<div class="card">
				<div class="card-body">
					<div class="row"></div>
					<div class="row">
						<div class="col-sm-2 mb-3 mt-3">
							<div class="row">
								<c:if test="${sessionScope.account.role.role_id=='2'}">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										Create Chat</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<form action="createChat" method="post">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Create
															group chat</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="col-sm-12">
															<div class="form-group">
																<label>Teacher name</label> <input type="text"
																	name="teacherName"
																	value="${sessionScope.account.fullname}"> <input
																	type="hidden" name="teacherId"
																	value="${sessionScope.account.id}">
															</div>

															<div class="form-group">
																<label>Chat name</label> <input type="text"
																	name="groupChatName" value="">
															</div>
															<div class="form-group">
																<label class="form-label">Select Student</label>
																<div class="row">
																	<c:forEach var="stu" varStatus="counter"
																		items="${sessionScope.students}">
																		<span class="text-nowrap"> <input
																			type="checkbox" id="student-${counter.count}"
																			class="" name="students" value="${stu.id}"> <label
																			class="" for="#student-${counter.count}">${stu.fullname}</label>
																		</span>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary">Create</button>
													</div>
												</form>

											</div>
										</div>
									</div>
								</c:if>
								<c:forEach var="c" items="${requestScope.groupChats}"
									varStatus="counter">
									<div class="form-group mt-3 mb-3 border bg-light">
										<div class="row">
											<div class="col-sm-8">
												<a
													href="chat-content?groupChatId=${c.id}&rows=${requestScope.rows}"
													class=""> <b>${c.groupChatName}</b><br> <span
													class="text-muted">Member : ${c.member}</span>
												</a>
											</div>
											<div class="col-sm-4">
												<button type="button" class="btn btn-primary rounded-1"
													data-bs-toggle="modal"
													data-bs-target="#exampleModal-${c.id}">
													<i class="fas fa-user-friends"></i>
												</button>
												<!-- Modal -->
												<div class="modal fade" id="exampleModal-${c.id}"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">List
																	Member(s)</h5>
																<button type="button" class="close"
																	data-bs-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<c:forEach var="mem" items="${c.accounts}">
																		<div class="form-group mt-3 mb-3">
																			<div class="row">
																				<div class="col-sm-6 text-end">
																					<label class="form-label font-weight-bold">${mem.fullname}</label>
																				</div>
																				<div class="col-sm-6">
																					<img src="images/${mem.avatar}" width="40px"
																						height="40px" alt="alt" />
																				</div>
																			</div>
																		</div>
																	</c:forEach>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Close</button>

															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="col-sm-10 border">
							<div class="">
								<div class="row justify-content-center">
									<c:choose>
										<c:when test="${requestScope.messages.size() > 0}">
											<div class="row col-sm-12"
												style="max-height: 500px; overflow-y: scroll;">
												<div class="row">
													<a id="showMoreButton" @click="showMore"
														class="btn-link text-center font-monospace">Click
															to show more</a>
												</div>
												<!-- Vue template code -->
												<div id="messagesContainer">
													<div v-for="message in messages"
														:class="['message', message.account.id === ${sessionScope.account.id} ? 'text-end' : 'text-start', 'mb-3']">
														<img
															v-if="message.account.id === ${sessionScope.account.id}"
															class="avatar me-2" width="50px" height="50px"
															:src="'images/' + message.account.avatar" alt="Avatar">

														<div class="message-content rounded p-2 d-inline-block">
															<b class="font-weight-bold">{{
																message.account.fullname }}</b>
															<div class="form-group bg-light rounded-1">
																<button v-if="message.resourcePathFile"
																	class="button-as-p"
																	@click="downloadFile(message.resourcePathFile, path)">
																	{{ message.resourcePathFile }}</button>
																<p class="mb-0">{{ message.content }}</p>
																<small class="text-muted">{{
																	formatedTimestampToDate(message.dateSended) }}</small>
															</div>
														</div>

														<img
															v-if="message.account.id !== ${sessionScope.account.id}"
															class="avatar ms-2" width="50px" height="50px"
															:src="'images/' + message.account.avatar" alt="Avatar">
													</div>
												</div>


											</div>
											<div class="row mt-3">
												<form method="post" action="chat-content"
													enctype="multipart/form-data">
													<div class="input-group">
														<input type="hidden" name="rows"
															value="${requestScope.rows}"> <input
															type="hidden" name="groupChatId"
															value="${requestScope.groupChatId}"> <input
															type="file" name="file" class="form-control-file">
														<input type="text" name="messageContent"
															class="form-control" placeholder="Type your message"
															required>
														<button type="submit" class="btn btn-primary">Send</button>
													</div>
												</form>
											</div>
										</c:when>
										<c:otherwise>
											<h3>View 1 Group!</h3>
										</c:otherwise>
									</c:choose>
									<!-- Create the Vue app -->
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>


		</div>

	</div>

</body>

<c:set var="groupChatId" value="${requestScope.groupChatId}" />

<jsp:include page="components/footer.jsp"></jsp:include>
<!-- Import Vue.js library -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

new Vue({
	  el: '#app',
	  data: {
	    messages: [], // Initialize with an empty array to hold messages
	    groupId: <c:out value="${requestScope.groupChatId}" default="null" />,
	    rows: <c:out value="${requestScope.rows}" default="null"/>,
	  },
	  mounted: function() {
		    // Fetch messages immediately when the Vue instance is mounted
		    this.fetchMessages();

		    // Fetch messages every 5 seconds using setInterval
		    setInterval(this.fetchMessages, 5000);
	},
		  
	  methods: {
	    fetchMessages: function() {
	    	 if (this.groupId) {
                 // Use backticks for URL string to allow variable substitution
                 axios.get(`get-messages?groupId=`+this.groupId+`&rows=`+this.rows)
                     .then(response => {
                         this.messages = response.data;
                     })
                     .catch(error => {
                         console.error(error);
                     });
             }
	    },
			// Define any methods you need, for example, the downloadFile method
		    	downloadFile: function(filePath) {
		    	      // Send an AJAX request to initiate the file download
		    	      // Replace 'Elearning/download-file' with the appropriate server-side endpoint
		    	      axios.post('download-file',null,{
		    	    	 params:{
		    	    		 pathUrl: filePath,
		    	    		
		    	    	 },
		    	        responseType: 'blob' // Set the response type to 'blob' to handle binary data
		    	      })
		    	      .then(response => {
		    	        // Create a Blob object from the response data
		    	        const blob = new Blob([response.data], { type: 'application/octet-stream' });

		    	        // Create a URL for the Blob object
		    	        const url = URL.createObjectURL(blob);

		    	        // Trigger the download using a hidden <a> element
		    	        const link = document.createElement('a');
		    	        link.href = url;
		    	        link.download = filePath.split('/').pop(); // Set the desired file name
		    	        link.style.display = 'none';
		    	        document.body.appendChild(link);
		    	        link.click();

		    	        // Clean up by revoking the Blob URL
		    	        URL.revokeObjectURL(url);
		    	      })
		    	      .catch(error => {
		    	        console.error(error);
		    	        // Handle any errors if necessary
		    	      });
		    	    }
		  
		  ,
		  formatedTimestampToDate(timeStamp){
			  var date = new Date(timeStamp);
			  return date;
		  },
		  showMore: function(){
			  this.rows += 5;
		  }
	  },
	  
	});
</script>
</html>
