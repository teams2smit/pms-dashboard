<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

    <title>Dashboard</title>

    <script type="text/javascript" src="${pageContext.servletContext.contextPath}/src/main/resources/static/js/jquery-3.6.0.min.js"></script>

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <script type="text/javascript">

        $.ajax("http://localhost:8084/MedicineStockInformation",
        success: function(res) => {
            console.log(res);
        } )

    </script>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container">

    <h1 style="text-decoration: solid;font-weight: bold;">Pharmacy Demand Details</h1>
    <br>

    <div>
        <form:form method="get" modelAttribute="MedicineDemandContainer">

            <table>
                <thead>
                <tr>
                    <td>Hello</td>
                </tr>
                <tr>
                    <td>Hello</td>
                </tr>
                </thead>
            </table>

            <select id="medicine_name" onchange="alert('changed'); " name="medicine_name" multiple size="6" style="padding: 50px;">
                <c:forEach items="${MedicineDemandContainer.medicineDemandList}" var="s">
                    <option value="${s.medicineName}">${s.medicineName}</option>
                </c:forEach>
            </select>

        </form:form>
    </div>

    <div style="padding: 60px;">
        <div class="row">
            <div class="col-3">

                <form>
                    <p><b>Please select the medicine you need</b></p>
                    <select id="medicine_name" name="medicine_name" multiple size="6" style="padding: 50px;">
                        <c:forEach items="${stockList}" var="s">
                            <option value="${s.medicineName}">${s.medicineName}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <br>

                    <div class="col-2">
                        <br>
                        <br>
                        <br><br>
                        <p>
<%--                            <button style="margin-top: 40px;" class="btn btn-dark"> >>></button>--%>
                        </p>
                    </div>


                    <div class="col-6">

                        <%
                            String medicineNames[] = request.getParameterValues("medicine_name");

                            if (medicineNames != null) {
                        %>
                        <p><b>You have selected the following medicines</b></p>
                        <ul>
                            <%
                                for (int i = 0; i < medicineNames.length; i++) {
                            %>
                            <div class="mb-3">
                                <label for="${i}" class="form-label">Demand Count for: <%= medicineNames[i] %>
                                </label>
                                <input name="medicineName" value="<%= medicineNames[i]%>" type="text"
                                       class="form-control" hidden>
                                <input name="demandCount" type="text" class="form-control" id="${i}"
                                       placeholder="Enter Count">
                            </div>
                            </p>
                            <%
                                }
                            %>
                        </ul>
                        <%
                            }
                        %>
                    </div>


                    <div>
                        <center>
                            <button style="padding-left: 30px;padding-right: 30px;margin-top: 10px;" type="submit"
                                    class="btn btn-dark">Submit Demand
                            </button>
                        </center>
                    </div>
                </form>

            </div>


        </div>

    </div>
    <jsp:include page="footer.jsp"/>


</body>
</html>