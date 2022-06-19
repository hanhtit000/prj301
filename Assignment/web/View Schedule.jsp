<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.sql.Date" %>
<%@page import="model.Session" %>
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
            View Schedule 
        </title>
    </head>

    <body>
        <nav class="navbar" role="navigation">
            <ul class="nav navbar-nav">
                <li> <a href="Home">Home</a> </li>
                <li> <a href="Schedule">View Schedule</a></li>
            </ul>
        </nav>
        <div class="container">
            <div class="row">
                <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                    <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                </div>    
            </div>
        </div>
        <div class="row" style="padding-top: 20px">
            <p style="font-size: 50px"> 
                Activities for you in this current week
            </p>
        </div>
        <div class="Schedule_table">
            <c:if test="${requestScope.scheduleList ne null}">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Sunday</th>
                            <th>Monday</th>
                            <th>Tuesday</th>
                            <th>Wednesday</th>
                            <th>Thursday</th>
                            <th>Friday</th>
                            <th>Saturday</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Session> s = (ArrayList<Session>) request.getAttribute("scheduleList");
                            int i=0;
                            Calendar ist= Calendar.getInstance();
                            int y =ist.get(Calendar.YEAR);
                            int d = ist.get(Calendar.DAY_OF_YEAR);
                            int d1 = ist.get(Calendar.DAY_OF_WEEK);
                        %>
                        <tr>
                            <th>Slot</th><!-- comment -->
                                <%
                            for(int j=d-d1+1;j<d-d1+8;j++){
                                Date date1 = Date.valueOf(LocalDate.ofYearDay(y, j));
                                %>
                            <th><%=date1%></th>
                                <%
                            }
                                %>
                        </tr>
                        <%
                        for(i=1;i<=8;i++){
                        %>
                        <tr>
                            <td><%=i%></td>
                            <%
                                for(int j=d-d1+1;j<d-d1+8;j++){
                                    int kt=0;
                                    Date date = Date.valueOf(LocalDate.ofYearDay(y, j));
                                    for(Session c: s){
                                        if(c.getSlot()==i && c.getDate().equals(date)){
                                        kt=1;
                            %>
                            <td><%=c.getGroupId().getCourseId().getCourseName()%>
                                <br> at <%=c.getRoomName()%>
                                <br><a href="Detail?sessionId=<%=c.getSessionId()%>">Detail</a>
                            </td>
                            <%}}
                            if(kt!=1){%>                      
                            <td>-</td>
                            <%}}%>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </c:if>
        </div>
    </body>