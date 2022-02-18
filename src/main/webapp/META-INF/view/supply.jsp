<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <title>Dashboard</title>

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp" />
<div class="container">

    <h1 style="text-decoration: solid;font-weight: bold;">Pharmacy Demand Details</h1>
    <br>

    <div style="padding: 60px;">
        <div class="row">
            <div class="col-3">

                <form >
                    <p><b>Please select the medicine you need</b></p>
                    <select name="medicine_name" multiple size="6" style="padding: 50px;">

                        <option>DOLO-650</option>
                        <option>Gaviscon</option>
                        <option>Orthoherb</option>
                        <option>Cholecalciferol</option>
                        <option>Cyclopam</option>
                        <option>Hilact</option>

                    </select>
                    <br>
                    <br>

            </div>

            <div class="col-2">
                <br>
                <br>
                <br><br>
                <p><button style="margin-top: 40px;" type="submit" class="btn btn-dark" > >>> </button></p>
                </form>

            </div>


            <div class="col-6">
                <%
                    String clrs[] = request.getParameterValues("medicine_name");
                    if(clrs != null)
                    {
                %>
                <p><b>You have selected the following medicines</b></p>
                <ul>
                    <%
                        for(int i=0; i<clrs.length; i++)
                        {
                    %>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Demand Count for <%=clrs[i]%></label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Enter Count">
                    </div></p>
                    <%
                        }
                    %>
                </ul>
                <%
                    }
                %>
            </div>

        </div>

        <div>
            <center><button style="padding-left: 30px;padding-right: 30px;margin-top: 10px;" type="submit" class="btn btn-dark">Submit Demand</button></center>
        </div>



    </div>




</div>
<jsp:include page="footer.jsp" />
</body>
</html>