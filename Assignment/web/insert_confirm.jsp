<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Added</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <li> <a href="Report">Attendance Report</a></li>
            </ul>
        </nav>
        <div class="container">
            <div class="row">
                <div id="ctl00_divUser" style="float: right; margin-right: 16px;">
                    <span id="ctl00_lblCampusName" class="label label-success"> CAMPUS: FPTU-Hòa Lạc</span>
                    <span id="ctl00_lblCampusName" class="label label-success">${sessionScope.account.username}</span>
                    <form action="Logout" method="post" style="display: flex; max-width: 200px; right: 0; ">
                        <input type="submit" value="Logout">
                    </form>
                </div>    
            </div>
        </div>
        <!--${requestScope.action}-->
        Attendance has been taken to DB <br/>
        Redirect to Schedule page after <span id="timer">3</span> seconds!
    </body>
</html>
