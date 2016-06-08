<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String index_path = request.getScheme()+"://"+request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Destinations</title>
	</head>

	<body>

		<div id="wrapper">
			<jsp:include page="navbar.jsp" />

			<div id="page-wrapper">

				<div class="container-fluid">
					<!-- Page Heading -->
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
                            Destinations
                        </h1>
							<ol class="breadcrumb">
								<li class="active">
									<i class="fa fa-desktop"></i> canal&nbsp&nbsp>&nbsp&nbsp订阅点
								</li>
							</ol>
						</div>
					</div>

					<div class="col-lg-6">
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-bars fa-fw"></i> Destinations Panel</h3>
							</div>
							<div class="panel-body">
								<div class="list-group">
									
									<!--each-->
									<c:forEach var="item" items="${destinations}" varStatus="status">
										<a class="list-group-item" href="<%=index_path%>/destinations/destinationDetail?destination=${item}">
											<span class="badge">订阅点</span>
											<i class="fa fa-fw fa-eye"></i> ${item}
										</a>
									</c:forEach>
									
								</div>
							</div>
						</div>
						
					</div>
				</div>

			</div>

		</div>
	</body>

</html>