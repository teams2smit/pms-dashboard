<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Supply</title>

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

    <%--    Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
                <div class="row">
                    <div class="col-3" style="margin-bottom: 25px;">

                        <form>
                            <p style="font-weight: normal ;font-size: 20px;margin-right: 18px;  text-align: center;"><b>Please
                                select the medicine you need</b></p>
                            <select name="medicine_name" multiple size="6" style="padding: 50px;margin-top: 45px;">

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
                        <center>
                            <p>
                                <button style="margin-top: 65px;border-radius: 60%;padding: 18px; width: 60px; color: rgb(0, 60, 255);
                                text-align: center;cursor: pointer; font-weight: bold;" type="submit"
                                        class="btn btn-outline-primary"> >
                                </button>
                            </p>
                        </center>
                        </form>

                    </div>


                    <div class="col-6">
                        <%
                            String clrs[] = request.getParameterValues("medicine_name");
                            if (clrs != null) {
                        %>
                        <p style="font-weight: normal ;font-size: 20px;margin-left: 20px;  text-align: center;margin-bottom: 25px;">
                            <b>You have selected the following medicines</b></p>
                        <ul>
                            <%
                                for (int i = 0; i < clrs.length; i++) {
                            %>
                            <div class="mb- 3">
                                <label for="exampleFormControlInput1" class="form-label">Demand Count for <%=clrs[i]%>
                                </label>
                                <input type="text" class="form-control" id="exampleFormControlInput1"
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
                        <div class="mb-3">
                            <center>
                                <button style="padding-left: 30px;padding-right: 30px;margin-top: 30px;height: 45px;"
                                        type="submit" class="btn btn-outline-primary">Submit Demand
                                </button>
                            </center>
                        </div>

                    </div>

                </div>


            </div>

        </div>


    </div>

    <jsp:include page="footer.jsp"/>
</body>
</html>