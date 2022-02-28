<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="background-color: #e3f2fd;box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 
0 10px 10px rgba(0, 0, 0, 0.25);"> <!-- bg-light" >-->
    <div class="container">
        <a href="#" class="navbar-brand"><b style="font-weight: bold;font-size: 22px;">PMS</b></a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav" style="font-weight: bold;font-size: 16px;">
                <a href="/" class="nav-item nav-link active">Home</a>
                <a href="/schedule" class="nav-item nav-link">Schedule</a>
                <a href="/stock" class="nav-item nav-link">Stock</a>
                <a href="/supply" class="nav-item nav-link">Supply</a>
                <a href="/history" class="nav-item nav-link">History</a>
            </div>
            <div class="navbar-nav ms-auto">
                <h5 class="nav-item nav-link" style="margin-right:15px;"><b>${username}</b></h5>
                
                <a href="/logout"><input type="button" class="btn btn-dark" value="Logout" /> </a>
            </div>
        </div>
    </div>
</nav>