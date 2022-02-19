<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <title>Book Schedule</title>

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container mt-3">

    <h1 style="text-decoration: solid;font-weight: bold;">Representative Schedule</h1>
    <br>

    <table class="table table-sm">
        <tr>
            <th>Rep name</th>
            <th>Doctor name</th>
            <th>Treating Ailment</th>
            <th>Medicine</th>
            <th>Slot</th>
            <th>Date</th>
            <th>Doctor Contact #</th>
        </tr>

        <c:forEach items="${scheduleList}" var="s">
            <div class="mb-3">
                <tr>
                    <td>${s.representativeName}</td>
                    <td>${s.doctorName}</td>
                    <td>${s.treatingAilment}</td>
                    <td>${s.medicines}</td>
                    <td>${s.slot}</td>
                    <td>${s.date}</td>
                    <td>${s.contactNumber}</td>
                </tr>
            </div>
        </c:forEach>
    </table>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>