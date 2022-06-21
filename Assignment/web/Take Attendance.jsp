<%-- 
    Document   : newjsp
    Created on : May 31, 2022, 11:56:51 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
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
    <body>
        <nav class="navbar" role="navigation">
            <ul class="nav navbar-nav">
                <li> <a href="Home">Home</a> </li>
                <li> <a href="Schedule">View Schedule</a></li>
                <li> <a style="color: black;">Take Attendance</a></li>
            </ul>
        </nav>
        <div class="container">
            <div class="row">
                <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                    <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                </div>    
            </div>
        </div>
        <div>
        <form action="TakeAttendance" method="post">
            <h1>Take Attendance</h1>
            <div class="Attendance_table">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student Code</th>
                        <th>Sur Name</th>
                        <th>Mid Name</th>
                        <th>Given Name</th>
                        <th>Message</th>
                        <th>Attendance</th>
                    </tr>
                </thead>
                <tbody>
                <input type="hidden" value="${requestScope.sid}" name="sid" />
                <% int i=1;%>
                <c:forEach items="${requestScope.liststudent}" var="stu">
                    <tr>
                        <td><input type="hidden" value="${stu.studentId}" name="id<%=i%>" />${stu.studentId}</td>
                        <td><input type="hidden" value="${stu.studentCode}" name="code<%=i%>" />${stu.studentCode}</td>
                        <td><input type="hidden" value="${stu.surName}" name="sur<%=i%>" />${stu.surName}</td>
                        <td><input type="hidden" value="${stu.midName}" name="mid<%=i%>" />${stu.midName}</td>
                        <td><input type="hidden" value="${stu.givenName}" name="given<%=i%>" />${stu.givenName}</td>
                        <td><input type="text" value="" name="mess<%=i%>"/></td>
                        <td>
                            <input type="radio" checked="checked" name="cbox<%=i%>" value="Absent"/>Absent  <input type="radio" name="cbox<%=i%>" value="Attended"/> Attended
                        </td>
                        <%i++;%>
                    </tr>
                </c:forEach>
                <input type="hidden" value="<%=i%>" name="count" />
                </tbody>
            </table>
                </div>
            <div class="last">
            <input type="submit" name="Send"/>
                </div>
        </form>
                </div>
    </body>
</html>
