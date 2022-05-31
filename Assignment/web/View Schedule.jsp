<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <table>
                        <tbody><tr style="border-bottom: 0 none">
                            <td>
                                <div>
                                    
<table>
        <thead>
            <tr>
                <th rowspan="2">
                    <span class="auto-style1"><strong>Year</strong></span>
                    <select name="">
                        <%for(int i=0;i<5;i++){%>
                        <option value="<%%>"></option>
                        <option selected="selected" value="2022">2022</option>
                        <%}%>
                    </select><br>
                    Week
                    <select name="ctl00$mainContent$drpSelectWeek" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$mainContent$drpSelectWeek\&#39;,\&#39;\&#39;)&#39;, 0)" id="ctl00_mainContent_drpSelectWeek">
                        <option value="1">03/01 To 09/01</option>
                        <option value="2">10/01 To 16/01</option>
                        <option value="3">17/01 To 23/01</option>
                        <option value="4">24/01 To 30/01</option>
                        <option value="5">31/01 To 06/02</option>
                        <option value="6">07/02 To 13/02</option>
                        <option value="7">14/02 To 20/02</option>
                        <option value="8">21/02 To 27/02</option>
                        <option value="9">28/02 To 06/03</option>
                        <option value="10">07/03 To 13/03</option>
                        <option value="11">14/03 To 20/03</option>
                        <option value="12">21/03 To 27/03</option>
                        <option value="13">28/03 To 03/04</option>
                        <option value="14">04/04 To 10/04</option>
                        <option value="15">11/04 To 17/04</option>
                        <option value="16">18/04 To 24/04</option>
                        <option value="17">25/04 To 01/05</option>
                        <option value="18">02/05 To 08/05</option>
                        <option value="19">09/05 To 15/05</option>
                        <option value="20">16/05 To 22/05</option>
                        <option selected="selected" value="21">23/05 To 29/05</option>
                        <option value="22">30/05 To 05/06</option>
                        <option value="23">06/06 To 12/06</option>
                        <option value="24">13/06 To 19/06</option>
                        <option value="25">20/06 To 26/06</option>
                        <option value="26">27/06 To 03/07</option>
                        <option value="27">04/07 To 10/07</option>
                        <option value="28">11/07 To 17/07</option>
                        <option value="29">18/07 To 24/07</option>
                        <option value="30">25/07 To 31/07</option>
                        <option value="31">01/08 To 07/08</option>
                        <option value="32">08/08 To 14/08</option>
                        <option value="33">15/08 To 21/08</option>
                        <option value="34">22/08 To 28/08</option>
                        <option value="35">29/08 To 04/09</option>
                        <option value="36">05/09 To 11/09</option>
                        <option value="37">12/09 To 18/09</option>
                        <option value="38">19/09 To 25/09</option>
                        <option value="39">26/09 To 02/10</option>
                        <option value="40">03/10 To 09/10</option>
                        <option value="41">10/10 To 16/10</option>
                        <option value="42">17/10 To 23/10</option>
                        <option value="43">24/10 To 30/10</option>
                        <option value="44">31/10 To 06/11</option>
                        <option value="45">07/11 To 13/11</option>
                        <option value="46">14/11 To 20/11</option>
                        <option value="47">21/11 To 27/11</option>
                        <option value="48">28/11 To 04/12</option>
                        <option value="49">05/12 To 11/12</option>
                        <option value="50">12/12 To 18/12</option>
                        <option value="51">19/12 To 25/12</option>
                        <option value="52">26/12 To 01/01</option>

</select>
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