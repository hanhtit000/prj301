<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.sql.Date" %>
<%@page import="model.Session" %>
<%@page import="model.Attendance" %>
<%@page import="dal.UpdateDBContext" %>
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
        <div>
            Year:
            <form action="Schedule" method="get">
                <select name="year" onchange="this.form.submit()">
                    <%
                        Calendar instance = Calendar.getInstance();
                        int y = instance.get(Calendar.YEAR);
                        for(int j=y-2;j<=y+2;j++){
                    if(j!=y){%>
                    <option value="<%=j%>"><%=j%></option>
                    <%}else{%>
                    <option selected="selected" value="<%=y%>"><%=y%></option>
                    <%}}%>
                </select>
            </form><br>
            Week:
            <form action="Schedule" method="post">
                <select name="week" onchange="this.form.submit()">
                    <%
                        Calendar ist = Calendar.getInstance();
                        int j= instance.get(Calendar.DAY_OF_YEAR);
                        Date day = Date.valueOf(LocalDate.ofYearDay(y, j));
                        int y1= Integer.parseInt((String) request.getAttribute("year"));
                        if(Calendar.YEAR>y1){
                            while(Calendar.YEAR>y1)
                            {
                                ist.add(Calendar.DATE, -365);
                            }
                        }
                        else
                        {
                            while(Calendar.YEAR<y1)
                            {
                                ist.add(Calendar.DATE, 365);
                            }
                        }
                        int dow= ist.get(Calendar.DAY_OF_YEAR);
                        ist.add(Calendar.DATE, -dow+2);
                        j= instance.get(Calendar.DAY_OF_YEAR);
                        Date end = Date.valueOf(LocalDate.ofYearDay(y, j));        
                        int ed = ist.get(Calendar.DAY_OF_MONTH);
                        int em = ist.get(Calendar.MONTH)+1;
                        ist.add(Calendar.DATE, -6);
                        j= instance.get(Calendar.DAY_OF_YEAR);
                        Date start= Date.valueOf(LocalDate.ofYearDay(y, j));
                        int sd = ist.get(Calendar.DAY_OF_MONTH);
                        int sm = ist.get(Calendar.MONTH)+1;
                        for(int i=0;i<=53;i++){
                        if(day.compareTo(start)>=0 && day.compareTo(end)<=0){
                    %>
                    <option selected="selected" value=<%=i%>><%=sd%>/<%=sm%> To <%=ed%>/<%=em%></option>
                    <%
                        }else{
                    %>
                    <option value=<%=i%>><%=sd%>/<%=sm%> To <%=ed%>/<%=em%></option>
                    <%}
                        instance.add(Calendar.DATE, 1);
                        j= instance.get(Calendar.DAY_OF_YEAR);
                        start= Date.valueOf(LocalDate.ofYearDay(y, j));
                        sd = ist.get(Calendar.DAY_OF_MONTH);
                        sm = ist.get(Calendar.MONTH)+1;
                        instance.add(Calendar.DATE, 6);
                        j= instance.get(Calendar.DAY_OF_YEAR);
                        end = Date.valueOf(LocalDate.ofYearDay(y, j));     
                        ed = ist.get(Calendar.DAY_OF_MONTH);
                        em = ist.get(Calendar.MONTH)+1;
                        }
                    %>
                </select>
            </form><br>
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
                            ist= Calendar.getInstance();
                            y =ist.get(Calendar.YEAR);
                            int d = ist.get(Calendar.DAY_OF_YEAR);
                            int d1 = ist.get(Calendar.DAY_OF_WEEK);
                        %>
                        <tr>
                            <th>Slot</th><!-- comment -->
                                <%
                            for(j=d-d1+1;j<d-d1+8;j++){
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
                                for(j=d-d1+1;j<d-d1+8;j++){
                                    int kt=0;
                                    Date date = Date.valueOf(LocalDate.ofYearDay(y, j));
                                    for(Session c: s){
                                        if(c.getSlot()==i && c.getDate().equals(date)){
                                        kt=1;
                            %>
                            <td><%=c.getGroupId().getCourseId().getCourseName()%>
                                <br> at <%=c.getRoomName()%>
                                <%        
                                    UpdateDBContext att = new UpdateDBContext();
                                    ArrayList<Attendance> a = att.get(c.getSessionId());
                                        if(a.size()==0){
                                        Date date2 = Date.valueOf(LocalDate.ofYearDay(y, d));
                                        if(date2.compareTo(date)>0){
                                %>
                                <h5 style="color: gray;">Not yet</h5>                                
                                <form action="ListAttendance" method="post">
                                    <button type="submit" name="takeattend" value="<%=c.getSessionId()%>"  class="btn-link">Take</button>
                                    <input type="hidden" name="group" value="<%=c.getGroupId().getGroupId()%>"/>
                                    <input type="hidden" name="groupname" value="<%=c.getGroupId().getGroupName()%>"/>
                                </form>
                                <%}else{%>
                                <h5 style="color: gray;">Not yet</h5> 
                                <%}}else{%>
                                <h5 style="color: green;">Attended</h5>
                                <form action="EditAttendance" method="post">
                                    <button type="submit" name="editattend" value="<%=c.getSessionId()%>"  class="btn-link">Edit</button>
                                    <input type="hidden" name="group" value="<%=c.getGroupId().getGroupId()%>"/>
                                    <input type="hidden" name="groupname" value="<%=c.getGroupId().getGroupName()%>"/>
                                </form>
                                <%}%>
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