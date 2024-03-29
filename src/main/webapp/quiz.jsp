<% String email = (String) request.getAttribute("email"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String topic_name = (String) request.getAttribute("topic_name"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Exam Portal</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <link rel="stylesheet" href="bootstrap/css/custom-theme.min.css">


    <!-- Latest compiled and minified JavaScript -->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <header>
        <jsp:include page="header.jsp" />
        <jsp:include page="nav_user.jsp">
            <jsp:param name="name" value="" />
        </jsp:include>
    </header>
    <form class="form-horizontal" method="post" action="Quiz">
        <fieldset>
            <legend>
                <div class="col-sm-9">Quiz - <%= topic_name%></div>
                <span id="timeleft" class="text-right"></span>
            </legend>
            <c:forEach items="${quiz_list}" var="quiz_ques" varStatus="loopCounter">
            <div class="quiz-ques form-group">
                <label class="col-lg-2 control-label">Question ${loopCounter.count}</label>
                <div class="col-lg-10 text-left">
                    <input type="hidden" value="${quiz_ques.id}" name="question${loopCounter.count}_id">
                    <h5>${quiz_ques.text}</h5>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="1">
                            ${quiz_ques.option1}                    </label><br>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="2">
                            ${quiz_ques.option2}                    </label><br>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="3">
                            ${quiz_ques.option3}                    </label><br>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="4">
                            ${quiz_ques.option4}                    </label>
                </div>
            </div>
            </c:forEach>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-5">
                    <button type="reset" class="btn btn-default">Reset</button>
                    <button type="submit" class="btn btn-primary">Submit your Quiz</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
<script>
    $('.nav-collapse').click('li', function () {
        $('.nav-collapse').collapse('hide');
    });

    var myVar = setInterval(function () {
        myTimer()
    }, 1000);
    var d = 600;
    var min, sec;

    function myTimer() {
        d--;
        min = parseInt(d / 60);
        sec = parseInt((d / 60 - min) * 59);
        document.getElementById("timeleft").innerHTML = min + " miunte " + sec + " second left";
    }
</script>
</html>