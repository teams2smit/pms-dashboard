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

    <h1 style="text-decoration: solid;font-weight: bold;">Demand And Supply Tracking</h1>
    <br>

    <div>
        <table class="table table-sm">
            <tr>
                <th>ID</th>
                <th>Pharmacy Name</th>
                <th>Medicine Name</th>
                <th>Demand Count</th>
                <th>Supply Count</th>
                <th>Date</th>
            </tr>

            <c:forEach items="${history}" var="m">
                <div class="mb-3">
                    <tr>
                        <td>${m.id}</td>
                        <td>${m.pharmacyName}</td>
                        <td>${m.medicineName}</td>
                        <td>${m.demandCount}</td>
                        <td>${m.supplyCount}</td>
                        <td>${m.orderDate}</td>
                    </tr>
                </div>
            </c:forEach>
        </table>
    </div>


    <jsp:include page="footer.jsp"/>


</body>
</html>