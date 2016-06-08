<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>destinationDetail</title>
</head>
<body>
<div id="wrapper">
    <jsp:include page="navbar.jsp"/>

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
                            <i class="fa fa-comment-o"></i> canal&nbsp&nbsp>&nbsp&nbsp订阅点&nbsp&nbsp>&nbsp&nbsp详情
                        </li>
                    </ol>
                </div>
            </div>

            <!--serverlist-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-cubes fa-fw"></i> 当前工作canal服务端</h3>
                        </div>
                        <div class="panel-body">
                            <!--body-->
                            <c:if test="${servers.isEmpty()}">
                                <div class="col-lg-3 col-md-6">
                                    <div class="panel panel-red">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-support fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">无服务</div>
                                                    <div>NO SERVER</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel-footer">
                                            <span class="pull-left">无服务器</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                            <div class="clearfix"></div>
                                        </div>

                                    </div>
                                </div>
                            </c:if>

                            <c:forEach var="itme" items="${servers}" varStatus="status">
                                <div class="col-lg-3 col-md-6">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-desktop fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">${itme.address}</div>
                                                    <c:if test="${itme.active}">
                                                        <div>Running</div>
                                                    </c:if>
                                                    <c:if test="${!itme.active}">
                                                        <div>Standby</div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#">
                                            <div class="panel-footer">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                                <div class="clearfix"></div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>


                        </div>
                    </div>
                </div>

                <!--clientlist-->
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-desktop fa-fw"></i> 当前工作订阅者客户端</h3>
                        </div>
                        <div class="panel-body">
                            <!--body-->
                            <c:if test="${client == null}">
                                <div class="col-lg-3 col-md-6">
                                    <div class="panel panel-red">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-support fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">无客户端</div>
                                                    <div>NO CLIENT</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel-footer">
                                            <span class="pull-left">binlog日志采集客户端没有运行</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                            <div class="clearfix"></div>
                                        </div>

                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${client != null}">
                                <div class="col-lg-3 col-md-6">
                                    <div class="panel panel-green">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-desktop fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">${client.address}</div>
                                                    <c:if test="${client.active}">
                                                        <div>Running</div>
                                                    </c:if>
                                                    <c:if test="${!client.active}">
                                                        <div>Standby</div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#">
                                            <div class="panel-footer">
                                                <span class="pull-left">View Details</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                                <div class="clearfix"></div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->

            <!--table-->
            <div class="row">
                <div class="col-lg-6">
                    <!--database-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-database fa-fw"></i> 采集的数据库</h3>
                        </div>
                        <div class="panel-body">
                            <!--body-->
                            <c:if test="${cursor == null}">
                                <div class="col-lg-8 col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-database fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">没有获取到数据库信息，请检查canal服务的配置</div>
                                                    <div>Crash</div>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#">
                                            <div class="panel-footer">
                                                <span class="pull-left">???</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                                <div class="clearfix"></div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${cursor != null}">
                                <div class="col-lg-8 col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-3">
                                                    <i class="fa fa-database fa-5x"></i>
                                                </div>
                                                <div class="col-xs-9 text-right">
                                                    <div class="huge">${cursor.identity.sourceAddress.address}:${cursor.identity.sourceAddress.port}</div>
                                                        <div>Running</div>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#">
                                            <div class="panel-footer">
                                                <span class="pull-left">OK</span>
                                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                                <div class="clearfix"></div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>


                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-inbox fa-fw"></i> mysql日志(binlog)位置点</h3>
                        </div>
                        <div class="panel-body">

                            <div class="table-responsive">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th>Included</th>
                                        <th>日志文件</th>
                                        <th>位置点</th>
                                        <th>时间戳</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>${cursor.postion.included}</td>
                                        <td>${cursor.postion.journalName}</td>
                                        <td>${cursor.postion.position}</td>
                                        <td>${cursor.postion.timestamp}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /.row -->

        </div>


    </div>
</div>
</body>
</html>
