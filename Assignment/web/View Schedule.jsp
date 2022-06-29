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
        <link href="css/mystyle2.css" rel="stylesheet">
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
                <li> <a href="Report">Attendance Report</a></li>
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
        <div class="choose">
            Year:
            <form action="Schedule" method="post">
                <select name="year" onchange="this.form.submit()">
                    <%
                        Calendar instance = Calendar.getInstance();
                        int y = Integer.parseInt((String) request.getAttribute("year"));
                        for(int j=Calendar.getInstance().get(Calendar.YEAR)-2;j<=Calendar.getInstance().get(Calendar.YEAR)+2;j++){
                    if(j!=y){%>
                    <option value="<%=j%>"><%=j%></option>
                    <%}else{%>
                    <option selected="selected" value="<%=y%>"><%=y%></option>
                    <%}}%>
                </select>
            </form><br>
            Week:
            <form action="Schedule" method="post">
                <input type="hidden" value="${requestScope.year}" name="choosedyear";/>
                <select name="week" onchange="this.form.submit()">
                    <%
                        Calendar ist = Calendar.getInstance();
                        int j= ist.get(Calendar.DAY_OF_YEAR);
                        String kt1 = (String) request.getParameter("week");
                        int w;
                        if (kt1 == null) {
                            w = Calendar.getInstance().get(Calendar.WEEK_OF_YEAR)-1;
                        } else {
                            w = Integer.parseInt(kt1);
                        }
                        Date day = Date.valueOf(LocalDate.ofYearDay(y, 7*w));
                        int y1= Integer.parseInt((String) request.getAttribute("year"));
                        int currentyear= Calendar.getInstance().get(Calendar.YEAR);
                        if ( currentyear > y1) {
                            while (currentyear > y1) {
                                ist.add(Calendar.DATE, -365);
                                currentyear--;
                            }
                        } else {
                            while (currentyear < y1) {
                                ist.add(Calendar.DATE, 365);
                                currentyear++;
                            }
                        }
                        int doy = ist.get(Calendar.DAY_OF_YEAR);
                        ist.add(Calendar.DATE, -doy);
                        int dow = ist.get(Calendar.DAY_OF_WEEK);
                        ist.add(Calendar.DATE, -dow+7);
                        j= ist.get(Calendar.DAY_OF_YEAR);
                        Date end = Date.valueOf(LocalDate.ofYearDay(y, j));        
                        int ed = ist.get(Calendar.DAY_OF_MONTH);
                        int em = ist.get(Calendar.MONTH)+1;
                        ist.add(Calendar.DATE, -6);
                        j= ist.get(Calendar.DAY_OF_YEAR);
                        Date start= Date.valueOf(LocalDate.ofYearDay(y, j));
                        int sd = ist.get(Calendar.DAY_OF_MONTH);
                        int sm = ist.get(Calendar.MONTH)+1;
                        ist.add(Calendar.DATE, 6);
                        for(int i=0;i<53;i++){
                        if(day.compareTo(start)>=0 && day.compareTo(end)<=0 && i!=0){
                    %>
                    <option selected="selected" onselect="this.form.submit()" value=<%=i%>><%=sd%>/<%=sm%> To <%=ed%>/<%=em%></option>
                    <%
                        }else if(i!=0){
                    %>
                    <option value=<%=i%>><%=sd%>/<%=sm%> To <%=ed%>/<%=em%></option>
                    <%}
                    ist.add(Calendar.DATE, 1);
                    j= ist.get(Calendar.DAY_OF_YEAR);
                    start= Date.valueOf(LocalDate.ofYearDay(y, j));
                    sd = ist.get(Calendar.DAY_OF_MONTH);
                    sm = ist.get(Calendar.MONTH)+1;
                    ist.add(Calendar.DATE, 6);
                    j= ist.get(Calendar.DAY_OF_YEAR);
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
                            String kt = (String) request.getParameter("year");
                            kt1 = (String) request.getParameter("choosedyear");
                            y =0;
                            if (kt == null && kt1==null) {
                                y = Calendar.getInstance().get(Calendar.YEAR);
                            }
                            if (kt !=null && kt1==null)
                            {
                                y = Integer.parseInt(kt);
                            }
                            if (kt ==null && kt1 !=null)
                            {
                                y = Integer.parseInt(kt1);
                            }
                            j = ist.get(Calendar.DAY_OF_YEAR);
                            currentyear= Calendar.getInstance().get(Calendar.YEAR);
                            if ( currentyear > y) {
                                while (currentyear > y) {
                                    ist.add(Calendar.DATE, -365);
                                    currentyear--;
                                }
                            } else {
                                while (currentyear < y) {
                                    ist.add(Calendar.DATE, 365);
                                    currentyear++;
                                }
                            }
                            doy = ist.get(Calendar.DAY_OF_YEAR);
                            ist.add(Calendar.DATE, -doy);
                            dow = ist.get(Calendar.DAY_OF_WEEK);
                            ist.add(Calendar.DATE, -dow +7);
                            String kt2 = (String) request.getParameter("week");
                            if (kt2 == null) {
                                w = Calendar.getInstance().get(Calendar.WEEK_OF_YEAR)-1;
                            } else {
                                w = Integer.parseInt(kt2);
                            }
                            ist.add(Calendar.DATE, w*7);
                            int d= ist.get(Calendar.DAY_OF_YEAR);
                            int d1= ist.get(Calendar.DAY_OF_WEEK);
                        %>
                        <tr>
                            <th>Slot</th><!-- comment -->
                                <%
                            for(j=d-d1+1;j<d-d1+8;j++){
                                LocalDate date1= null;
                                if(d-d1+1<=0){
                                    if(j<=0 && y%4==0) date1= LocalDate.ofYearDay(y, j+366);
                                        else if(j<=0 && y%4!=0) date1= LocalDate.ofYearDay(y, j+365);
                                            else date1= LocalDate.ofYearDay(y+1, j);
                                    }
                                    else date1= LocalDate.ofYearDay(y, j);
                                System.out.println(date1);
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
                                    int kt3=0;
                                    Date date = null;
                                    if(d-d1+1<=0){
                                    if(j<=0 && y%4==0) date= Date.valueOf(LocalDate.ofYearDay(y, j+366));
                                        else if(j<=0 && y%4!=0) date= Date.valueOf(LocalDate.ofYearDay(y, j+365));
                                            else date= Date.valueOf(LocalDate.ofYearDay(y+1, j));
                                    }
                                    else date= Date.valueOf(LocalDate.ofYearDay(y, j));
                                    for(Session c: s){
                                        if(c.getSlot()==i && c.getDate().equals(date)){
                                        kt3=1;
                            %>
                            <td><%=c.getGroupId().getCourseId().getCourseName()%>
                                <br> at <%=c.getRoomName()%>
                                <%        
                                    UpdateDBContext att = new UpdateDBContext();
                                    ArrayList<Attendance> a = att.get(c.getSessionId());
                                        if(a.size()==0){
                                        Date date2 = Date.valueOf(LocalDate.now());
                                        if(date2.compareTo(date)>=0){
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
                            if(kt3!=1){%>                      
                            <td>-</td>
                            <%}}%>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </c:if>
        </div>
    </body>