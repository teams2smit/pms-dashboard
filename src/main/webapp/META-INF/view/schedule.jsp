<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Schedule Management</title>
  
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
        
    <div class="container mt-3">

        <h1 style="text-decoration: solid; margin-top: 50px; font-weight: bold ;font-size: 50px;">Representative Schedule</h1>
        <br>
        <div class="container1" style="padding: 35px;">
            <table class="table table-sm" style="height: 30px;">
                    <tr class="bg-primary" style="line-height: 50px;font-size: 22px;color: #fff;">
                        <th>Rep name</th>
                        <th>Doctor name</th>
                        <th>Treating Ailment</th>
                        <th>Medicine</th>
                        <th>Slot</th>
                        <th>Date</th>
                        <th>Doctor Contact</th>
                    </tr>
        
                    <c:forEach items="${scheduleList}" var="s">
                        <div class="mb-3">
                            <tr class="table-light" style="opacity: 0.68;line-height: 36px; font-weight: bold;">
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
     
                </div>
            </table>

    </div>
        
    <jsp:include page="footer.jsp" />
</body>
</html>