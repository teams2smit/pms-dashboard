<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <title>Dashboard</title>

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container mt-3">

    <h1  style="text-decoration: solid;font-weight: bold ;">Medicine Stock Details </h1>
    <br>

    <table class="table table-sm">
        <tr>
            <th>Id</th>
            <th>Medicine Name</th>
            <th>Ailment</th>
            <th>Composition</th>
            <th>Stock Count</th>
            <th>Expiry Date</th>
        </tr>

        <c:forEach items="${stockList}" var="medicine">
            <div class="mb-3">
                <tr>
                    <td>${medicine.id}</td>
                    <td>${medicine.medicineName}</td>
                    <td>${medicine.targetAilments}</td>
                    <td>${medicine.chemicalComposition}</td>
                    <td>${medicine.numbersOfTabletsInStock}</td>
                    <td>${medicine.dateOfExpiry}</td>
                </tr>
            </div>
        </c:forEach>


<%--        <%--%>
<%--            for(int i=0; i<25; i++)--%>
<%--            {--%>
<%--        %>--%>
<%--        <div class="mb-3">--%>
<%--            <tr>--%>
<%--                <td>test</td>--%>
<%--                <td>test</td>--%>
<%--                <td>test</td>--%>
<%--                <td>test</td>--%>
<%--                <td>test</td>--%>
<%--            </tr>--%>
<%--        </div>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>

    </table>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>