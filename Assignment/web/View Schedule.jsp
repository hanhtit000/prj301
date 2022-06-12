<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.sql.Date" %>
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
                                <th>Slot</th>
                                <th>Monday</th>
                                <th>Tuesday</th>
                                <th>Wednesday</th>
                                <th>Thursday</th>
                                <th>Friday</th>
                                <th>Saturday</th>
                                <th>Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i=0;
                                Calendar ist= Calendar.getInstance();
                                int y =ist.get(Calendar.YEAR);
                                int d = ist.get(Calendar.DAY_OF_YEAR);
                                int d1 = ist.get(Calendar.DAY_OF_WEEK);
                                ist.add(Calendar.DATE, 6);
                            %>
                            <c:forEach items="${requestScope.scheduleList}" var="s">
                                <tr>
                                    <td><%=i++%></td>
                                    <%for(int j=d-d1+1;j<d-d1+8;j++){
                                        Date day = Date.valueOf(LocalDate.ofYearDay(y, j));
                                    %>
                                    <c:if test="${s.slot == i and s.date.equals(day)}">
                                        <td>${s.groupId.courseId.courseName}
                                            <br> at ${s.roomName}
                                            <br><a href="Detail?sessionId=${s.sessionId}">Detail</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${s.slot != i or !s.date.equals(day)}">
                                        <td>-</td>
                                    </c:if>
                                   <%}%>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </body>