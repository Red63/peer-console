<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getScheme()+"://"+request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Bootstrap Core CSS -->
		<link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="<%=path%>/static/css/sb-admin.css" rel="stylesheet">

		<!-- Morris Charts CSS -->
		<link href="<%=path%>/static/css/plugins/morris.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="<%=path%>/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		
		
		<!-- jQuery -->
	    <script src="<%=path%>/static/js/jquery.js"></script>
	
	    <!-- Bootstrap Core JavaScript -->
	    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
	
	    <!-- Morris Charts JavaScript -->
	    <script src="<%=path%>/static/js/plugins/morris/raphael.min.js"></script>
	    <script src="<%=path%>/static/js/plugins/morris/morris.min.js"></script>
	    <script src="<%=path%>/static/js/plugins/morris/morris-data.js"></script>
	</head>
	
	
    <body>
    	
    	<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=path%>/index.html">Peer console</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Admin <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>

                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-desktop"></i> canal <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="expand">
                            <li>
                                <a href="<%=path%>/cluster/list">Cluster server</a>

                            </li>

                            <li>
                                <a href="<%=path%>/destinations/list">Destinations</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
 	</body>
</html>