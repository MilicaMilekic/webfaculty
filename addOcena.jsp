<%-- 
    Document   : addOcena
    Created on : Sep 23, 2020, 5:32:21 PM
    Author     : Super User
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Dodaj ocenu</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">


    <nav class="navbar navbar-expand-lg navbar-dark justify-content-between" style="background-color: gray;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="http://localhost:8080/fakultetZP/admin.jsp">Pocetna strana</a>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/fakultetZP/adminProfesor.jsp">Profesori<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/fakultetZP/adminStudent.jsp">Studenti<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/fakultetZP/adminOcena.jsp">Ocene<span class="sr-only">(current)</span></a>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Funkcije
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="http://localhost:8080/fakultetZP/addStudent.jsp">Dodaj studenta</a>
                        <a class="dropdown-item" href="http://localhost:8080/fakultetZP/addProfesor.jsp">Dodaj profesora</a>
                        <a class="dropdown-item" href="http://localhost:8080/fakultetZP/addOcena.jsp">Dodaj ocenu</a>
                    </div>
                </li>

            </ul>
        </div>
    </nav>

</head>

<body style="background-color:lightgray; font: black">
    <form method="post">
        <table class="table table-striped table-dark">
            <thead>
                <tr>
                    <td scope="col">Ocena</td>
                    <td scope="col">ID Studenta</td>
                    <td scope="col">ID Predmeta</td>
                    <td scope="col">ID Profesora</td>
                    <td scope="col"></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td scope="col"><input type="text" name="oce_ocena" id="oce_ocena"></td>
                    <td scope="col"><input type="text" name="std_id" id="std_id"></td>
                    <td scope="col"><input type="text" name="pre_id" id="pre_id"></td>
                    <td scope="col"><input type="text" name=pro_id id="pro_id"></td>
                    <td scope="col" value="Dodaj" id="dodajO"><button type="button" class="btn btn-outline-primary">DODAJ</button></td>
                </tr>
            </tbody>
        </table>
    </form>

    <script>
        $(document).ready(function () {
            $("#dodajO").click(function () {
                alert("succeess");
                $.ajax({
                    url: "addOcenaProcess.jsp",
                    type: "post",
                    data: {
                        oce_ocena: $('#oce_ocena').val(),
                        std_id: $('#std_id').val(),
                        pre_id: $('#pre_id').val(),
                        pro_id: $('#pro_id').val(),
                        success: function (data) {
                            alert(data);
                            location.reload();
                        }
                    }
                });
            });
        });
    </script>


</body>
</html>
