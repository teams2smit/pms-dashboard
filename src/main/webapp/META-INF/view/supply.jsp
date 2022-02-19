<%@ page import="com.smitppatel35.dashboard.dto.MedicineDemand" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

    <title>Dashboard</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>
<body>
<%!
    private Object List;
%>
<jsp:include page="navbar.jsp"/>
<div class="container mt-3">

    <h1 style="text-decoration: solid;font-weight: bold;">Pharmacy Demand Details</h1>
    <br>


    <div style="padding: 60px;">

        <div class="row">
            <div class="col">
                    <select id="getList" class="form-select form-select-md" size="6" name="medicines" multiple>
                    </select>
            </div>

            <div class="col-md-auto">
                <input type="button" id="callList" class="btn btn-dark mt-2" value=">>>"/>
            </div>


            <div class="col-6">
                <form id="subForm" action="/demand" method="get">

                    <p><b>You have selected the following medicines</b></p>

                    <div id="selectedMedicines"></div>


                </form>

            </div>
        </div>
        <div class="row justify-content-center">
            <input type="submit" style="padding-left: 30px;padding-right: 30px;margin-top: 10px;"
                   value="Submit"
                   class="btn btn-lg btn-dark col-8">
        </div>

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

        });
    </script>


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
                for(var i=0;i<t.length;i++){

                    html +=
                        '<h5 class="form-label mt-2"> Demand Count for: <b>'+ t[i].text + '</b></h5>'
                    +   '<input class="form-control" name="medicine'+ i +'" type="number" required />'
                    ;

                }
                $("#selectedMedicines").append(
                    html
                );
            });
        })

    </script>
    <jsp:include page="footer.jsp"/>


</body>
</html>