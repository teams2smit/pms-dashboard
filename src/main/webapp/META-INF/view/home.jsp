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

<%--    Bootstrap CSS--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>

    <jsp:include page="navbar.jsp" />
        
            <div class="row" style="margin: 15px;margin-top: 150px;margin-left: 50px;margin-right: 50px;">
                <div class="col container1">
                    <div class="card" style="margin-left: 18px;align-content: center;">
                        <img src="https://img.icons8.com/nolan/64/scan-stock.png" style="max-width: 60px;" class="card-img-">
                        <div class="card-body" style="margin-right: 1px;">
                        <h5 class="card-title" style="text-align: center;">Stock Service</h5>
                        <p class="card-text" style="text-align: center;">To get the details of all our medicine stock.</p>
                        <center><a href="/stock" class="btn btn-outline-primary">Check Stock</a></center>
                        </div>
                    </div>
                </div>
                <div class="col container1">
                    <div class="card" style="margin-left: 18px;align-content: center;">
                        <img src="https://img.icons8.com/nolan/64/medical-history.png" style="max-width: 60px;" class="card-img-top">
                        <div class="card-body" style="margin-right: 1px;">
                        <h5 class="card-title" style="text-align: center;">Schedule Service</h5>
                        <p class="card-text" style="text-align: center;">Scheduling meeting with the doctors.</p>
                        <center><a href="/schedule" class="btn btn-outline-primary">Generate Schedule</a></center>
                        </div>
                    </div>
                </div>
                <div class="col container1">
                    <div class="card" style="margin-left: 18px;align-content: center;">
                        <img src="https://img.icons8.com/nolan/64/pill.png" style="max-width: 60px;" class="card-img-top" alt="...">
                        <div class="card-body" style="margin-right: 1px;">
                        <h5 class="card-title" style="text-align: center;">Supply Service</h5>
                        <p class="card-text" style="text-align: center;">To supply the medicine stock from the pharmacy.</p>
                        <center><a href="/supply" class="btn btn-outline-primary">Goto Supply</a></center>
                        </div>
                    </div>
                </div>
                <div class="col container1">
                    <div class="card" style="margin-left: 30px;align-content: center;">
                        <img src="https://img.icons8.com/nolan/64/heart-monitor.png" style="max-width: 60px;" class="card-img-top">
                        <div class="card-body" style="margin-right: 1px;">
                        <h5 class="card-title" style="text-align: center;">Opening Hours</h5>
                        <p class="card-text" style="text-align: center;">
                            <table class="table table-borderless">
                                <thead>
                                  <tr>
                                    <th scope="col">Days</th>
                                    <th scope="col">Timing</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>Mon-Sat</td>
                                    <td>1PM to 3PM</td>
                                  </tr>
                                </tbody>
                              </table>
                        </p>
                        </div>
                    </div>
                </div>
            </div>
        
      <jsp:include page="footer.jsp" />
</body>
</html>