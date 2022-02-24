<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

    <title>Pharmacy Supply</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

        * {
            box-sizing: border-box;
        }

        body {
            justify-content: center;
            font-family: 'Montserrat', sans-serif;
            background-image: url("images/dashimg.jpg");
            background-size: cover;
        }

        .card {
            align-items: center;
            align-content: center;
            margin: 40px;
        }

        .container1 {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 14px 28px rgba(25, 0, 255, 0.25),
            0 10px 10px rgba(25, 0, 255, 0.25);
            position: relative;
            overflow: hidden;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container mt-3">

    <h1 style="text-decoration: solid; margin-top: 50px; font-weight: bold ;font-size: 50px;margin-left: 28px;">Pharmacy
        Demand Details</h1>
    <br>

    <div class="container">
        <div class="container1">
            <div style="padding: 60px;">
                <form id="subForm" action="/demand" method="post">
                    <div class="row">
                        <div class="col-4" style="margin-bottom: 25px;">
                            <p style="font-weight: normal ;font-size: 20px;margin-right: 18px;  text-align: center;"><b>Please
                                select the medicine you need</b></p>
                            <select id="getList" class="form-select" size="10" name="medicines" multiple
                                    style="margin-top: 45px;">
                            </select>
                        </div>

                        <div class="col-md-auto">
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <input id="callList" style="margin-top: 65px;border-radius: 60%;padding: 18px; width: 60px; color: rgb(0, 60, 255);
                                text-align: center;cursor: pointer; font-weight: bold;"
                                   class="btn btn-outline-primary" value=">" readonly>
                        </div>

                        <div class="col-6">
                            <p style="font-weight: normal ;font-size: 20px;margin-left: 20px;  text-align: center;margin-bottom: 25px;">
                                <b>You have selected the following medicines</b></p>
                            <div id="selectedMedicines"></div>

                            <center>
                                <input id="submit" type="button"
                                       style="padding-left: 30px;padding-right: 30px;margin-top: 30px;height: 45px;"
                                       value="Submit"
                                       class="btn btn-outline-primary">
                            </center>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>


    <script type="text/javascript">

        $(document).ready(function () {
            <c:forEach items="${stockList}" var="r" varStatus="status">
            $("#getList").append($('<option>', {
                value: <c:out value='${r.id}'/>,
                text: "<c:out value='${r.medicineName}'/>"
            }));
            </c:forEach>
        });

        $(document).ready(function () {
            $("#callList").click(function () {
                $("#selectedMedicines").empty();

                var t = $("#getList option:selected");

                var html = "";
                for (var i = 0; i < t.length; i++) {

                    html +=
                        '<h5 class="form-label mt-2"> Demand Count for: <b>' + t[i].text + '</b></h5>'
                        + '<input class="form-control" name="' + t[i].text + '" type="number" required />'
                    ;

                }
                $("#selectedMedicines").append(
                    html
                );
            });

            $("#submit").click(function () {
                var formInputs = $("#subForm input.form-control");
                let data = new Array();

                for (var i = 0; i < formInputs.length; i++) {
                    var med = {
                        "medicineName": formInputs[i].name,
                        "demandCount": formInputs[i].valueAsNumber
                    };

                    data.push(med);
                }

                $.post({
                    url: '/demand',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (res) {
                        alert("Demand submitted successfully");

                        window.location.reload();

                    }
                });
            });
        });

    </script>
    <jsp:include page="footer.jsp"/>

</div>
</body>
</html>