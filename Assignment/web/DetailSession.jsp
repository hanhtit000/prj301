<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="model.Attendance" %>
<!doctype html>
<html lang="en">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
        <title>
            Detail Session
        </title>
    </head>

    <body>
        <nav class="navbar" role="navigation">
            <ul class="nav navbar-nav">
                <li> <a href="Home">Home</a> </li>
                <li> <a href="Schedule">View Schedule</a></li>
                <li> <a style="color: black;">Detail Session</a></li>
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
            <c:if test="${requestScope.groupList ne null}">
                <table class="Detail_table">
                        <c:forEach items="${requestScope.groupList}" var="s">
                            <tr>
                                <td>Session</td><td>${s.sessionNumber}</td>
                            </tr>
                            <tr>
                                <td>Group Name</td><td>${s.groupId.groupName}</td>
                            </tr>
                            <tr>
                                <td>Course Name</td><td>${s.groupId.courseId.courseName}</td>
                            </tr>
                            <tr>
                                <td>Instructor</td><td>${s.instructorId.surName} ${s.instructorId.midName} ${s.instructorId.givenName}</td>
                            </tr>
                            <tr>
                                <td>Slot</td><td>${s.slot}</td>
                            </tr>
                            <tr>
                                <td>Room Name</td><td>${s.roomName}</td>
                            </tr>
                            <tr>
                                <td>Take Attendance</td>
                                <td>
                                    <%        
                                        ArrayList<Attendance> a = (ArrayList<Attendance>) request.getAttribute("listeditstudent");
                                        if(a.size()==0){
                                    %>
                                    <form action="ListAttendance" method="post">
                                        <button type="submit" name="takeattend" value="${s.sessionId}"  class="btn-link">Take</button>
                                    </form>
                                    <%}else{%>
                                    <form action="EditAttendance" method="post">
                                        <button type="submit" name="editattend" value="${s.sessionId}"  class="btn-link">Edit</button>
                                    </form>
                                    <%}%>
                                </td>
                            </tr>
                        </c:forEach>
                </table>
            </c:if>
        </div>
    </body>