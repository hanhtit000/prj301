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
        <title>Update Attendance</title>
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
        <nav class="navbar" role="navigation">
            <ul class="nav navbar-nav">
                <li> <a href="Home">Home</a> </li>
                <li> <a href="Schedule">View Schedule</a></li>
                <li> <a style="color: black;">Update Attendance</a></li>
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
            <table>
                <thead>
                    <tr>
                        <th>Course</th>
                        <th>Group</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                <table>
                    
                        <tr></tr>
                </table>
                        <td></td>
                    </tr>
                </tbody>
            </table>

        </div>
        <h1>Update Attendance</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Student Code</th>
                <th>Sur Name</th>
                <th>Mid Name</th>
                <th>Given Name</th>
                <th>Message</th>
                <th>Attendance</th>
            </tr>
            <c:forEach items="${requestScope.listeditstudent}" var="stu">
                <tr>
                    <td><input type="hidden" value="${stu.studentId.studentId}" name="id<%=i%>" />${stu.studentId.studentId}</td>
                    <td><input type="hidden" value="${stu.studentId.studentCode}" name="code<%=i%>" />${stu.studentId.studentCode}</td>
                    <td><input type="hidden" value="${stu.studentId.surName}" name="sur<%=i%>" />${stu.studentId.surName}</td>
                    <td><input type="hidden" value="${stu.studentId.midName}" name="mid<%=i%>" />${stu.studentId.midName}</td>
                    <td><input type="hidden" value="${stu.studentId.givenName}" name="given<%=i%>" />${stu.studentId.givenName}</td>
                    <td><input type="text" value="${stu.message}" name="mess<%=i%>"/></td>
                    <td>
                        <c:if test="${stu.attendanceStatus.equals('Attended')}">
                            <input type="radio" name="cbox<%=i%>" value="Absent"/>Absent  
                            <input type="radio" checked="checked" name="cbox<%=i%>" value="Attended"/>Attended
                        </c:if>
                        <c:if test="${!stu.attendanceStatus.equals('Attended')}">
                            <input type="radio" checked="checked" name="cbox<%=i%>" value="Absent"/>Absent  
                            <input type="radio" name="cbox<%=i%>" value="Attended"/>Attended
                        </c:if>
                    </td>
                    <%i++;%>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>