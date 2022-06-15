<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Added</title>
        <script>
            var count = 3;
            function redirect()
            {
                count--;
                document.getElementById('timer').innerHTML = count;
                if(count <= 0)
                {
                    window.location.href = 'Schedule';
                }
            }
            setInterval(redirect,1000);
        </script>
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
        <!--${requestScope.action}-->
        Attendance has been taken to DB <br/>
        Redirect to Schedule page after <span id="timer">3</span> seconds!
    </body>
</html>
