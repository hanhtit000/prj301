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
                <form action="DateTime" method="POST">
                    <select name="year" id="year">
                        <%
                            Calendar instance = Calendar.getInstance();
                            int y = instance.get(Calendar.YEAR);
                            for(int j=y-2;j<=y+2;j++){
                        if(j!=y){%>
                        <option value="<%=j%>" onclick="choose(this)"><%=j%></option>
                        <%}else{%>
                        <option selected="selected" value="<%=y%>"><%=y%></option>
                        <%}}%>
                    </select>
                    <input type="submit" id="sub"/>
                </form>
                    <script>
                        function choose()
                        {
                            document.getElementById('year').selected=this;
                            document.getElementById('sub').style.display='none';
                        }
                        </script>
                <c:if test="${requestScope.yearweek ne null}">
                    <form action="DateTime" method="POST">
                        <select name="week">
                            <%
                                Calendar ist = Calendar.getInstance();
                                Date d= ist.getTime();
                                int y1= Integer.parseInt(request.getParameter("year"));
                                if(y>y1){
                                    while(ist.get(Calendar.YEAR)>y1)
                                    {
                                        ist.add(Calendar.DATE, -365);
                                    }
                                }
                                else
                                {
                                    while(ist.get(Calendar.YEAR)<y1)
                                    {
                                        ist.add(Calendar.DATE, 365);
                                    }
                                }
                                int dd = ist.get(Calendar.DAY_OF_MONTH);
                                int mm =  ist.get(Calendar.MONTH)+1;
                                int dow= ist.get(Calendar.DAY_OF_YEAR);
                                ist.add(Calendar.DATE, -dow+2);
                            
                                Date end=ist.getTime();
                                int ed = ist.get(Calendar.DAY_OF_MONTH);
                                int em = ist.get(Calendar.MONTH)+1;
                                ist.add(Calendar.DATE, -6);
                                Date start=ist.getTime();
                                int sd = ist.get(Calendar.DAY_OF_MONTH);
                                int sm = ist.get(Calendar.MONTH)+1;
                                ist.add(Calendar.DATE, 6);
                                for(int i=0;i<=53;i++){
                                if(d.compareTo(start)>=0 && d.compareTo(end)<=0){
                            %>
                            <option selected="selected" value=<%=i%>><%=sd%>/<%=sm%> To <%=ed%>/<%=em%></option>
                            <%
                                }else{
                            %>
                            <option value=<%=i%>><%=sd%>/<%=sm%> To <%=ed%>/<%=em%></option>
                            <%}
                                ist.add(Calendar.DATE, 1);
                                start=ist.getTime();
                                sd = ist.get(Calendar.DAY_OF_MONTH);
                                sm = ist.get(Calendar.MONTH)+1;
                                ist.add(Calendar.DATE, 6);
                                end=ist.getTime();
                                ed = ist.get(Calendar.DAY_OF_MONTH);
                                em = ist.get(Calendar.MONTH)+1;
                                }
                            %>
                        </select>
                    </form>
                    <input type="submit"/>
                </c:if>

                <table>
                    <thead>
                        <tr>
                            <th rowspan="2">
                                <span class="auto-style1"><strong>Year</strong></span>

                                Week

                            </th>
                            <th align="center">Mon</th>
                            <th align="center">Tue</th>
                            <th align="center">Wed</th>
                            <th align="center">Thu</th>
                            <th align="center">Fri</th>
                            <th align="center">Sat</th>
                            <th align="center">Sun</th>
                        </tr>
                        <tr>
                            <th align="center">23/05</th>
                            <th align="center">24/05</th>
                            <th align="center">25/05</th>
                            <th align="center">26/05</th>
                            <th align="center">27/05</th>
                            <th align="center">28/05</th>
                            <th align="center">29/05</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Slot 1 </td>
                            <td>
                                <a>PRJ301</a>
                                at DE-C201 
                                <a><br>(<font color="Green">attended</font>)<br><span class="label label-success">(7:30-9:00)</span><br></a>
                            </td>
                            <td>
                                <a>JPD123</a>
                                at DE-C201 
                                <a><br>(<font color="Green">attended</font>)<br><span class="label label-success">(7:30-9:00)</span><br></a>
                            </td>
                            <td>
                                <a>PRJ301</a>
                                at DE-C201 
                                <a> <br>(<font color="Green">attended</font>)<br><span class="label label-success">(7:30-9:00)</span><br></a>
                            </td>
                            <td>
                                <a>JPD123-</a>
                                at DE-C201 
                                <a><br>(<font color="Green">attended</font>)<br><span class="label label-success">(7:30-9:00)</span><br></a>
                            </td>
                            <td>
                                <a>PRJ301</a>
                                at DE-C201<a class="label label-default" href="https://meet.google.com/gkh-fjwj-hgx" target="_blank">Meet URL</a><a> <br>(<font color="red">Not yet</font>)<br><span class="label label-success">(7:30-9:00)</span><br></a></td><td>-</td><td>-</td></tr><tr><td>Slot 2 </td><td><a href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=922641">MAS291-</a><a class="label label-warning" href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=gXpbVGLXcG5l8LKF%2bLP6yA%3d%3d&amp;SessionNo=iU6XsBAm8gKSVq0zGwPi7A%3d%3d" target="_blank">View Materials</a><br> at DE-C201 <a> <br>(<font color="Green">attended</font>)<br><span class="label label-success">(9:10-10:40)</span><br></a></td><td><a href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=923761">JPD123-</a><a class="label label-warning" href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=6dnCI8K184zSh7%2fYYXk2ZQ%3d%3d&amp;SessionNo=8lAXSU4lCLLUZX7%2f1fL97g%3d%3d" target="_blank">View Materials</a><br> at DE-C201 <a> <br>(<font color="Green">attended</font>)<br><span class="label label-success">(9:10-10:40)</span><br></a></td><td><a href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=922651">MAS291-</a><a class="label label-warning" href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=gXpbVGLXcG5l8LKF%2bLP6yA%3d%3d&amp;SessionNo=8lAXSU4lCLLUZX7%2f1fL97g%3d%3d" target="_blank">View Materials</a><br> at DE-C201 <a> <br>(<font color="Green">attended</font>)<br><span class="label label-success">(9:10-10:40)</span><br></a></td><td>-</td><td><a href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=922661">MAS291-</a><a class="label label-warning" href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=gXpbVGLXcG5l8LKF%2bLP6yA%3d%3d&amp;SessionNo=IJfz2VKAIrW9EuVvR3uHgg%3d%3d" target="_blank">View Materials</a><br> at DE-C201 - <a class="label label-default" href="https://meet.google.com/bvq-bnqz-qdw" target="_blank">Meet URL</a><a> <br>(<font color="red">Not yet</font>)<br><span class="label label-success">(9:10-10:40)</span><br></a></td><td><a href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=934518">SWE201c-</a><a class="label label-warning" href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=wv%2f6ywGLlf2HfwjoV78kkA%3d%3d&amp;SessionNo=F9EHvqN%2bdUjlw7x5OhB%2faQ%3d%3d" target="_blank">View Materials</a><br> at BE-312 - <a class="label label-default" href="https://meet.google.com/dfb-xnrn-wqw" target="_blank">Meet URL</a><a> <br>(<font color="red">Not yet</font>)<br><div class="online-indicator"><span class="blink"></span></div><h3 class="online-text">Online</h3></a></td><td>-</td></tr><tr>
                            <td>Slot 3 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 4 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 5 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 6 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 7 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr><tr><td>Slot 8 </td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    </tbody>
                </table>
                </body>