<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <title>Book Schedule</title>

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container">

    <h1  style="text-decoration: solid;font-weight: bold;">Representative Schedule</h1>
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

        <%
            for(int i=0; i<13; i++)
            {
        %>
        <div class="mb-3">
            <tr>
                <td>test</td>
                <td>tests</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
            </tr>
        </div></p>
        <%}
        %>


    </table>

</div>
<jsp:include page="footer.jsp" />
</body>
</html>