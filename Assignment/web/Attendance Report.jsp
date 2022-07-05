<%-- 
    Document   : newjsp
    Created on : May 31, 2022, 11:56:51 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<%@page import="model.Student" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="Stylesheet" href="css/bootstrap.css" type="text/css">
        <link rel="Stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="Stylesheet" href="css/bootstrap-theme.min.css" type="text/css">
        <link href="css/mystyle.css" rel="stylesheet">
        <link href="css/mystyle_1.css" rel="stylesheet">
        <link href="css/mystyle2.css" rel="stylesheet">
        <link href="css/mystyle2_1.css" rel="stylesheet">
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
                <li> <a style="color: black">Attendance report</a></li>
            </ul>
        </nav>
        <div class="container">
            <div class="row">
                <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                    <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                </div>    
            </div>
        </div>
        <div class="choose2">
            <form action="Report" method="get">
                <table class="choose1">
                    <tr><th>Course</th></tr>
                            <c:forEach items="${requestScope.course}" var="c">
                                <c:if test="${requestScope.choosedCourse eq c.courseId}">
                            <tr><td>${c.courseName}</button></td></tr>
                        </c:if>
                        <c:if test="${requestScope.choosedCourse ne c.courseId}">
                            <tr><td><button type="submit" name="chooseCourse" value="${c.courseId}"  class="btn-link">${c.courseName}</button></td></tr>
                                </c:if>
                            </c:forEach>
                </table>
            </form>
        </div>
        <div class="choose2">
            <c:if test="${requestScope.group ne null}">
                <form action="Report" method="post">
                    <table class="choose1">
                        <input type="hidden" value="${requestScope.choosedCourse}" name="choosedCourse">
                        <tr><th>Group</th></tr>
                                <c:forEach items="${requestScope.group}" var="g">
                                    <c:if test="${requestScope.choosedGroup eq g.groupId}">
                                <tr><td>${g.groupName}</button></td></tr>
                            </c:if>
                            <c:if test="${requestScope.choosedGroup ne g.groupId}">
                                <tr><td><button type="submit" name="chooseGroup" value="${g.groupId}"  class="btn-link">${g.groupName}</button></td></tr>
                                    </c:if>
                                </c:forEach>
                    </table>
                </form>
            </c:if>
        </div>
        <c:if test="${requestScope.studenlist ne null}">
            <h1 style="text-align: center">Attendance report</h1>
            <div class="Attendance_table">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student Code</th>
                            <th>Sur Name</th>
                            <th>Mid Name</th>
                            <th>Given Name</th>
                            <th>Attended</th>
                            <th>Absented</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Student> s = (ArrayList<Student>) request.getAttribute("studenlist");
                            ArrayList<Integer> attendance = (ArrayList<Integer>) request.getAttribute("attendance");
                            ArrayList<Integer> attended = (ArrayList<Integer>) request.getAttribute("attended");
                            for (int i = 0; i < s.size(); i++) {
                        %>
                        <tr>
                            <td><%=s.get(i).getStudentId()%></td>
                            <td><%=s.get(i).getStudentCode()%></td>
                            <td><%=s.get(i).getSurName()%></td>
                            <td><%=s.get(i).getMidName()%></td>
                            <td><%=s.get(i).getGivenName()%></td>
                            <td><%=attended.get(i)%>/30</td>
                            <td><%=attendance.get(i)-attended.get(i)%>/30</td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
</html>
