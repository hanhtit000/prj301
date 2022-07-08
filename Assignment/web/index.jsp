<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html lang="en">
    <head>
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="Stylesheet" href="css/bootstrap.css" type="text/css">
        <link rel="Stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="Stylesheet" href="css/bootstrap-theme.min.css" type="text/css">
        <link href="css/mystyle.css" rel="stylesheet">
        <script src="css/jquery_002.js" type="text/javascript"></script>

        <script src="css/jquery_003.js" type="text/javascript"></script>

        <script src="css/jquery.js" type="text/javascript"></script>

        <script src="css/jquery-1.8.3.js" type="text/javascript"></script>

        <script src="css/jquery-ui.js" type="text/javascript"></script>

        <script src="css/jquery.alerts.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                    <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                    <c:if test="${sessionScope.account ne null}">
                        <span id="ctl00_lblCampusName" class="label label-success">${sessionScope.account.username}</span>
                        <form action="Logout" method="post" style="display: flex; max-width: 200px; right: 0; ">
                            <input type="submit" value="Logout">
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.account eq null}"><a href="Login">Login</a></c:if>
                </div>    
            </div>
        </div>
        <div>
            <p style="text-align: center; font-size: 50px"> Welcome to Attendance System <p><br>
                <a href="Home">1. Home</a><br>
                <a href="Schedule">2. View Schedule</a><br>
                <a href="Report">3. Attendance Report</a>
        </div>

    </body>
</html>