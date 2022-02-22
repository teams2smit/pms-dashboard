<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PMS Dashboard</title>
  
    <style>
        
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

        * {
            box-sizing: border-box;
        }

        body {
            justify-content: center;
            font-family: 'Montserrat', sans-serif;
            background-image:url("images/dashimg.jpg");
            background-size: cover;
        }

        

        .card{
            align-items: center;
            align-content: center;
            margin: 40px;
        }
        .imgdash{
          
            
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

    <script >

    </script>


<%--    Bootstrap CSS--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>

    <jsp:include page="navbar.jsp" />
        
    <%!
    private Object List;
%>

<div class="container mt-3">

    <h1 style="text-decoration: solid; margin-top: 50px; font-weight: bold ;font-size: 50px;">Pharmacy Demand Details</h1>
    <br>


    <div style="padding: 60px;">
        <form id="subForm" action="/demand" method="post">
            <div class="row">
                <div class="col">
                    <select id="getList" class="form-select form-select-md" size="6" name="medicines" multiple>
                    </select>
                </div>

                <div class="col-md-auto">
                    <input type="button" id="callList" class="btn btn-dark mt-2" value=">>>"/>
                </div>

                <div class="col-6">
                    <p><b>You have selected the following medicines</b></p>
                    <div id="selectedMedicines"></div>
                </div>
            </div>

            <div class="row justify-content-center">
                <input id="submit" type="button" style="padding-left: 30px;padding-right: 30px;margin-top: 10px;"
                       value="Submit"
                       class="btn btn-lg btn-dark col-8">
            </div>

        </form>

        <%--                <form id="myForm">--%>
        <%--                    <p><b>Please select the medicine you need</b></p>--%>
        <%--                    <select id="medicine_name" name="medicine_name" multiple size="6" style="padding: 50px;">--%>
        <%--                        <c:forEach items="${stockList}" var="s">--%>
        <%--                            <option value="${s.medicineName}">${s.medicineName}</option>--%>
        <%--                        </c:forEach>--%>
        <%--                    </select>--%>
        <%--                    <br>--%>
        <%--                    <br>--%>

        <%--                    <div class="col-2">--%>
        <%--                        <br>--%>
        <%--                        <br>--%>
        <%--                        <br><br>--%>
        <%--                        <p>--%>
        <%--                            <button style="margin-top: 40px;" class="btn btn-dark"> >>></button>--%>
        <%--                        </p>--%>
        <%--                    </div>--%>


        <%--                    <div class="col-6">--%>

        <%--                        <%--%>
        <%--                            String medicineNames[] = request.getParameterValues("medicine_name");--%>

        <%--                            if (medicineNames != null) {--%>
        <%--                        %>--%>
        <%--                        <p><b>You have selected the following medicines</b></p>--%>
        <%--                        <ul>--%>
        <%--                            <%--%>
        <%--                                for (int i = 0; i < medicineNames.length; i++) {--%>
        <%--                            %>--%>
        <%--                            <div class="mb-3">--%>
        <%--                                <label for="${i}" class="form-label">Demand Count for: <%= medicineNames[i] %>--%>
        <%--                                </label>--%>
        <%--                                <input name="medicineName" value="<%= medicineNames[i]%>" type="text"--%>
        <%--                                       class="form-control" hidden>--%>
        <%--                                <input name="demandCount" type="text" class="form-control" id="${i}"--%>
        <%--                                       placeholder="Enter Count">--%>
        <%--                            </div>--%>
        <%--                            </p>--%>
        <%--                            <%--%>
        <%--                                }--%>
        <%--                            %>--%>
        <%--                        </ul>--%>
        <%--                        <%--%>
        <%--                            }--%>
        <%--                        %>--%>
        <%--                    </div>--%>


        <%--                    <div>--%>
        <%--                        <center>--%>
        <%--                            <button style="padding-left: 30px;padding-right: 30px;margin-top: 10px;" type="submit"--%>
        <%--                                    class="btn btn-dark">Submit Demand--%>
        <%--                            </button>--%>
        <%--                        </center>--%>
        <%--                    </div>--%>
        <%--                </form>--%>


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

                // console.log("Sending AJAX Request");

                $.post({
                    url: '/demand',
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    success: function (res) {

                        console.log(<c:out value="${outOfStock}" />);
                    }
                });

                // console.log(data);

            });
        });

    </script>
        
    <jsp:include page="footer.jsp" />
</body>
</html>