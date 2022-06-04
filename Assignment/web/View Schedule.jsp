<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<!doctype html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <title>
            View Schedule
        </title>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1><span>hạnh</span>
                    </h1>
                </div>
                <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                    <a href="https://fap.fpt.edu.vn/Report/ScheduleOfWeek.aspx?view=user">
                        <span id="ctl00_lblLogIn" class="label label-success">hanhndhe163004</span></a> | <a href="https://fap.fpt.edu.vn/Report/ScheduleOfWeek.aspx?logout=true" class="label label-success">logout</a> |
                    <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                </div>
                <ol class="breadcrumb">
                    <li>
                        <span id="ctl00_lblNavigation"><a href="https://fap.fpt.edu.vn/Student.aspx">Home</a>&nbsp;|&nbsp;<b>View Schedule</b></span></li>
                </ol>
                <c:if test="${requestScope.scheduleList ne null}">
                    <table>
                        <thead>
                            <tr>
                                <th>Session</th>
                                <th>Group Name</th>
                                <th>Course Name</th>
                                <th>Slot</th>
                                <th>Room Name</th>
                                <th>Take Attendance</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.scheduleList}" var="s">
                                <tr>
                                    <td>${s.sessionId}</td>
                                    <td>${s.groupId.groupName}</td>
                                    <td>${s.groupId.courseId.courseName}</td>
                                    <td>${s.slot}</td>
                                    <td>${s.roomName}</td>
                                    <td><a href="">take</a>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </body>